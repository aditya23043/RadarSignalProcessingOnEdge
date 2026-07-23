// mul.cpp
#include "mul.h"
#include "conj_values.h"

void corr_multiplication(hls::stream<axis_data> &input,
                         hls::stream<axis_data> &output)
{
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE axis register both port=input
#pragma HLS INTERFACE axis register both port=output

    int i;
    axis_data local_write;

    // GA: scale input down before cast to prevent product overflow,
    //     scale output float back up to restore true amplitude.
    for (i = 0; i < N; i++)
    {
        // Input boundary: float -> scale down -> fixed
        // MUL_SCALE_INV = 1/512 keeps value in [-2^8, 2^8)
        // so no integer bits are lost in the cast to mul_t
        cfloat_t in_f  = input.read().data;
        mul_t    in_re = (mul_t)(in_f.real() * MUL_SCALE_INV);
        mul_t    in_im = (mul_t)(in_f.imag() * MUL_SCALE_INV);

        // Conjugate from LUT — stored at full magnitude as mul_conj_t
        mul_conj_t c_re = ga_conj[i].real();
        mul_conj_t c_im = ga_conj[i].imag();

        // Complex multiply: (a+jb)(c+jd) = (ac-bd) + j(ad+bc)
        // HLS widens the intermediate product then truncates back to mul_t.
        // No saturation occurs because scaled_input(9 int) * conj(11 int)
        // = 20 int bits, which exactly fits MUL_INT_BITS=20.
        mul_t p_re = (mul_t)in_re * (mul_t)c_re
                   - (mul_t)in_im * (mul_t)c_im;
        mul_t p_im = (mul_t)in_re * (mul_t)c_im
                   + (mul_t)in_im * (mul_t)c_re;

        // Output boundary: fixed -> float -> scale back up
        local_write.data.real((float)p_re * MUL_SCALE_FWD);
        local_write.data.imag((float)p_im * MUL_SCALE_FWD);
        local_write.keep = -1;
        local_write.last = (i == N - 1) ? 1 : 0;
        output.write(local_write);
    }

    // GB: identical pattern with gb_conj
    for (i = 0; i < N; i++)
    {
        cfloat_t in_f  = input.read().data;
        mul_t    in_re = (mul_t)(in_f.real() * MUL_SCALE_INV);
        mul_t    in_im = (mul_t)(in_f.imag() * MUL_SCALE_INV);

        mul_conj_t c_re = gb_conj[i].real();
        mul_conj_t c_im = gb_conj[i].imag();

        mul_t p_re = (mul_t)in_re * (mul_t)c_re
                   - (mul_t)in_im * (mul_t)c_im;
        mul_t p_im = (mul_t)in_re * (mul_t)c_im
                   + (mul_t)in_im * (mul_t)c_re;

        local_write.data.real((float)p_re * MUL_SCALE_FWD);
        local_write.data.imag((float)p_im * MUL_SCALE_FWD);
        local_write.keep = -1;
        local_write.last = (i == N - 1) ? 1 : 0;
        output.write(local_write);
    }
}
