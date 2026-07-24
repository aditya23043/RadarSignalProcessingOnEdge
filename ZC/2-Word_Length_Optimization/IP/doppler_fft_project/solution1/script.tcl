############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project doppler_fft_project
set_top doppler_fft_256
add_files doppler_fft_project/doppler_fft.cpp
add_files doppler_fft_project/doppler_fft.h
add_files doppler_fft_project/tw.cpp
add_files doppler_fft_project/tw.h
add_files -tb doppler_fft_project/doppler_fft_tb.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb doppler_fft_project/input.h -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg484-1}
create_clock -period 10 -name default
config_export -format ip_catalog -rtl verilog
source "./doppler_fft_project/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog
