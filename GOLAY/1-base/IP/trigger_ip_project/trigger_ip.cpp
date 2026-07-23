#include "trigger_ip.h"

void trigger_ip(
    hls::stream<axis_t> &s_axis_in,
    hls::stream<axis_t> &m_axis_out,
    ap_uint<1>           sync_reset,
    ap_uint<1>          &trigger_done
)
{
    #pragma HLS INTERFACE axis         port=s_axis_in
    #pragma HLS INTERFACE axis         port=m_axis_out
    #pragma HLS INTERFACE s_axilite    port=sync_reset
    #pragma HLS INTERFACE s_axilite    port=trigger_done
    #pragma HLS INTERFACE s_axilite    port=return

    #pragma HLS PIPELINE II=1

    static ap_uint<16> samp_cnt  = 0;
    static ap_uint<5>  batch_cnt = 0;
    static ap_uint<1>  done      = 0;

    if (sync_reset) {
        samp_cnt  = 0;
        batch_cnt = 0;
        done      = 0;
        trigger_done = 0;
        return;
    }

    if (done) {
        return;
    }

    axis_t in_word = s_axis_in.read();

    axis_t out_word = in_word;

    bool last_of_batch = (samp_cnt == FIFO_SIZE - 1);
    out_word.last = last_of_batch ? 1 : 0;

    m_axis_out.write(out_word);

    if (last_of_batch) {
        samp_cnt = 0;

        if (batch_cnt == NUM_BATCHES - 1) {
            done = 1;
            trigger_done = 1;
        } else {
            batch_cnt++;
        }
    } else {
        samp_cnt++;
    }
}
