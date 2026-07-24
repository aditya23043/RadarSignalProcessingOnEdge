# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: /mnt/arch/home/adi/repo/AELD_Lab_2026/as_close_as_midsem/vivado_zc_full/dopp_wlo_system/_ide/scripts/debugger_zc_full-default_1.tcl
# 
# 
# Usage with xsct:
# In an external shell use the below command and launch symbol server.
# symbol_server -S -s tcp::1534
# To debug using xsct, launch xsct and run below command
# source /mnt/arch/home/adi/repo/AELD_Lab_2026/as_close_as_midsem/vivado_zc_full/dopp_wlo_system/_ide/scripts/debugger_zc_full-default_1.tcl
# 
connect -path [list tcp::1534 tcp:192.168.224.251:61325]
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zed 210248722265" && level==0 && jtag_device_ctx=="jsn-Zed-210248722265-4ba00477-0"}
fpga -file /mnt/arch/home/adi/repo/AELD_Lab_2026/as_close_as_midsem/vivado_zc_full/dopp_wlo/_ide/bitstream/design_1_wrapper_dopp_WLO.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw /mnt/arch/home/adi/repo/AELD_Lab_2026/as_close_as_midsem/vivado_zc_full/design_1_wrapper_dopp_WLO/export/design_1_wrapper_dopp_WLO/hw/design_1_wrapper_dopp_WLO.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source /mnt/arch/home/adi/repo/AELD_Lab_2026/as_close_as_midsem/vivado_zc_full/dopp_wlo/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow /mnt/arch/home/adi/repo/AELD_Lab_2026/as_close_as_midsem/vivado_zc_full/dopp_wlo/Debug/dopp_wlo.elf
configparams force-mem-access 0
bpadd -addr &main
