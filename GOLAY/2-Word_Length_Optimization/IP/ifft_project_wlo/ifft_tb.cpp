#include <cstdio>
#include <cmath>
#include <complex>
#include "ifft.h"
#include "tw.h"
#include "ifft_input.h"

#define MAX_ABS_ERR 1.0f

// Must match the scale used in ifft.cpp
#define SCALE_SHIFT 19
#define SCALE_INV   (1.0f / (float)(1 << SCALE_SHIFT))
#define SCALE_FWD   (float)(1 << SCALE_SHIFT)

static void demo_fft(std::complex<float> *x, int len, int inverse)
{
    int bits = (int)round(log2((float)len));
    for (int i = 0; i < len; i++)
    {
        int rev = 0;
        for (int b = 0; b < bits; b++)
            if (i & (1 << b))
                rev |= (1 << (bits - 1 - b));
        if (rev > i)
        {
            std::complex<float> tmp = x[i];
            x[i] = x[rev];
            x[rev] = tmp;
        }
    }
    for (int s = 1; s <= bits; s++)
    {
        int m  = 1 << s;
        int m2 = m >> 1;
        for (int j = 0; j < m2; j++)
        {
            float sign = inverse ? 1.0f : -1.0f;
            std::complex<float> tw = std::polar(1.0f,
                sign * 2.0f * (float)M_PI * (float)j / (float)m);
            for (int k = j; k < len; k += m)
            {
                std::complex<float> tm = tw * x[k + m2];
                std::complex<float> u  = x[k];
                x[k]      = u + tm;
                x[k + m2] = u - tm;
            }
        }
    }
    if (inverse)
    {
        float inv = 1.0f / len;
        for (int i = 0; i < len; i++)
            x[i] *= inv;
    }
}

int main(void)
{
    // ----------------------------------------------------------------
    // Read input
    // ----------------------------------------------------------------
    std::complex<float> ga[FFT_N], gb[FFT_N];
    std::complex<float> ga_ref[FFT_N], gb_ref[FFT_N];

    for (int i = 0; i < FFT_N; i++)
    {
        ga[i]     = ifft_input_ga[i];
        gb[i]     = ifft_input_gb[i];
        ga_ref[i] = ga[i];
        gb_ref[i] = gb[i];
    }

    // ----------------------------------------------------------------
    // Reference: the IP's net transfer function is simply IFFT(Ga+Gb).
    // The internal SCALE_INV/SCALE_FWD cancel out end-to-end, so the
    // reference is just: IFFT(ga) + IFFT(gb) in the original domain.
    // ----------------------------------------------------------------
    demo_fft(ga_ref, FFT_N, 1);
    demo_fft(gb_ref, FFT_N, 1);

    std::complex<float> ref_sum[FFT_N];
    for (int i = 0; i < FFT_N; i++)
        ref_sum[i] = ga_ref[i] + gb_ref[i];

    // ----------------------------------------------------------------
    // Feed the IP
    // ----------------------------------------------------------------
    hls::stream<axis_data> input, output;
    axis_data word;

    for (int i = 0; i < FFT_N; i++)
    {
        word.data = ga[i];
        word.keep = -1;
        word.last = 0;
        input.write(word);
    }
    for (int i = 0; i < FFT_N; i++)
    {
        word.data = gb[i];
        word.keep = -1;
        word.last = (i == FFT_N - 1) ? 1 : 0;
        input.write(word);
    }

    ifft_1024_top(input, output);

    // ----------------------------------------------------------------
    // Read ALL output FIRST, then print and check
    // ----------------------------------------------------------------
    std::complex<float> out[FFT_N];
    for (int i = 0; i < FFT_N; i++)
        out[i] = output.read().data;

    // Debug: first two bins (valid because out[] is fully populated)
    printf("ref[0] = %.4f + %.4fj\n", ref_sum[0].real(), ref_sum[0].imag());
    printf("out[0] = %.4f + %.4fj\n", out[0].real(),     out[0].imag());
    printf("ref[1] = %.4f + %.4fj\n", ref_sum[1].real(), ref_sum[1].imag());
    printf("out[1] = %.4f + %.4fj\n", out[1].real(),     out[1].imag());

    // ----------------------------------------------------------------
    // Error check
    // ----------------------------------------------------------------
    int   errors = 0;
    float sse    = 0.0f;

    for (int i = 0; i < FFT_N; i++)
    {
        float err_re = out[i].real() - ref_sum[i].real();
        float err_im = out[i].imag() - ref_sum[i].imag();
        sse += err_re * err_re + err_im * err_im;

        float err = fmaxf(fabsf(err_re), fabsf(err_im));
        if (err > MAX_ABS_ERR)
        {
            printf("[OUT] bin %d: err=%.4f\n", i, err);
            errors++;
        }
    }

    float rmse = sqrtf(sse / (2.0f * FFT_N));
    printf("RMSE: %.6f\n", rmse);

    if (errors > 0)
    {
        printf("FAIL: %d errors\n", errors);
        return 1;
    }
    printf("PASS\n");

    // ----------------------------------------------------------------
    // Write doppler_input.h
    // ----------------------------------------------------------------
    FILE *fh = fopen("doppler_input.h", "w");
    fprintf(fh, "#ifndef DOPPLER_INPUT_H\n#define DOPPLER_INPUT_H\n\n");
    fprintf(fh, "#include <complex>\n\n");
    fprintf(fh, "#define DOPPLER_N %d\n\n", FFT_N);
    fprintf(fh, "static std::complex<float> doppler_input[%d] = {\n", FFT_N);
    for (int i = 0; i < FFT_N; i++)
        fprintf(fh, "    {%.6ff, %.6ff}%s\n",
                out[i].real(), out[i].imag(),
                i < FFT_N - 1 ? "," : "");
    fprintf(fh, "};\n\n#endif\n");
    fclose(fh);

    printf("Written: doppler_input.h\n");
    return 0;
}
