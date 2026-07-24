############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project doppler_fft_256
set_top doppler_fft_256
add_files doppler_fft_256/doppler.cpp
add_files doppler_fft_256/doppler.h
add_files doppler_fft_256/input.cpp
add_files doppler_fft_256/input.h
add_files doppler_fft_256/tw.cpp
add_files doppler_fft_256/tw.h
add_files -tb doppler_fft_256/doppler_tb.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020clg484-1}
create_clock -period 10 -name default
config_export -format ip_catalog -rtl verilog
source "./doppler_fft_256/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog
