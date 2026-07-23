#include "fft.h"
#include "tw.h"

void fft_fast(fft_cplx_t x[FFT_N])
{
    const uint16_t *brl = t.br_lut;
    for (int i = 0; i < FFT_N; i++) {
        int rev = brl[i];
        if (rev > i) {
            fft_cplx_t tmp = x[i];
            x[i]   = x[rev];
            x[rev] = tmp;
        }
    }

    int ti = 0;
    for (int s = 1; s <= t.bits; s++) {
        int m  = 1 << s;
        int m2 = m >> 1;
        for (int k = 0; k < FFT_N; k += m) {
            for (int j = 0; j < m2; j++) {
                fft_t tw_re = (fft_t)t.tw[ti + j].real();
                fft_t tw_im = (fft_t)t.tw[ti + j].imag();
                fft_cplx_t upper = x[k + j + m2];
                fft_t tm_re = tw_re * upper.real() - tw_im * upper.imag();
                fft_t tm_im = tw_re * upper.imag() + tw_im * upper.real();
                fft_cplx_t tm(tm_re, tm_im);
                fft_cplx_t u  = x[k + j];
                x[k + j]      = u + tm;
                x[k + j + m2] = u - tm;
            }
        }
        ti += m2;
    }
}

void fft_1024_top(hls::stream<axis_data> &input,
                  hls::stream<axis_data> &output)
{
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE axis register both port=input
#pragma HLS INTERFACE axis register both port=output

    fft_cplx_t ga[FFT_N];
    fft_cplx_t gb[FFT_N];

    for (int i = 0; i < FFT_N; i++) {
        cfloat_t sample = input.read().data;
        ga[i].real((fft_t)(sample.real() * FFT_SCALE_INV));
        ga[i].imag((fft_t)(sample.imag() * FFT_SCALE_INV));
    }


    for (int i = 0; i < FFT_N; i++) {
        cfloat_t sample = input.read().data;
        gb[i].real((fft_t)(sample.real() * FFT_SCALE_INV));
        gb[i].imag((fft_t)(sample.imag() * FFT_SCALE_INV));
    }

    fft_fast(ga);
    fft_fast(gb);

    for (int i = 0; i < FFT_N; i++) {
        axis_data word;
        word.data.real((float)ga[i].real() * FFT_SCALE_FWD);
        word.data.imag((float)ga[i].imag() * FFT_SCALE_FWD);
        word.keep = -1;
        word.last = 0;
        output.write(word);
    }

    for (int i = 0; i < FFT_N; i++) {
        axis_data word;
        word.data.real((float)gb[i].real() * FFT_SCALE_FWD);
        word.data.imag((float)gb[i].imag() * FFT_SCALE_FWD);
        word.keep = -1;
        word.last = (i == FFT_N - 1) ? 1 : 0;
        output.write(word);
    }
}
