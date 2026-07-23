-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
-- Date        : Wed Apr 29 14:22:12 2026
-- Host        : adi-ubuntu running 64-bit Ubuntu 20.04.3 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top design_1_trigger_ip_0_0 -prefix
--               design_1_trigger_ip_0_0_ design_1_trigger_ip_0_0_stub.vhdl
-- Design      : design_1_trigger_ip_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_trigger_ip_0_0 is
  Port ( 
    s_axi_control_AWADDR : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s_axi_control_AWVALID : in STD_LOGIC;
    s_axi_control_AWREADY : out STD_LOGIC;
    s_axi_control_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_control_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_control_WVALID : in STD_LOGIC;
    s_axi_control_WREADY : out STD_LOGIC;
    s_axi_control_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_control_BVALID : out STD_LOGIC;
    s_axi_control_BREADY : in STD_LOGIC;
    s_axi_control_ARADDR : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s_axi_control_ARVALID : in STD_LOGIC;
    s_axi_control_ARREADY : out STD_LOGIC;
    s_axi_control_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_control_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_control_RVALID : out STD_LOGIC;
    s_axi_control_RREADY : in STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    s_axis_in_TVALID : in STD_LOGIC;
    s_axis_in_TREADY : out STD_LOGIC;
    s_axis_in_TLAST : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_in_TDATA : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_in_TKEEP : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_in_TSTRB : in STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_out_TVALID : out STD_LOGIC;
    m_axis_out_TREADY : in STD_LOGIC;
    m_axis_out_TLAST : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_out_TDATA : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_out_TKEEP : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_out_TSTRB : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end design_1_trigger_ip_0_0;

architecture stub of design_1_trigger_ip_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "s_axi_control_AWADDR[4:0],s_axi_control_AWVALID,s_axi_control_AWREADY,s_axi_control_WDATA[31:0],s_axi_control_WSTRB[3:0],s_axi_control_WVALID,s_axi_control_WREADY,s_axi_control_BRESP[1:0],s_axi_control_BVALID,s_axi_control_BREADY,s_axi_control_ARADDR[4:0],s_axi_control_ARVALID,s_axi_control_ARREADY,s_axi_control_RDATA[31:0],s_axi_control_RRESP[1:0],s_axi_control_RVALID,s_axi_control_RREADY,ap_clk,ap_rst_n,interrupt,s_axis_in_TVALID,s_axis_in_TREADY,s_axis_in_TLAST[0:0],s_axis_in_TDATA[63:0],s_axis_in_TKEEP[7:0],s_axis_in_TSTRB[7:0],m_axis_out_TVALID,m_axis_out_TREADY,m_axis_out_TLAST[0:0],m_axis_out_TDATA[63:0],m_axis_out_TKEEP[7:0],m_axis_out_TSTRB[7:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "trigger_ip,Vivado 2022.1";
begin
end;
