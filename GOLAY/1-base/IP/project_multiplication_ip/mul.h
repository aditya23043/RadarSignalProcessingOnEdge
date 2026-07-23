#include <stdio.h>
#include <complex>
#include <hls_stream.h>
#include <ap_axi_sdata.h>
#include <ap_int.h>

typedef hls::axis<std::complex<float>, 0, 0, 0> axis_data;

#define N 1024

void corr_multiplication(hls::stream<axis_data> &input, hls::stream<axis_data> &output);
