// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
// Date        : Tue May  5 16:20:48 2026
// Host        : adi-ubuntu running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_doppler_fft_256_0_0_stub.v
// Design      : design_1_doppler_fft_256_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "doppler_fft_256,Vivado 2022.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(ap_clk, ap_rst_n, input_r_TVALID, 
  input_r_TREADY, input_r_TDATA, input_r_TLAST, input_r_TKEEP, input_r_TSTRB, 
  output_r_TVALID, output_r_TREADY, output_r_TDATA, output_r_TLAST, output_r_TKEEP, 
  output_r_TSTRB)
/* synthesis syn_black_box black_box_pad_pin="ap_clk,ap_rst_n,input_r_TVALID,input_r_TREADY,input_r_TDATA[63:0],input_r_TLAST[0:0],input_r_TKEEP[7:0],input_r_TSTRB[7:0],output_r_TVALID,output_r_TREADY,output_r_TDATA[63:0],output_r_TLAST[0:0],output_r_TKEEP[7:0],output_r_TSTRB[7:0]" */;
  input ap_clk;
  input ap_rst_n;
  input input_r_TVALID;
  output input_r_TREADY;
  input [63:0]input_r_TDATA;
  input [0:0]input_r_TLAST;
  input [7:0]input_r_TKEEP;
  input [7:0]input_r_TSTRB;
  output output_r_TVALID;
  input output_r_TREADY;
  output [63:0]output_r_TDATA;
  output [0:0]output_r_TLAST;
  output [7:0]output_r_TKEEP;
  output [7:0]output_r_TSTRB;
endmodule
