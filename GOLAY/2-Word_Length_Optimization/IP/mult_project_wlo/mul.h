// mul.h
#ifndef MUL_H
#define MUL_H

#include <stdio.h>
#include <complex>
#include <hls_stream.h>
#include <ap_axi_sdata.h>
#include <ap_int.h>
#include <ap_fixed.h>

#define N 1024

typedef std::complex<float>           cfloat_t;
typedef hls::axis<cfloat_t, 0, 0, 0> axis_data;

#define MUL_SCALE_SHIFT  11
#define MUL_SCALE_INV    (1.0f / (float)(1 << MUL_SCALE_SHIFT))
#define MUL_SCALE_FWD    (float)(1 << MUL_SCALE_SHIFT)


#define MUL_TOTAL_BITS  27
#define MUL_INT_BITS    9

#define MUL_CONJ_TOTAL_BITS  27
#define MUL_CONJ_INT_BITS    11

typedef ap_fixed<MUL_TOTAL_BITS,      MUL_INT_BITS>      mul_t;
typedef ap_fixed<MUL_CONJ_TOTAL_BITS, MUL_CONJ_INT_BITS> mul_conj_t;

typedef std::complex<mul_t>      mul_cplx_t;
typedef std::complex<mul_conj_t> mul_conj_cplx_t;

void corr_multiplication(hls::stream<axis_data> &input,
                         hls::stream<axis_data> &output);
#endif
