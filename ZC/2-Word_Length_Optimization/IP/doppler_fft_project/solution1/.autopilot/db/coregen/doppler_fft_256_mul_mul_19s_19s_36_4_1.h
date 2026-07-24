// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __doppler_fft_256_mul_mul_19s_19s_36_4_1__HH__
#define __doppler_fft_256_mul_mul_19s_19s_36_4_1__HH__
#include "doppler_fft_256_mul_mul_19s_19s_36_4_1_DSP48_0.h"
#include <systemc>

template<
    int ID,
    int NUM_STAGE,
    int din0_WIDTH,
    int din1_WIDTH,
    int dout_WIDTH>
SC_MODULE(doppler_fft_256_mul_mul_19s_19s_36_4_1) {
    sc_core::sc_in_clk clk;
    sc_core::sc_in<sc_dt::sc_logic> reset;
    sc_core::sc_in<sc_dt::sc_logic> ce;
    sc_core::sc_in< sc_dt::sc_lv<din0_WIDTH> >   din0;
    sc_core::sc_in< sc_dt::sc_lv<din1_WIDTH> >   din1;
    sc_core::sc_out< sc_dt::sc_lv<dout_WIDTH> >   dout;



    doppler_fft_256_mul_mul_19s_19s_36_4_1_DSP48_0 doppler_fft_256_mul_mul_19s_19s_36_4_1_DSP48_0_U;

    SC_CTOR(doppler_fft_256_mul_mul_19s_19s_36_4_1):  doppler_fft_256_mul_mul_19s_19s_36_4_1_DSP48_0_U ("doppler_fft_256_mul_mul_19s_19s_36_4_1_DSP48_0_U") {
        doppler_fft_256_mul_mul_19s_19s_36_4_1_DSP48_0_U.clk(clk);
        doppler_fft_256_mul_mul_19s_19s_36_4_1_DSP48_0_U.rst(reset);
        doppler_fft_256_mul_mul_19s_19s_36_4_1_DSP48_0_U.ce(ce);
        doppler_fft_256_mul_mul_19s_19s_36_4_1_DSP48_0_U.a(din0);
        doppler_fft_256_mul_mul_19s_19s_36_4_1_DSP48_0_U.b(din1);
        doppler_fft_256_mul_mul_19s_19s_36_4_1_DSP48_0_U.p(dout);

    }

};

#endif //
