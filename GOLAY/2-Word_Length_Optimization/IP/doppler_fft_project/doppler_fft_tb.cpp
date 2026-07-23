#include "tw.h"
#include "doppler_fft.h"
#include "input.h"

#include <stdio.h>
#include <math.h>
#include <complex>
#include <cstring>
void fft(std::complex<float> *x, int len) {
    int bits = (int)round(log2((float)len));


    for (int i = 0; i < len; i++) {
        int rev = 0;
        for (int b = 0; b < bits; b++)
            if (i & (1 << b)) rev |= (1 << (bits - 1 - b));

        if (rev > i) {
            std::complex<float> tmp = x[i];
            x[i] = x[rev];
            x[rev] = tmp;
        }
    }


    for (int s = 1; s <= bits; s++) {
        int m = 1 << s;
        int m2 = m >> 1;

        for (int j = 0; j < m2; j++) {
            float sign = -1.0f;
            std::complex<float> tw =
                std::polar(1.0f, sign * 2.0f * (float)M_PI * j / m);

            for (int k = j; k < len; k += m) {
                std::complex<float> tm = tw * x[k + m2];
                std::complex<float> u  = x[k];
                x[k]       = u + tm;
                x[k + m2]  = u - tm;
            }
        }
    }
}

void fftshift_float(std::complex<float> x[256]) {
    int half = 256 >> 1;
    for (int i = 0; i < half; i++) {
        std::complex<float> tmp = x[i];
        x[i] = x[i + half];
        x[i + half] = tmp;
    }
}

void demo_doppler(std::complex<float> input[256]) {
    fft(input, 256);
    fftshift_float(input);

    // Match HLS normalization (1/N)
    for (int i = 0; i < 256; i++) {
        input[i] /= 256.0f;
    }
}

int main(void) {

    // ── Reference (PS) ────────────────────────────────────────
    std::complex<float> ps_output[256];
    memcpy(ps_output, corr_output, sizeof(corr_output));
    demo_doppler(ps_output);

    // ── DUT (IP) ─────────────────────────────────────────────
    hls::stream<axis_data> input_stream;
    hls::stream<axis_data> output_stream;
    axis_data local_word;

    for (int i = 0; i < 256; i++) {
        local_word.data = corr_output[i];
        local_word.last = (i == 255);
        input_stream.write(local_word);
    }

    doppler_fft_256(input_stream, output_stream);

    // ── Collect Output + RMSE ────────────────────────────────
    std::complex<float> ip_output[256];
    double sse = 0.0;

    for (int i = 0; i < 256; i++) {
        ip_output[i] = output_stream.read().data;

        double err = std::abs(ps_output[i] - ip_output[i]);
        sse += err * err;
    }

    double rmse = sqrt(sse / 256.0);
    printf("RMSE vs reference: %f\n", rmse);

    // ── Per-sample check ─────────────────────────────────────
    const float THRESH = 0.5f;   // tighter threshold
    int mismatch_count = 0;

    for (int i = 0; i < 256; i++) {
        float err = std::abs(ps_output[i] - ip_output[i]);
        if (err > THRESH) {
            printf("Mismatch @ index %d |error| = %f\n", i, err);
            mismatch_count++;
        }
    }

    // ── Write output.h ───────────────────────────────────────
    FILE *fp = fopen("output.h", "w");
    if (!fp) {
        printf("ERROR: Could not open output.h for writing.\n");
        return 1;
    }

    fprintf(fp, "#pragma once\n");
    fprintf(fp, "#include <complex>\n\n");
    fprintf(fp, "static std::complex<float> doppler256_output[256] = {\n");

    for (int i = 0; i < 256; i++) {
        fprintf(fp, "  { %ff, %ff }",
                real(ip_output[i]), imag(ip_output[i]));
        if (i < 255) fprintf(fp, ",");
        fprintf(fp, "\n");
    }

    fprintf(fp, "};\n");
    fclose(fp);

    // ── Final Result ─────────────────────────────────────────
    if (mismatch_count > 0) {
        printf("FAILED: %d samples exceeded threshold %.4f\n",
               mismatch_count, THRESH);
        return 1;
    }

    printf("SUCCESS: All samples within threshold. RMSE = %f\n", rmse);
    printf("Output saved to output.h\n");

    return 0;
}
