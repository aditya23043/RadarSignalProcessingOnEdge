#ifndef IFFT_H
#define IFFT_H

#include <complex>
#include <ap_fixed.h>
#include <ap_int.h>
#include <hls_stream.h>
#include "ap_axi_sdata.h"

#define FFT_N          1024
#define FFT_LOG2_N     10


#define IFFT_TOTAL_BITS  24
#define IFFT_INT_BITS     2

#define IFFT_TW_TOTAL_BITS  24
#define IFFT_TW_INT_BITS     2

typedef ap_fixed<IFFT_TOTAL_BITS, IFFT_INT_BITS> ifft_t;
typedef ap_fixed<IFFT_TW_TOTAL_BITS, IFFT_TW_INT_BITS> ifft_tw_t;
typedef std::complex<ifft_t>    ifft_cplx_t;
typedef std::complex<ifft_tw_t> ifft_tw_cplx_t;

typedef std::complex<float>           cfloat_t;
typedef hls::axis<cfloat_t, 0, 0, 0> axis_data;

void ifft_fast(ifft_cplx_t x[FFT_N]);
void ifft_1024_top(hls::stream<axis_data> &input,
                   hls::stream<axis_data> &output);

#endif
