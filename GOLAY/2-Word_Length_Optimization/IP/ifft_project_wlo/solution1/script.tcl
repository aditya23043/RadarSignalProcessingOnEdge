############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project ifft_project_wlo
set_top ifft_1024_top
add_files ifft_project_wlo/ifft.cpp
add_files ifft_project_wlo/ifft.h
add_files ifft_project_wlo/tw.cpp
add_files ifft_project_wlo/tw.h
add_files -tb ifft_project_wlo/ifft_input.h
add_files -tb ifft_project_wlo/ifft_tb.cpp
open_solution "solution1" -flow_target vivado
set_part {xc7z020clg484-1}
create_clock -period 10 -name default
config_export -format ip_catalog -rtl verilog
#source "./ifft_project_wlo/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog
