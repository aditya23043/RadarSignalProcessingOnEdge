#include "ifft.h"
#include "tw.h"

// scale factor: 1/2^19  (keeps inputs in [-1,1] for fixed-point)
#define SCALE_SHIFT 18
#define SCALE_INV   (1.0f / (float)(1 << SCALE_SHIFT))
#define SCALE_FWD   (float)(1 << SCALE_SHIFT)

void ifft_fast(ifft_cplx_t x[FFT_N])
{
    const uint16_t *brl = t.br_lut;
    for (int i = 0; i < FFT_N; i++) {
        int rev = brl[i];
        if (rev > i) {
            ifft_cplx_t tmp = x[i];
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
                ifft_t tw_re = (ifft_t)t.tw[ti + j].real();
                ifft_t tw_im = (ifft_t)t.tw[ti + j].imag();
                ifft_cplx_t upper = x[k + j + m2];

                ifft_t tm_re = tw_re * upper.real() - tw_im * upper.imag();
                ifft_t tm_im = tw_re * upper.imag() + tw_im * upper.real();
                ifft_cplx_t tm(tm_re, tm_im);
                ifft_cplx_t u = x[k + j];

                ifft_t half = (ifft_t)0.5f;
                x[k + j]      = ifft_cplx_t((u.real() + tm.real()) * half,
                                             (u.imag() + tm.imag()) * half);
                x[k + j + m2] = ifft_cplx_t((u.real() - tm.real()) * half,
                                             (u.imag() - tm.imag()) * half);
            }
        }
        ti += m2;
    }
}

void ifft_1024_top(hls::stream<axis_data> &input,
                   hls::stream<axis_data> &output)
{
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE axis register both port=input
#pragma HLS INTERFACE axis register both port=output

    ifft_cplx_t ga[FFT_N];
    ifft_cplx_t gb[FFT_N];

    for (int i = 0; i < FFT_N; i++) {
        cfloat_t sample = input.read().data;
        ga[i].real((ifft_t)(sample.real() * SCALE_INV));
        ga[i].imag((ifft_t)(sample.imag() * SCALE_INV));
    }

    for (int i = 0; i < FFT_N; i++) {
        cfloat_t sample = input.read().data;
        gb[i].real((ifft_t)(sample.real() * SCALE_INV));
        gb[i].imag((ifft_t)(sample.imag() * SCALE_INV));
    }

    ifft_fast(ga);
    ifft_fast(gb);

    for (int i = 0; i < FFT_N; i++) {
        axis_data word;
        word.data.real((float)(ga[i].real() + gb[i].real()) * SCALE_FWD);
        word.data.imag((float)(ga[i].imag() + gb[i].imag()) * SCALE_FWD);
        word.keep = -1;
        word.last = (i == FFT_N - 1) ? 1 : 0;
        output.write(word);
    }
}

