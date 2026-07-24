############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project mul2_512
set_top mul512
add_files mul2_512/mul.h
add_files mul2_512/mul.cpp
add_files mul2_512/conj_values.h
add_files mul2_512/conj_values.cpp
add_files -tb mul2_512/mul_tb.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020clg484-1}
create_clock -period 10 -name default
config_export -format ip_catalog -rtl verilog
source "./mul2_512/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog
