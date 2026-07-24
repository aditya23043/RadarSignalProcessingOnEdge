#include "doppler_fft.h"
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

                fft_cplx_t u = x[k + j];

                fft_t half = (fft_t)0.5f;
                x[k + j]      = fft_cplx_t((u.real() + tm.real()) * half,
                                            (u.imag() + tm.imag()) * half);
                x[k + j + m2] = fft_cplx_t((u.real() - tm.real()) * half,
                                            (u.imag() - tm.imag()) * half);
            }
        }
        ti += m2;
    }
}

void fftshift_inplace(fft_cplx_t x[FFT_N])
{
    int half = FFT_N >> 1;
    for (int i = 0; i < half; i++) {
        fft_cplx_t tmp = x[i];
        x[i]        = x[i + half];
        x[i + half] = tmp;
    }
}

void doppler_fft_256(hls::stream<axis_data> &input,
                     hls::stream<axis_data> &output)
{
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE axis register both port=input
#pragma HLS INTERFACE axis register both port=output

    fft_cplx_t buf[FFT_N];

    for (int i = 0; i < FFT_N; i++) {
        cfloat_t sample = input.read().data;
        buf[i].real((fft_t)(sample.real() * FFT_SCALE_INV));
        buf[i].imag((fft_t)(sample.imag() * FFT_SCALE_INV));
    }

    fft_fast(buf);
    fftshift_inplace(buf);

    for (int i = 0; i < FFT_N; i++) {
        axis_data word;
        word.data.real((float)buf[i].real() * FFT_SCALE_FWD);
        word.data.imag((float)buf[i].imag() * FFT_SCALE_FWD);
        word.keep = -1;
        word.last = (i == FFT_N - 1) ? 1 : 0;
        output.write(word);
    }
}
