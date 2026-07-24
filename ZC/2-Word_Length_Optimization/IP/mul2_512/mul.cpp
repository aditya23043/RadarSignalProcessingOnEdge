#include "mul.h"
#include "conj_values.h"

void mul512(hls::stream<axis_data> &input, hls::stream<axis_data> &output)
{
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE axis register both port=input
#pragma HLS INTERFACE axis register both port=output

    std::complex<float> zc[N] = {0};
    std::complex<float> output_zc[N] = {0};

    axis_data local_write;

    for(int i = 0; i < N; i++)
    {
        zc[i] = input.read().data;
    }

    for(int i = 0; i < N; i++)
    {
        output_zc[i] = zc[i] * zc_conj[i];
    }

    for(int i = 0; i < N; i++)
    {
        local_write.data = output_zc[i];
        local_write.keep = -1;
        if(i == N-1)
        {
            local_write.last = 1;
        }
        else{
            local_write.last = 0;
        }
        output.write(local_write);
    }

}
