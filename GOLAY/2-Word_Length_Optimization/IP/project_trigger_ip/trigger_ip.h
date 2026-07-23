#ifndef TRIGGER_IP_H
#define TRIGGER_IP_H

#include <complex>
#include "ap_int.h"
#include "hls_stream.h"
#include "ap_axi_sdata.h"

#define FIFO_SIZE    32768
#define NUM_BATCHES  16


typedef std::complex<float> cfloat_t;
typedef hls::axis<cfloat_t, 0, 0, 0> axis_t;

void trigger_ip(
    hls::stream<axis_t> &s_axis_in,
    hls::stream<axis_t> &m_axis_out,
    ap_uint<1>           sync_reset,
    ap_uint<1>          &trigger_done
);

#endif
