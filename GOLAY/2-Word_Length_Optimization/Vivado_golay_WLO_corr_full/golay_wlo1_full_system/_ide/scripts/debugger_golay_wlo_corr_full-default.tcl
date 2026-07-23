# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: /mnt/arch/home/adi/repo/AELD_Lab_2026/HLS_WLO/Vivado_golay_WLO_corr_full/golay_wlo1_full_system/_ide/scripts/debugger_golay_wlo_corr_full-default.tcl
# 
# 
# Usage with xsct:
# In an external shell use the below command and launch symbol server.
# symbol_server -S -s tcp::1534
# To debug using xsct, launch xsct and run below command
# source /mnt/arch/home/adi/repo/AELD_Lab_2026/HLS_WLO/Vivado_golay_WLO_corr_full/golay_wlo1_full_system/_ide/scripts/debugger_golay_wlo_corr_full-default.tcl
# 
connect -path [list tcp::1534 tcp:192.168.224.251:58078]
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zed 210248722265" && level==0 && jtag_device_ctx=="jsn-Zed-210248722265-23727093-0"}
fpga -file /mnt/arch/home/adi/repo/AELD_Lab_2026/HLS_WLO/Vivado_golay_WLO_corr_full/golay_wlo1_full/_ide/bitstream/design_1_wrapper_wlo1.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw /mnt/arch/home/adi/repo/AELD_Lab_2026/HLS_WLO/Vivado_golay_WLO_corr_full/design_1_wrapper_wlo1/export/design_1_wrapper_wlo1/hw/design_1_wrapper_wlo1.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source /mnt/arch/home/adi/repo/AELD_Lab_2026/HLS_WLO/Vivado_golay_WLO_corr_full/golay_wlo1_full/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow /mnt/arch/home/adi/repo/AELD_Lab_2026/HLS_WLO/Vivado_golay_WLO_corr_full/golay_wlo1_full/Debug/golay_wlo1_full.elf
configparams force-mem-access 0
bpadd -addr &main
