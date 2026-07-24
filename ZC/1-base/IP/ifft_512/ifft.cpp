#include "tw.h"
#include "ifft.h"

void ifft_fast(std::complex<float> x[512], int len)
{
    int bits = 0;
    while ((1 << bits) < len)
        bits++;

    // bit reversal
    uint16_t *brl = t.br_lut;
    for (int i = 0; i < len; i++) {
        int rev = brl[i];
        if (rev > i) {
            std::complex<float> tmp = x[i];
            x[i] = x[rev];
            x[rev] = tmp;
        }
    }

    // butterfly stages
    int ti = 0;
    for (int s = 1; s <= bits; s++) {
        int m  = 1 << s;
        int m2 = m >> 1;

        for (int k = 0; k < len; k += m) {
            for (int j = 0; j < m2; j++) {
                const std::complex<float>& tw = t.tw[ti + j];   // inverse twiddle
                std::complex<float> tm = tw * x[k + j + m2];
                std::complex<float> u  = x[k + j];

                x[k + j]      = u + tm;
                x[k + j + m2] = u - tm;
            }
        }

        ti += m2;
    }

    // normalize
    float inv = 1.0f / (float)len;
    for (int i = 0; i < len; i++)
        x[i] *= inv;
}

void ifft_512_top(hls::stream<axis_data> &input, hls::stream<axis_data> &output)
{
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE axis register both port=input
#pragma HLS INTERFACE axis register both port=output

    axis_data local_read, local_write;
    std::complex<float> zc[FFT_N] = {0};

    for(int i = 0; i < FFT_N; i++)
    {
        zc[i] = input.read().data;
    }

    ifft_fast(zc, 512);

    for(int i = 0; i < FFT_N; i++)
    {
        local_write.data = zc[i];
        local_write.keep = -1;
        local_write.last = (i == FFT_N-1);

        output.write(local_write);
    }
}
