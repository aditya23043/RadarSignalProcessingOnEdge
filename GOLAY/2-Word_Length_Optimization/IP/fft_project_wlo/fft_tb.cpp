#include <cstdio>
#include <cmath>
#include <complex>
#include "fft.h"
#include "tw.h"
#include "fft_1024_input_wlo.h"

#define MAX_ABS_ERR 1.0f

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
            std::complex<float> tw = std::polar(1.0f, sign * 2.0f * (float)M_PI * (float)j / (float)m);
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
    // read input
    std::complex<float> ga[FFT_N], gb[FFT_N];
    std::complex<float> ga_ref[FFT_N], gb_ref[FFT_N];

    for (int i = 0; i < FFT_N; i++)
    {
        ga[i]     = fft_test_input[i];
        gb[i]     = fft_test_input[FFT_N + i];
        ga_ref[i] = ga[i];
        gb_ref[i] = gb[i];
    }

    // reference
    demo_fft(ga_ref, FFT_N, 0);
    demo_fft(gb_ref, FFT_N, 0);

    // feed IP
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

    fft_1024_top(input, output);

    // read, check and accumulate squared error
    std::complex<float> ga_out[FFT_N], gb_out[FFT_N];
    int   errors   = 0;
    float sse_ga   = 0.0f;   // sum of squared errors
    float sse_gb   = 0.0f;

    for (int i = 0; i < FFT_N; i++)
    {
        ga_out[i] = output.read().data;

        float err_re = ga_out[i].real() - ga_ref[i].real();
        float err_im = ga_out[i].imag() - ga_ref[i].imag();
        sse_ga += err_re * err_re + err_im * err_im;

        float err = fmaxf(fabsf(err_re), fabsf(err_im));
        if (err > MAX_ABS_ERR)
        {
            printf("[GA] bin %d: err=%.4f\n", i, err);
            errors++;
        }
    }

    for (int i = 0; i < FFT_N; i++)
    {
        gb_out[i] = output.read().data;

        float err_re = gb_out[i].real() - gb_ref[i].real();
        float err_im = gb_out[i].imag() - gb_ref[i].imag();
        sse_gb += err_re * err_re + err_im * err_im;

        float err = fmaxf(fabsf(err_re), fabsf(err_im));
        if (err > MAX_ABS_ERR)
        {
            printf("[GB] bin %d: err=%.4f\n", i, err);
            errors++;
        }
    }

    // RMSE: sqrt(mean of squared errors across all bins, real+imag)
    // Dividing by 2*FFT_N because each bin contributes re and im error
    float rmse_ga = sqrtf(sse_ga / (2.0f * FFT_N));
    float rmse_gb = sqrtf(sse_gb / (2.0f * FFT_N));

    printf("GA RMSE: %.6f\n", rmse_ga);
    printf("GB RMSE: %.6f\n", rmse_gb);

    if (errors > 0)
    {
        printf("FAIL: %d errors\n", errors);
        return 1;
    }
    printf("PASS\n");

    // write mult_input.h
    FILE *fh = fopen("mult_input.h", "w");
    fprintf(fh, "#ifndef MULT_INPUT_H\n#define MULT_INPUT_H\n\n");
    fprintf(fh, "#include <complex>\n\n");
    fprintf(fh, "static std::complex<float> mult_input_ga[%d] = {\n", FFT_N);
    for (int i = 0; i < FFT_N; i++)
        fprintf(fh, "    {%.6ff, %.6ff}%s\n", ga_out[i].real(), ga_out[i].imag(), i < FFT_N-1 ? "," : "");
    fprintf(fh, "};\n\n");
    fprintf(fh, "static std::complex<float> mult_input_gb[%d] = {\n", FFT_N);
    for (int i = 0; i < FFT_N; i++)
        fprintf(fh, "    {%.6ff, %.6ff}%s\n", gb_out[i].real(), gb_out[i].imag(), i < FFT_N-1 ? "," : "");
    fprintf(fh, "};\n\n#endif\n");
    fclose(fh);

    printf("Written: mult_input_wlo.h\n");
    return 0;
}
