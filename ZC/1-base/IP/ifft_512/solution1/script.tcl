############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project ifft_512
set_top ifft_512_top
add_files ifft_512/ifft.cpp
add_files ifft_512/ifft.h
add_files ifft_512/tw.cpp
add_files ifft_512/tw.h
add_files -tb ifft_512/ifft_tb.cpp
open_solution "solution1" -flow_target vivado
set_part {xc7z020clg484-1}
create_clock -period 10 -name default
#source "./ifft_512/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog
