#include <stdio.h>
#include <hls_stream.h>
#include "ap_axi_sdata.h"
#include <ap_int.h>
#include <complex>
#include <string.h>

#define FFT_N 256
#define FFT_LOG2_N 8

typedef hls::axis<std::complex<float>, 0, 0, 0> axis_data;

void fft_fast(std::complex<float> x[256], int len);
void doppler_fft_256(hls::stream<axis_data> &input, hls::stream<axis_data> &output);
void fftshift_inplace(std::complex<float> x[256], int len);
