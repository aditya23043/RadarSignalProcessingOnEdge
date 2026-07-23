#include <stdio.h>
#include <hls_stream.h>
#include "ap_axi_sdata.h"
#include <ap_int.h>
#include <complex>

#define FFT_N 1024
#define FFT_LOG2_N 10

typedef hls::axis<std::complex<float>, 0, 0, 0> axis_data;

void ifft_fast(std::complex<float> x[1024], int len);
void ifft_1024_top(hls::stream<axis_data> &input, hls::stream<axis_data> &output);
