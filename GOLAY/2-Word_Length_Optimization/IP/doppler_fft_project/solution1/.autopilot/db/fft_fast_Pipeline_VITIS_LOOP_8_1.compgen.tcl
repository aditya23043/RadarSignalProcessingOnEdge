# This script segment is generated automatically by AutoPilot

# Memory (RAM/ROM)  definition:
set ID 12
set hasByteEnable 0
set MemName doppler_fft_256_fft_fast_Pipeline_VITIS_LOOP_8_1_br_lut_ROM_AUTO_1R
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 8
set AddrRange 256
set AddrWd 8
set impl_style auto
set TrueReset 0
set IsROM 1
set ROMData { "00000000" "10000000" "01000000" "11000000" "00100000" "10100000" "01100000" "11100000" "00010000" "10010000" "01010000" "11010000" "00110000" "10110000" "01110000" "11110000" "00001000" "10001000" "01001000" "11001000" "00101000" "10101000" "01101000" "11101000" "00011000" "10011000" "01011000" "11011000" "00111000" "10111000" "01111000" "11111000" "00000100" "10000100" "01000100" "11000100" "00100100" "10100100" "01100100" "11100100" "00010100" "10010100" "01010100" "11010100" "00110100" "10110100" "01110100" "11110100" "00001100" "10001100" "01001100" "11001100" "00101100" "10101100" "01101100" "11101100" "00011100" "10011100" "01011100" "11011100" "00111100" "10111100" "01111100" "11111100" "00000010" "10000010" "01000010" "11000010" "00100010" "10100010" "01100010" "11100010" "00010010" "10010010" "01010010" "11010010" "00110010" "10110010" "01110010" "11110010" "00001010" "10001010" "01001010" "11001010" "00101010" "10101010" "01101010" "11101010" "00011010" "10011010" "01011010" "11011010" "00111010" "10111010" "01111010" "11111010" "00000110" "10000110" "01000110" "11000110" "00100110" "10100110" "01100110" "11100110" "00010110" "10010110" "01010110" "11010110" "00110110" "10110110" "01110110" "11110110" "00001110" "10001110" "01001110" "11001110" "00101110" "10101110" "01101110" "11101110" "00011110" "10011110" "01011110" "11011110" "00111110" "10111110" "01111110" "11111110" "00000001" "10000001" "01000001" "11000001" "00100001" "10100001" "01100001" "11100001" "00010001" "10010001" "01010001" "11010001" "00110001" "10110001" "01110001" "11110001" "00001001" "10001001" "01001001" "11001001" "00101001" "10101001" "01101001" "11101001" "00011001" "10011001" "01011001" "11011001" "00111001" "10111001" "01111001" "11111001" "00000101" "10000101" "01000101" "11000101" "00100101" "10100101" "01100101" "11100101" "00010101" "10010101" "01010101" "11010101" "00110101" "10110101" "01110101" "11110101" "00001101" "10001101" "01001101" "11001101" "00101101" "10101101" "01101101" "11101101" "00011101" "10011101" "01011101" "11011101" "00111101" "10111101" "01111101" "11111101" "00000011" "10000011" "01000011" "11000011" "00100011" "10100011" "01100011" "11100011" "00010011" "10010011" "01010011" "11010011" "00110011" "10110011" "01110011" "11110011" "00001011" "10001011" "01001011" "11001011" "00101011" "10101011" "01101011" "11101011" "00011011" "10011011" "01011011" "11011011" "00111011" "10111011" "01111011" "11111011" "00000111" "10000111" "01000111" "11000111" "00100111" "10100111" "01100111" "11100111" "00010111" "10010111" "01010111" "11010111" "00110111" "10110111" "01110111" "11110111" "00001111" "10001111" "01001111" "11001111" "00101111" "10101111" "01101111" "11101111" "00011111" "10011111" "01011111" "11011111" "00111111" "10111111" "01111111" "11111111" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set DelayBudget 3.254
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem  \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $MemName BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


set CoreName ROM
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem  \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 13 \
    name x_M_real \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename x_M_real \
    op interface \
    ports { x_M_real_address0 { O 8 vector } x_M_real_ce0 { O 1 bit } x_M_real_we0 { O 1 bit } x_M_real_d0 { O 19 vector } x_M_real_q0 { I 19 vector } x_M_real_address1 { O 8 vector } x_M_real_ce1 { O 1 bit } x_M_real_we1 { O 1 bit } x_M_real_d1 { O 19 vector } x_M_real_q1 { I 19 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_M_real'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 14 \
    name x_M_imag \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename x_M_imag \
    op interface \
    ports { x_M_imag_address0 { O 8 vector } x_M_imag_ce0 { O 1 bit } x_M_imag_we0 { O 1 bit } x_M_imag_d0 { O 19 vector } x_M_imag_q0 { I 19 vector } x_M_imag_address1 { O 8 vector } x_M_imag_ce1 { O 1 bit } x_M_imag_we1 { O 1 bit } x_M_imag_d1 { O 19 vector } x_M_imag_q1 { I 19 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_M_imag'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


# flow_control definition:
set InstName doppler_fft_256_flow_control_loop_pipe_sequential_init_U
set CompName doppler_fft_256_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix doppler_fft_256_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


