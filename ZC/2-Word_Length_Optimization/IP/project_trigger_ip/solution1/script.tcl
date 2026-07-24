############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project project_trigger_ip
set_top trigger_ip
add_files trigger_ip.h
add_files project_trigger_ip/trigger_ip.cpp
add_files -tb project_trigger_ip/trigger_ip_tb.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg484-1}
create_clock -period 10 -name default
config_export -format ip_catalog -rtl verilog
source "./project_trigger_ip/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog
