#include "tw.h"

void fft_fast(std::complex<float> x[1024], int len)
{
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
    for (int s = 1; s <= t.bits; s++) {
        int m = 1 << s;
        int m2 = m >> 1;
        for (int k = 0; k < len; k += m) {
            for (int j = 0; j < m2; j++) {
                std::complex<float> tw = t.tw[ti + j];
                std::complex<float> tm = tw * x[k + j + m2];
                std::complex<float> u = x[k + j];
                x[k + j] = u + tm;
                x[k + j + m2] = u - tm;
            }
        }
        ti += m2;
    }
}

void fft_1024_top(hls::stream<axis_data> &input, hls::stream<axis_data> &output)
{
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE axis register both port=input
#pragma HLS INTERFACE axis register both port=output

    axis_data local_read, local_write;
    std::complex<float> ga[FFT_N] = {0};
    std::complex<float> gb[FFT_N] = {0};

    // parse ga
    for(int i = 0; i < FFT_N; i++)
    {
        ga[i] = input.read().data;
    }
    // parse gb
    for(int i = 0; i < FFT_N; i++)
    {
        gb[i] = input.read().data;
    }

    fft_fast(ga, 1024);
    fft_fast(gb, 1024);

    // write back output
    for(int i = 0; i < FFT_N; i++)
    {
        local_write.data = ga[i];
        local_write.keep = -1;
        output.write(local_write);
    }
    for(int i = 0; i < FFT_N; i++)
    {
        local_write.data = gb[i];
        local_write.keep = -1;
        if(i == FFT_N-1)
        {
            local_write.last = 1;
        }
        else 
        {
            local_write.last = 0;
        }
        output.write(local_write);
    }
}
