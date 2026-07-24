#include "tw.h"
#include "doppler.h"
#include "input.h"

void fft(std::complex<float> *x, int len)
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
            float sign = -1.0;
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
}

void demo_doppler(std::complex<float> input[256])
{
    fft(input, 256);
    fftshift_inplace(input, 256);
}

int main(void)
{
    std::complex<float> ps_output[256];
    memcpy(ps_output, corr_output, sizeof(corr_output));

    // PS <<<
    demo_doppler(ps_output);
    // >>>

    // IP <<<
    hls::stream<axis_data> input;
    hls::stream<axis_data> output;
    axis_data local_read, local_write;

    // inp gen
    for(int i = 0; i < 256; i++)
    {
        local_read.data = corr_output[i];
        local_read.last = (i == 255);
        input.write(local_read);
    }

    doppler_fft_256(input, output);
    // >>>
    std::complex<float> foo;

    for(int i = 0 ; i < 256; i++)
    {
        foo = output.read().data;
        printf("{ %f, %f }\n", real(foo), imag(foo));
        if(abs(ps_output[i] - foo) > 0.2f)
        {
            printf("Mismatch @ index %d\n", i);
            return 1;
        }
    }
    
    return 0;
}
