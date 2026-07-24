#include <stdio.h>
#include "platform.h"
#include "xil_printf.h" 
#include <complex.h>
#include <math.h>
#include <string.h>
#include <stdlib.h>

#include "xaxidma.h"
#include "xparameters.h"
#include "xtime_l.h"
#include "xtrigger_ip.h"

#include "tw_1024.h"
/* #include "input.h" */

#define N 512

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

#define SPEED_LIGHT 3e8
#define CARRIER_FREQ 30e9
#define WAVELENGTH_M (SPEED_LIGHT / CARRIER_FREQ)
#define SAMPLING_FREQ 300e6

#define NSAMP 512
#define FIFO_SIZE 32768
#define NUM_BATCHES 8
#define NUM_SNR 16
#define NUM_MONTE_CARLO 50

#define TOTAL_BYTES (FIFO_SIZE * NUM_BATCHES * 8)
#define BATCH_BYTES (FIFO_SIZE * 8)

/* STEPS
 *   input generation
 *   dma init
 *   dma config and polling
 *   verify outputs
 *   get execution time
 */

float complex corr_output_pl[512] __attribute__((aligned(64))) = {0}; // input to doppler ip
float complex corr_output_map[512][256] __attribute__((aligned(64))) = {0}; // input to doppler ip
float complex range_dopp_map[512][256] __attribute__((aligned(64))) = {0}; //output of doppler ip
float complex channel_output[256][1024] = {0};
float complex trigger_output[256][1024] __attribute__((aligned(64))) = {0};
float complex trigger_output_512[256][512] __attribute__((aligned(64))) = {0};

const int zc_length = 1024;
const int PPB_Z = FIFO_SIZE / zc_length;   // 32 
const int TPZ = PPB_Z * NUM_BATCHES;       // 512 
const float PRI_Z = (float)zc_length / SAMPLING_FREQ;
const float PRF_Z = 1.0 / PRI_Z;

const float FD_SCALE = 2.0 * CARRIER_FREQ / SPEED_LIGHT; // factor for converting velocity to doppler frequency
const float R_BIN = SPEED_LIGHT / (2.0 * SAMPLING_FREQ); // range resolution
const int V_OFFSET = 128; // range velocity offset for ZC
const float V_BIN = (PRF_Z / TPZ) * (WAVELENGTH_M / 2.0);

XAxiDma_Config *dma_config_corr;
XAxiDma_Config *dma_config_dopp;

XAxiDma dma_instance_corr;
XAxiDma dma_instance_dopp;


/* int snr_levels[NUM_SNR] = {-30}; */
int snr_levels[NUM_SNR] = {-45, -44, -43, -42, -41, -40, -39, -38, -37, -36, -35, -34 ,-33, -32, -31, -30};

// UTIL FUNCTIONS <<<

// Faster random number generation
static uint32_t rng_state;
static inline void rng_init(uint32_t s) { rng_state = s ? s : 123456789u; }
static inline uint32_t rng_next(void) { // xor-shift
    uint32_t x = rng_state;
    x ^= x << 13;
    x ^= x >> 17;
    x ^= x << 5;
    return (rng_state = x);
}
static inline float rng_float(void) {
    return (float)rng_next() / (float)0xFFFFFFFFu;
}

// Fast Fourier Transform
static void fft_fast(float complex *x, int len, TwiddleTable *t, int inverse) {

    // bit reversal
    uint16_t *brl = t->br_lut;
    for (int i = 0; i < len; i++) {
        int rev = brl[i];
        if (rev > i) {
            float complex tmp = x[i];
            x[i] = x[rev];
            x[rev] = tmp;
        }
    }

    // butterfly stages
    int ti = 0;
    for (int s = 1; s <= t->bits; s++) {
        int m = 1 << s;
        int m2 = m >> 1;
        for (int k = 0; k < len; k += m) {
            for (int j = 0; j < m2; j++) {
                float complex tw = t->tw[ti + j];
                float complex tm = tw * x[k + j + m2];
                float complex u = x[k + j];
                x[k + j] = u + tm;
                x[k + j + m2] = u - tm;
            }
        }
        ti += m2;
    }

    if (inverse) {
        float inv = 1.0 / len;
        for (int i = 0; i < len; i++)
            x[i] *= inv;
    }
}

// multiply by e^(-jwa) in the frequency domain to apply delay
// x(t) -> x(t-a)
static void apply_delay_precomp(const float complex *restrict freq_template,
                                float complex *restrict out, int len,
                                float delay, TwiddleTable *t_inv) {

    float phase_step = -2.0 * M_PI * delay / len;
    float complex step = cexp(I * phase_step);

    int half = len >> 1;

    float complex p = 1.0;
    for (int k = 0; k <= half; k++) {
        out[k] = freq_template[k] * p;
        p *= step;
    }

    int ks_start = (half + 1) - len;
    float complex pn = cexp(I * phase_step * ks_start);
    for (int k = half + 1; k < len; k++) {
        out[k] = freq_template[k] * pn;
        pn *= step;
    }

    fft_fast(out, len, t_inv, 1);
}

// Additive white gaussian noise
static void add_awgn_polar(float complex *signal, int len, float noise_std) {
    int i = 0;
    while (i < len) {
        float u = rng_float() * 2.0 - 1.0;
        float v = rng_float() * 2.0 - 1.0;
        float w = u * u + v * v;
        if (w >= 1.0 || w == 0.0)
            continue;
        float fac = noise_std * sqrt(-2.0 * log(w) / w);
        signal[i] += fac * u + I * fac * v;
        i++;
    }
}

static void add_awgn_measured(float complex *signal, int len, float snr_db)
{
    // measure actual signal power
    float power = 0.0;
    for(int i = 0; i < len; i++)
        power += creal(signal[i]) * creal(signal[i]) +
                 cimag(signal[i]) * cimag(signal[i]);
    power /= len;

    // compute noise std from measured power and SNR
    float snr_linear = pow(10.0, snr_db / 10.0);
    float noise_std = sqrt(power / (2.0 * snr_linear));

    // add noise
    add_awgn_polar(signal, len, noise_std);
}/*>>>*/

void trigger_ip()/*<<<*/
{

    int status;

    /* Trigger IP Init & config <<< */
    XTrigger_ip_Config *trig_config;
    XTrigger_ip trig_ip;

    trig_config = XTrigger_ip_LookupConfig(XPAR_TRIGGER_IP_0_DEVICE_ID);
    status = XTrigger_ip_CfgInitialize(&trig_ip, trig_config);
    if(status != XST_SUCCESS)
    {
        printf("TRIG IP Config Failed!\n");
        return;
    }

    XTrigger_ip_EnableAutoRestart(&trig_ip);
    XTrigger_ip_Start(&trig_ip);

    XTrigger_ip_Set_sync_reset(&trig_ip, 1);
    XTrigger_ip_Set_sync_reset(&trig_ip, 0);

    /* >>> */

    /* DMA Init <<< */
    XAxiDma_Config *dma_config_trig;
    XAxiDma dma_instance_trig;

    dma_config_trig = XAxiDma_LookupConfig(XPAR_AXI_DMA_0_DEVICE_ID);
    status = XAxiDma_CfgInitialize(&dma_instance_trig, dma_config_trig);
    if(status != XST_SUCCESS)
    {
        printf("[TRIG] DMA Config Failed!\n");
        return;
    }

    /* >>> */

    /* DMA polling (TRIGGER) <<< */
    XTime pl_start_trig, pl_end_trig;

    {
        Xil_DCacheFlushRange((UINTPTR)channel_output, sizeof(channel_output));

        XTime_GetTime(&pl_start_trig);

        status = XAxiDma_SimpleTransfer(&dma_instance_trig, (UINTPTR)channel_output, TOTAL_BYTES, XAXIDMA_DMA_TO_DEVICE);
        if (status != XST_SUCCESS) { printf("ERROR: Tx Transfer Failed!\n"); return; }

        for (int batch = 0; batch < NUM_BATCHES; batch++) {

            /* UINTPTR current_rx_address = (UINTPTR)(trigger_output + (batch * FIFO_SIZE)); */
            UINTPTR current_rx_address = (UINTPTR)trigger_output + (batch * BATCH_BYTES);

            status = XAxiDma_SimpleTransfer(&dma_instance_trig, current_rx_address, BATCH_BYTES, XAXIDMA_DEVICE_TO_DMA);
            if (status != XST_SUCCESS) {
                printf("ERROR: Rx Transfer Failed on Batch %d!\n", batch);
                return;
            }

            while (XAxiDma_Busy(&dma_instance_trig, XAXIDMA_DEVICE_TO_DMA));
            /* printf(" -> Batch %2d successfully received! (32,768 samples)\n", batch + 1); */
        }

        // Wait for Tx to completely finish its side
        while (XAxiDma_Busy(&dma_instance_trig, XAXIDMA_DMA_TO_DEVICE));
        /* printf("DMA Tx Complete.\n"); */

        // Disable AutoRestart so it can safely lock down
        XTrigger_ip_DisableAutoRestart(&trig_ip);

        // Verify the IP locked itself natively

        while (XTrigger_ip_IsDone(&trig_ip) == 0);
        /* printf("Trigger IP reported ALL 8 BATCHES COMPLETE and is locked.\n"); */

        Xil_DCacheInvalidateRange((UINTPTR)trigger_output, sizeof(trigger_output));
    }

    XTime_GetTime(&pl_end_trig);
    /* >>> */
}/*>>>*/

void generate_input(float complex *ZC_FREQ, int snr_db, float true_r, float true_v)/*<<<*/
{

    int count = 0;

    // doppler frequency corresponding to the chosen velocity
    float fd = true_v * FD_SCALE;

    // phase rotation due to changing velocity
    float complex sample_step = cexp(I * 2.0 * M_PI * fd / SAMPLING_FREQ);
    float complex pulse_step = cexp(I * 2.0 * M_PI * fd * PRI_Z);

    // -- CAPTURE SAMPLES --

    // doppler phasor
    float complex pph_z = 1.0;
    float t_z = 0.0;

    for (int b = 0; b < NUM_BATCHES; b++) {

        // -- Zadoff Chu --

        for (int p = 0; p < PPB_Z; p++) 
        {
            // range for the current pulse
            float r_now = true_r + true_v * t_z;
            // round trip propagation delay
            float tau = 2.0 * r_now / SPEED_LIGHT;

            // apply delay
            float complex rx_zc[NSAMP * 2];
            apply_delay_precomp(ZC_FREQ, rx_zc, zc_length, tau * SAMPLING_FREQ, &tw_1024_inv);

            // apply doppler
            float complex sp = pph_z;
            for (int i = 0; i < zc_length; i++) {
                rx_zc[i] *= sp;
                sp *= sample_step;
            }

            // apply noise
            add_awgn_measured(rx_zc, zc_length, snr_db);

            for(int i = 0; i < 1024; i++)
                channel_output[count][i] = rx_zc[i];
            count++;

            // advance the absolute time and doppler phasor
            t_z += PRI_Z;
            pph_z *= pulse_step;
        }
    }

    // -- CLEANUP --
}/*>>>*/

struct RET_VALS
{
    float range;
    float velocity;

    XTime corr_time;
    XTime dopp_time;
};

struct RET_VALS corr_dopp()/*<<<*/
{

    /* PL Execution <<< */

    /* printf("Starting DMA...\n"); */

    /* DMA Init <<< */
    int status;

    /* >>> */

    /* DMA polling (CORRELATION) <<< */
    XTime pl_start_corr, pl_end_corr, total_corr = 0;

    /* printf("1\n"); */

    for(int i = 0; i < 256; i++)
    {
        Xil_DCacheFlushRange((UINTPTR)trigger_output_512[i], sizeof(trigger_output_512[i]));

        /* printf("2\n"); */

        XTime_GetTime(&pl_start_corr);

        /* printf("3\n"); */

        status = XAxiDma_SimpleTransfer(&dma_instance_corr, (UINTPTR)corr_output_pl, sizeof(corr_output_pl), XAXIDMA_DEVICE_TO_DMA);

        /* printf("4\n"); */
        status = XAxiDma_SimpleTransfer(&dma_instance_corr, (UINTPTR)trigger_output_512[i], sizeof(trigger_output_512[i]), XAXIDMA_DMA_TO_DEVICE);
        /* printf("5\n"); */

        // MM2S
        status = XAxiDma_ReadReg(XPAR_AXI_DMA_1_BASEADDR, 0x04) & 0x00000002;
        while (status != 0x00000002)
        {
            status = XAxiDma_ReadReg(XPAR_AXI_DMA_1_BASEADDR, 0x04) & 0x00000002;
        }
        /* printf("6\n"); */

        // S2MM
        status = XAxiDma_ReadReg(XPAR_AXI_DMA_1_BASEADDR, 0x34) & 0x00000002;
        while (status != 0x00000002)
        {
            status = XAxiDma_ReadReg(XPAR_AXI_DMA_1_BASEADDR, 0x34) & 0x00000002;
        }
        /* printf("7\n"); */

        XTime_GetTime(&pl_end_corr);
        
        /* printf("8\n"); */

        total_corr += (pl_end_corr - pl_start_corr);

        /* printf("9\n"); */

        Xil_DCacheInvalidateRange((UINTPTR)corr_output_pl, sizeof(corr_output_pl));

        /* printf("10\n"); */

        for(int j = 0; j < 512; j++)
        {
            corr_output_map[j][i] = corr_output_pl[j];
        }
    }

    /* printf("Starting doppler\n"); */

    /* >>> */

    /* DMA polling (DOPPLER) <<< */
    XTime pl_start_dopp, pl_end_dopp, total_dopp = 0;

    /* printf("11\n"); */

    for(int i = 0 ; i < 512; i++)
    {
        Xil_DCacheFlushRange((UINTPTR)corr_output_map[i], sizeof(corr_output_map[i]));

        /* printf("12\n"); */

        XTime_GetTime(&pl_start_dopp);

        /* printf("13\n"); */

        status = XAxiDma_SimpleTransfer(&dma_instance_dopp, (UINTPTR)range_dopp_map[i], sizeof(range_dopp_map[i]), XAXIDMA_DEVICE_TO_DMA);
        /* printf("14\n"); */
        status = XAxiDma_SimpleTransfer(&dma_instance_dopp, (UINTPTR)corr_output_map[i], sizeof(corr_output_map[i]), XAXIDMA_DMA_TO_DEVICE);
        /* printf("15\n"); */

        // MM2S
        status = XAxiDma_ReadReg(XPAR_AXI_DMA_2_BASEADDR, 0x04) & 0x00000002;
        while (status != 0x00000002)
        {
            status = XAxiDma_ReadReg(XPAR_AXI_DMA_2_BASEADDR, 0x04) & 0x00000002;
        }
        /* printf("16\n"); */

        // S2MM
        status = XAxiDma_ReadReg(XPAR_AXI_DMA_2_BASEADDR, 0x34) & 0x00000002;
        while (status != 0x00000002)
        {
            status = XAxiDma_ReadReg(XPAR_AXI_DMA_2_BASEADDR, 0x34) & 0x00000002;
        }
        /* printf("17\n"); */

        XTime_GetTime(&pl_end_dopp);

        /* printf("18\n"); */

        total_dopp += pl_end_dopp - pl_start_dopp;
        /* printf("19\n"); */

        Xil_DCacheInvalidateRange((UINTPTR)range_dopp_map[i], sizeof(range_dopp_map[i]));

        /* printf("20\n"); */

    }

    /* >>> */

    /* printf("DMA done\n"); */


    /* >>> */

    // PRINT INTERMEDIATE VALUES <<<

    /* for(int i = 0; i < 2; i++) */
    /* { */
    /*     for(int j = 0; j < 2048; j++) */
    /*     { */
    /*         printf("%f + (%f*I), ", crealf(input[i][j]), cimagf(input[i][j])); */
    /*     } */
    /*     printf("\n"); */
    /* } */

    /* for(int i = 0; i < 2; i++) */
    /* { */
    /*     for(int j = 0; j < 1024; j++) */
    /*     { */
    /*         printf("%f + (%f*I), ", crealf(corr_output_map[j][i]), cimagf(corr_output_map[j][i])); */
    /*     } */
    /*     printf("\n"); */
    /* } */

    /* for(int i = 0; i < 1024; i++) */
    /* { */
    /*     for(int j = 0; j < 256; j++) */
    /*     { */
    /*         printf("%f + (%f*I), ", crealf(range_dopp_map[i][j]), cimagf(range_dopp_map[i][j])); */
    /*     } */
    /*     printf("\n"); */
    /* } */

    // >>>

    // peak detection <<<
    float max_abs_sq = 0.0f;
    int range_idx = 0;
    int vel_idx = 0;

    for(int r = 0; r < 512; r++)
    {
        for(int v = 0; v < 256; v++)
        {
            float re = crealf(range_dopp_map[r][v]);
            float im = cimagf(range_dopp_map[r][v]);
            float absolute_sq = re*re + im*im;
            if(absolute_sq > max_abs_sq)
            {
                max_abs_sq = absolute_sq;
                range_idx = r;
                vel_idx = v;
            }
        }
    }
    /* printf("Range Index: %d\n", range_idx); */
    /* printf("Velocity Index: %d\n", vel_idx); */

    float range_estimate = range_idx * R_BIN;
    float vel_estimate = (vel_idx - V_OFFSET) * V_BIN;

    /* printf("Range Estimate: %f\n", range_estimate); */
    /* printf("Velocity Estimate: %f\n", vel_estimate); */

    struct RET_VALS ret = {range_estimate, vel_estimate, total_corr, total_dopp};

    return ret;
    // >>>
}/*>>>*/


int main(void)
{
    init_platform();

    // setup <<<

    rng_init(0);

    // Zadoff Chu Sequence Generation
    float complex zc_base[NSAMP];
    float complex zc_tx[NSAMP * 2];
    for (int i = 0; i < NSAMP; i++) {
        zc_base[i] = cexp(-I * M_PI * (float)i * (float)i / NSAMP);
        zc_tx[i] = zc_base[i];
        zc_tx[NSAMP + i] = zc_base[i];
    }

    // pre-compute frequency equivalents of ga,gb
    float complex *ZC_FREQ = calloc(zc_length, sizeof(float complex));
    memcpy(ZC_FREQ, zc_tx, zc_length * sizeof(float complex));
    fft_fast(ZC_FREQ, zc_length, &tw_1024_fwd, 0);
    // >>>

    // dma init <<<
    int status;

    dma_config_corr = XAxiDma_LookupConfig(XPAR_AXI_DMA_1_DEVICE_ID);
    dma_config_dopp = XAxiDma_LookupConfig(XPAR_AXI_DMA_2_DEVICE_ID);

    status = XAxiDma_CfgInitialize(&dma_instance_corr, dma_config_corr);
    if(status != XST_SUCCESS)
    {
        printf("[CORR] DMA Config Failed!\n");
        return -1;
    }

    status = XAxiDma_CfgInitialize(&dma_instance_dopp, dma_config_dopp);
    if(status != XST_SUCCESS)
    {
        printf("[DOPP] DMA Config Failed!\n");
        return -1;
    }

    // >>>

    XTime corr_time = 0;
    XTime dopp_time = 0;

    for (int s = 0; s < NUM_SNR; s++) {

        float err_rg = 0, err_vg = 0;

        for (int mc = 0; mc < NUM_MONTE_CARLO; mc++) {

            // randomly choose range and velocity of the target
            // range: [50, 200]
            // velocity: [-100, 100]
            float true_r = 50.0 + 150.0 * rng_float();
            float true_v = -100.0 + 200.0 * rng_float();

            /* printf("True Range: %f\n", true_r); */
            /* printf("True Velocity: %f\n", true_v); */

            generate_input(ZC_FREQ, snr_levels[s], true_r, true_v);

            trigger_ip();

            for(int i = 0; i < 256; i++)
            {
                for(int j = 0; j < 512; j++)
                {
                    trigger_output_512[i][j] = trigger_output[i][j];
                }
            }

            struct RET_VALS vals = corr_dopp();

            err_rg += (vals.range - true_r) * (vals.range - true_r);
            err_vg += (vals.velocity - true_v) * (vals.velocity - true_v);

            corr_time += vals.corr_time;
            dopp_time += vals.dopp_time;
        }

        printf("| %3d | %12.4f | %12.4f |\n", snr_levels[s], sqrt(err_rg / NUM_MONTE_CARLO), sqrt(err_vg / NUM_MONTE_CARLO));
    }

    // per snr, per mc time
    float scale = 1.0f / ((float)COUNTS_PER_SECOND * NUM_MONTE_CARLO * NUM_SNR);
    printf("Correlation Time: %f s\n", corr_time * scale);
    printf("Doppler Time: %f s\n", dopp_time * scale);

    // cleanup
    free(ZC_FREQ);

    cleanup_platform();
    return 0;
}
