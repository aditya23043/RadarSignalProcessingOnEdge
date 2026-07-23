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

#define N 1024

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

#define SPEED_LIGHT 3e8
#define CARRIER_FREQ 30e9
#define WAVELENGTH_M (SPEED_LIGHT / CARRIER_FREQ)
#define SAMPLING_FREQ 300e6

#define NSAMP 512
#define FIFO_SIZE 32768
#define NUM_BATCHES 16
#define NUM_SNR 16
#define NUM_MONTE_CARLO 50

#define TOTAL_BYTES (32768 * 16 * 8)
#define BATCH_BYTES (32768 * 8)

/* STEPS
 *   input generation
 *   dma init
 *   dma config and polling
 *   verify outputs
 *   get execution time
 */

float complex corr_output_pl[1024] __attribute__((aligned(32))) = {0}; // input to doppler ip
float complex corr_output_map[1024][256] __attribute__((aligned(32))) = {0}; // input to doppler ip
float complex range_dopp_map[1024][256] __attribute__((aligned(32))) = {0}; //output of doppler ip
float complex channel_output[256][2048] = {0};
float complex trigger_output[256][2048] = {0};

const int golay_length = 1024;
const int PPB_G = FIFO_SIZE / golay_length;// 32 pulses per batch (Ga+Gb pairs)
const int TPG = (PPB_G / 2) * NUM_BATCHES; // 256 — one column per Ga+Gb pair
const float PRI_G = (float)golay_length / SAMPLING_FREQ; // Pulse repition interval
const float PRF_PAIR = 1.0 / (2.0 * PRI_G); // pulse repitition frequency for both ga and gb
const float FD_SCALE = 2.0 * CARRIER_FREQ / SPEED_LIGHT; // factor for converting velocity to doppler frequency
const float R_BIN = SPEED_LIGHT / (2.0 * SAMPLING_FREQ); // range resolution
const int V_OFFSET = 128; // range velocity offset for golay
const float V_BIN = (PRF_PAIR / TPG) * (WAVELENGTH_M / 2.0); // velocity resolution


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
    XTime_GetTime(&pl_start_trig);

    {
        Xil_DCacheFlushRange((UINTPTR)channel_output, sizeof(channel_output));

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
        /* printf("Trigger IP reported ALL 16 BATCHES COMPLETE and is locked.\n"); */

        Xil_DCacheInvalidateRange((UINTPTR)trigger_output, sizeof(trigger_output));
    }

    XTime_GetTime(&pl_end_trig);
    /* >>> */
}/*>>>*/

void generate_input(float complex *GA_FREQ, float complex *GB_FREQ, int snr_db, float true_r, float true_v)/*<<<*/
{

    int count = 0;
    int is_ga = 1;

    // doppler frequency corresponding to the chosen velocity
    float fd = true_v * FD_SCALE;

    // phase rotation due to changing velocity
    float complex sample_step = cexp(I * 2.0 * M_PI * fd / SAMPLING_FREQ);
    float complex pulse_step = cexp(I * 2.0 * M_PI * fd * PRI_G);

    // -- CAPTURE SAMPLES --

    // doppler phasor
    float complex pph_g = 1.0;
    float t_g = 0.0;

    for (int b = 0; b < NUM_BATCHES; b++) {

        // -- GOLAY --

        for (int p = 0; p < PPB_G; p++) 
        {
            // Ga then Gb then Ga and so on...
            const float complex *TX_FREQ = (p % 2 == 0) ? GA_FREQ : GB_FREQ;

            // range for the current pulse
            float r_now = true_r + true_v * t_g;
            // round trip propagation delay
            float tau = 2.0 * r_now / SPEED_LIGHT;

            // apply delay
            float complex rx_pulse[NSAMP * 2];
            apply_delay_precomp(TX_FREQ, rx_pulse, golay_length,
                                tau * SAMPLING_FREQ, &tw_1024_inv);

            // Apply Doppler
            float complex sp = pph_g;
            for (int i = 0; i < golay_length; i++) {
                rx_pulse[i] *= sp;
                sp *= sample_step;
            }

            // Add noise
            add_awgn_measured(rx_pulse, golay_length, snr_db);


            if(is_ga)
            {
                for(int i = 0; i < 1024; i++)
                    channel_output[count][i] = rx_pulse[i];
                is_ga = 0;
            }
            else
            {
                for(int i = 0; i < 1024; i++)
                    channel_output[count][1024+i] = rx_pulse[i];
                is_ga = 1;
                count++;
            }

            // advance the absolute time and doppler phasor
            t_g += PRI_G;
            pph_g *= pulse_step;
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

    XAxiDma_Config *dma_config_corr;
    XAxiDma_Config *dma_config_dopp;

    XAxiDma dma_instance_corr;
    XAxiDma dma_instance_dopp;

    dma_config_corr = XAxiDma_LookupConfig(XPAR_AXI_DMA_1_DEVICE_ID);
    dma_config_dopp = XAxiDma_LookupConfig(XPAR_AXI_DMA_2_DEVICE_ID);

    status = XAxiDma_CfgInitialize(&dma_instance_corr, dma_config_corr);
    if(status != XST_SUCCESS)
    {
        printf("[CORR] DMA Config Failed!\n");
        return (struct RET_VALS){0,0};
    }

    status = XAxiDma_CfgInitialize(&dma_instance_dopp, dma_config_dopp);
    if(status != XST_SUCCESS)
    {
        printf("[DOPP] DMA Config Failed!\n");
        return (struct RET_VALS){0,0};
    }

    /* >>> */

    /* DMA polling (CORRELATION) <<< */
    XTime pl_start_corr, pl_end_corr;
    XTime_GetTime(&pl_start_corr);

    for(int i = 0; i < 256; i++)
    {
        Xil_DCacheFlushRange((UINTPTR)trigger_output[i], sizeof(trigger_output[i]));

        status = XAxiDma_SimpleTransfer(&dma_instance_corr, (UINTPTR)corr_output_pl, sizeof(corr_output_pl), XAXIDMA_DEVICE_TO_DMA);
        status = XAxiDma_SimpleTransfer(&dma_instance_corr, (UINTPTR)trigger_output[i], sizeof(trigger_output[i]), XAXIDMA_DMA_TO_DEVICE);

        // MM2S
        status = XAxiDma_ReadReg(XPAR_AXI_DMA_1_BASEADDR, 0x04) & 0x00000002;
        while (status != 0x00000002)
        {
            status = XAxiDma_ReadReg(XPAR_AXI_DMA_1_BASEADDR, 0x04) & 0x00000002;
        }

        // S2MM
        status = XAxiDma_ReadReg(XPAR_AXI_DMA_1_BASEADDR, 0x34) & 0x00000002;
        while (status != 0x00000002)
        {
            status = XAxiDma_ReadReg(XPAR_AXI_DMA_1_BASEADDR, 0x34) & 0x00000002;
        }

        Xil_DCacheInvalidateRange((UINTPTR)corr_output_pl, sizeof(corr_output_pl));

        for(int j = 0; j < 1024; j++)
        {
            corr_output_map[j][i] = corr_output_pl[j];
        }
    }

    XTime_GetTime(&pl_end_corr);
    /* >>> */

    /* DMA polling (DOPPLER) <<< */
    XTime pl_start_dopp, pl_end_dopp;
    XTime_GetTime(&pl_start_dopp);

    for(int i = 0 ; i < 1024; i++)
    {
        Xil_DCacheFlushRange((UINTPTR)corr_output_map[i], sizeof(corr_output_map[i]));

        status = XAxiDma_SimpleTransfer(&dma_instance_dopp, (UINTPTR)range_dopp_map[i], sizeof(range_dopp_map[i]), XAXIDMA_DEVICE_TO_DMA);
        status = XAxiDma_SimpleTransfer(&dma_instance_dopp, (UINTPTR)corr_output_map[i], sizeof(corr_output_map[i]), XAXIDMA_DMA_TO_DEVICE);

        // MM2S
        status = XAxiDma_ReadReg(XPAR_AXI_DMA_2_BASEADDR, 0x04) & 0x00000002;
        while (status != 0x00000002)
        {
            status = XAxiDma_ReadReg(XPAR_AXI_DMA_2_BASEADDR, 0x04) & 0x00000002;
        }

        // S2MM
        status = XAxiDma_ReadReg(XPAR_AXI_DMA_2_BASEADDR, 0x34) & 0x00000002;
        while (status != 0x00000002)
        {
            status = XAxiDma_ReadReg(XPAR_AXI_DMA_2_BASEADDR, 0x34) & 0x00000002;
        }

        Xil_DCacheInvalidateRange((UINTPTR)range_dopp_map[i], sizeof(range_dopp_map[i]));

    }

    XTime_GetTime(&pl_end_dopp);
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

    for(int r = 0; r < 1024; r++)
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

    struct RET_VALS ret = {range_estimate, vel_estimate, pl_end_corr-pl_start_corr, pl_end_dopp-pl_start_dopp};
    return ret;

    /* printf("Range Estimate: %f\n", range_estimate); */
    /* printf("Velocity Estimate: %f\n", vel_estimate); */
    // >>>
}/*>>>*/


int main(void)
{
    init_platform();

    // setup <<<

    rng_init(0);

    // golay sequence generation
    int ga[NSAMP * 2], gb[NSAMP * 2];
    memset(ga, 0, sizeof(ga));
    memset(gb, 0, sizeof(gb));
    ga[0] = 1;
    ga[1] = 1;
    gb[0] = 1;
    gb[1] = -1;
    int cur = 2;
    for (int k = 0; k < (int)log2(NSAMP) - 1; k++) {
        int ga_old[NSAMP], gb_old[NSAMP];
        memcpy(ga_old, ga, cur * sizeof(int));
        memcpy(gb_old, gb, cur * sizeof(int));
        for (int j = 0; j < cur; j++) {
            ga[j] = ga_old[j];
            gb[j] = ga_old[j];
            ga[cur + j] = gb_old[j];
            gb[cur + j] = -gb_old[j];
        }
        cur *= 2;
    }

    // pre-compute frequency equivalents of ga,gb
    float complex *GA_FREQ = calloc(golay_length, sizeof(float complex));
    float complex *GB_FREQ = calloc(golay_length, sizeof(float complex));

    for (int i = 0; i < golay_length; i++) {
        GA_FREQ[i] = (float complex)ga[i];
        GB_FREQ[i] = (float complex)gb[i];
    }

    fft_fast(GA_FREQ, golay_length, &tw_1024_fwd, 0);
    fft_fast(GB_FREQ, golay_length, &tw_1024_fwd, 0);
    
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

            generate_input(GA_FREQ, GB_FREQ, snr_levels[s], true_r, true_v);

            trigger_ip();

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
    free(GA_FREQ);
    free(GB_FREQ);

    cleanup_platform();
    return 0;
}
