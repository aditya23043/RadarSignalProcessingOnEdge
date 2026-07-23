############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project fft_project_wlo
set_top fft_1024_top
add_files fft_project_wlo/fft.cpp
add_files fft_project_wlo/fft.h
add_files fft_project_wlo/tw.cpp
add_files fft_project_wlo/tw.h
add_files -tb fft_project_wlo/fft_1024_input_wlo.h -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb fft_project_wlo/fft_tb.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg484-1}
create_clock -period 10 -name default
config_export -format ip_catalog -rtl verilog
#source "./fft_project_wlo/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog
