#ifndef DOPPLER_FFT_H
#define DOPPLER_FFT_H

#include <complex>
#include <ap_fixed.h>
#include <ap_int.h>
#include <hls_stream.h>
#include "ap_axi_sdata.h"

#define FFT_N        256
#define FFT_LOG2_N     8

#define FFT_TOTAL_BITS   19
#define FFT_INT_BITS      2

#define FFT_TW_TOTAL_BITS 24
#define FFT_TW_INT_BITS    2

#define FFT_SCALE_SHIFT  13
#define FFT_SCALE_INV    (1.0f / (float)(1 << FFT_SCALE_SHIFT))
#define FFT_SCALE_FWD    (float)(1 << FFT_SCALE_SHIFT)

typedef ap_fixed<FFT_TOTAL_BITS,    FFT_INT_BITS>    fft_t;
typedef ap_fixed<FFT_TW_TOTAL_BITS, FFT_TW_INT_BITS> fft_tw_t;
typedef std::complex<fft_t>     fft_cplx_t;
typedef std::complex<fft_tw_t>  fft_tw_cplx_t;
typedef std::complex<float>     cfloat_t;

typedef hls::axis<cfloat_t, 0, 0, 0> axis_data;

void fft_fast(fft_cplx_t x[FFT_N]);
void fftshift_inplace(fft_cplx_t x[FFT_N]);
void doppler_fft_256(hls::stream<axis_data> &input,
                     hls::stream<axis_data> &output);

#endif
