#include <cstdio>
#include <cmath>
#include <complex>
#include "mul.h"
#include "conj_values.h"
#include "C:\Users\nadis\OneDrive\Desktop\AELD_ENDPROJECT\fft_1024\solution1\csim\build\mult_input.h"    // provides: mult_input_ga[N], mult_input_gb[N]

#define MAX_ABS_ERR 1.0f

void demo_multiply(
    std::complex<float> ga[N],
    std::complex<float> gb[N],
    std::complex<float> out_ga[N],
    std::complex<float> out_gb[N])
{
    for (int i = 0; i < N; i++)
    {
        // cast conj fixed point to float before multiplying
        std::complex<float> ga_c((float)ga_conj[i].real(), (float)ga_conj[i].imag());
        std::complex<float> gb_c((float)gb_conj[i].real(), (float)gb_conj[i].imag());

        out_ga[i] = ga[i] * ga_c;
        out_gb[i] = gb[i] * gb_c;
    }
}
int main(void)
{
    // read input from mult_input.h
    std::complex<float> ga[N], gb[N];
    std::complex<float> ga_ref[N], gb_ref[N];

    for (int i = 0; i < N; i++)
    {
        ga[i] = mult_input_ga[i];
        gb[i] = mult_input_gb[i];
    }

    // reference
    demo_multiply(ga, gb, ga_ref, gb_ref);

    // feed IP
    hls::stream<axis_data> input, output;
    axis_data local_read;

    for (int i = 0; i < N; i++)
    {
        local_read.data = ga[i];
        local_read.last = 0;
        input.write(local_read);
    }
    for (int i = 0; i < N; i++)
    {
        local_read.data = gb[i];
        local_read.last = (i == N - 1) ? 1 : 0;
        input.write(local_read);
    }

    corr_multiplication(input, output);

    // read, check and accumulate squared error
    std::complex<float> ga_out[N], gb_out[N];
    int   errors = 0;
    float sse_ga = 0.0f;
    float sse_gb = 0.0f;

    for (int i = 0; i < N; i++)
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
    for (int i = 0; i < N; i++)
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

    float rmse_ga = sqrtf(sse_ga / (2.0f * N));
    float rmse_gb = sqrtf(sse_gb / (2.0f * N));

    printf("GA RMSE: %.6f\n", rmse_ga);
    printf("GB RMSE: %.6f\n", rmse_gb);

    if (errors > 0)
    {
        printf("FAIL: %d errors\n", errors);
        return 1;
    }
    printf("PASS\n");

    // write ifft_input.h
    FILE *fh = fopen("ifft_input.h", "w");
    fprintf(fh, "#ifndef IFFT_INPUT_H\n#define IFFT_INPUT_H\n\n");
    fprintf(fh, "#include <complex>\n\n");
    fprintf(fh, "static std::complex<float> ifft_input_ga[%d] = {\n", N);
    for (int i = 0; i < N; i++)
        fprintf(fh, "    {%.6ff, %.6ff}%s\n",
                ga_out[i].real(), ga_out[i].imag(),
                i < N - 1 ? "," : "");
    fprintf(fh, "};\n\n");
    fprintf(fh, "static std::complex<float> ifft_input_gb[%d] = {\n", N);
    for (int i = 0; i < N; i++)
        fprintf(fh, "    {%.6ff, %.6ff}%s\n",
                gb_out[i].real(), gb_out[i].imag(),
                i < N - 1 ? "," : "");
    fprintf(fh, "};\n\n#endif\n");
    fclose(fh);

    printf("Written: ifft_input.h\n");
    return 0;
}
