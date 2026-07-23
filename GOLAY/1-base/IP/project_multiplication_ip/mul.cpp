#include "mul.h"
#include "conj_values.h"

// parse input & compute combined
// write back

// NOTE:
// we will have 2 sequential inputs: ga and gb separately (1024+1024)
// and 2 sequential outputs: ga and gb (1024+1024)

void corr_multiplication(hls::stream<axis_data> &input, hls::stream<axis_data> &output)
{
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE axis register both port=input
#pragma HLS INTERFACE axis register both port=output

    std::complex<float> ga[N] = {0};
    std::complex<float> output_ga[N] = {0};

    std::complex<float> gb[N] = {0};
    std::complex<float> output_gb[N] = {0};

    axis_data local_read, local_write;
    int row = 0, col = 0, i = 0;

    // GA (read, compute, write back)
    for(i = 0; i < N; i++)
    {
        ga[i] = input.read().data;
        output_ga[i] = ga[i] * ga_conj[i];
        local_write.data = output_ga[i];
        local_write.keep = -1;
        if(i == N-1)
        {
            local_write.last = 1;
        }
        else
        {
            local_write.last = 0;
        }
        output.write(local_write);
    }

    // GB (read, compute, write back)
    for(i = 0; i < N; i++)
    {
        gb[i] = input.read().data;
        output_gb[i] = gb[i] * gb_conj[i];
        local_write.data = output_gb[i];
        local_write.keep = -1;
        if(i == N-1)
        {
            local_write.last = 1;
        }
        else
        {
            local_write.last = 0;
        }
        output.write(local_write);
    }
}
