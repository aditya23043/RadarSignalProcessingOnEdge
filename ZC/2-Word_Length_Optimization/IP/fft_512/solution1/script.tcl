############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project fft_512
set_top fft_512_top
add_files fft_512/tw.h
add_files fft_512/tw.cpp
add_files fft_512/fft.h
add_files fft_512/fft.cpp
add_files -tb fft_512/fft_tb.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020clg484-1}
create_clock -period 10 -name default
source "./fft_512/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog
