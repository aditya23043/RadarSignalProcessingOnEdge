// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================

extern "C" void AESL_WRAP_trigger_ip (
hls::stream<struct ap_axis<32, 0, 0, 0 > > (&s_axis_in),
hls::stream<struct ap_axis<32, 0, 0, 0 > > (&m_axis_out),
char sync_reset,
volatile void* trigger_done);
