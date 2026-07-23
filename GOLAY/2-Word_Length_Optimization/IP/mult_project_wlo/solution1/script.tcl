############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project mult_project_wlo
set_top corr_multiplication
add_files mult_project_wlo/conj_values.cpp
add_files mult_project_wlo/conj_values.h
add_files mult_project_wlo/mul.cpp
add_files mult_project_wlo/mul.h
add_files -tb mult_project_wlo/mul_tb.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb mult_project_wlo/mult_input.h -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg484-1}
create_clock -period 10 -name default
config_export -format ip_catalog -rtl verilog
#source "./mult_project_wlo/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog
