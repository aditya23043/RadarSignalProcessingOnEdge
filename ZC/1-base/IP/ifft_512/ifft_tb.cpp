#include "tw.h"
#include "ifft.h"

void demo_fft(std::complex<float> x[512], int len)
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
            float sign = -1;
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

    float inv = 1.0 / len;
    for (int i = 0; i < len; i++)
        x[i] *= inv;

}

int main(void)
{
    std::complex<float> zc_ps[FFT_N] = {0};
    std::complex<float> zc[FFT_N] = {0};

    for(int i = 0; i < FFT_N; i++)
    {
        zc_ps[i] = 1;
        zc[i] = 1;
    }

    demo_fft(zc_ps, 512);

    hls::stream<axis_data> input;
    hls::stream<axis_data> output;
    axis_data local_read, local_write;

    for(int i = 0; i < FFT_N; i++)
    {
        local_read.data = zc[i];
        local_read.keep = -1;
        local_read.last = (i == FFT_N-1);
        input.write(local_read);
    }

    ifft_512_top(input,  output);

    int flag = 0;
    for(int i = 0; i < FFT_N; i++)
    {
        if(zc_ps[i] != output.read().data)
        {
            printf("Error @ %d\n", i);
            return 1;
        }
    }

    return 0;
}
