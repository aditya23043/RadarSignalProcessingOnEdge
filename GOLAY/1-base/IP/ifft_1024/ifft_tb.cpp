#include "ifft.h"
#include "tw.h"

static void demo_fft(std::complex<float> *x, int len, int inverse)
{
    int bits = (int)round(log2((float)len));

    // Bit-reversal permutation
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

    // Butterfly stages
    for (int s = 1; s <= bits; s++)
    {
        int m = 1 << s;
        int m2 = m >> 1;
        for (int j = 0; j < m2; j++)
        {
            float sign = inverse ? 1.0 : -1.0;
            std::complex<float> tw = std::polar(1.0f, sign * 2.0f * (float)M_PI * (float)j / (float)m);

            for (int k = j; k < len; k += m)
            {
                std::complex<float> tm = tw * x[k + m2];
                std::complex<float> u = x[k];
                x[k] = u + tm;
                x[k + m2] = u - tm;
            }
        }
    }

    if (inverse)
    {
        float inv = 1.0 / len;
        for (int i = 0; i < len; i++)
            x[i] *= inv;
    }
}

int main(void)
{
    int row, col;

    std::complex<float> ga_ps[FFT_N] = {0};
    std::complex<float> gb_ps[FFT_N] = {0};
    std::complex<float> ga[FFT_N] = {0};
    std::complex<float> gb[FFT_N] = {0};

    // input

    for(int i = 0; i < FFT_N; i++)
    {
        ga_ps[i] = 1;
        ga[i] = 1;
    }

    gb_ps[0] = 1;
    gb[0] = 1;

    // demo
    demo_fft(ga_ps, 1024, 1);
    demo_fft(gb_ps, 1024, 1);

    // IP
    hls::stream<axis_data> input;
    hls::stream<axis_data> output;
    axis_data local_read, local_write;

    for(int i = 0; i < FFT_N; i++)
    {
        local_read.data = ga[i];
        input.write(local_read);
    }
    for(int i = 0; i < FFT_N; i++)
    {
        local_read.data = gb[i];
        local_read.last = (i == FFT_N - 1) ? 1 : 0;
        input.write(local_read);
    }

    ifft_1024_top(input, output);

    // verify output

    /* for(int i = 0; i < FFT_N; i++) */
    /* { */
    /*     if(ga_ps[i] != output.read().data) */
    /*     { */
    /*         printf("[GA] Error at %d\n", i); */
    /*         return 1; */
    /*     } */
    /* } */
    /* for(int i = 0; i < FFT_N; i++) */
    /* { */
    /*     if(gb_ps[i] != output.read().data) */
    /*     { */
    /*         printf("[GB] Error at %d\n", i); */
    /*         return 1; */
    /*     } */
    /* } */

    for(int i = 0; i < FFT_N; i++)
    {
        if(ga_ps[i]+gb_ps[i] != output.read().data)
        {
            printf("Error at %d\n", i);
            return 1;
        }
    }

    printf("No Error\n");
    return 0;
}

