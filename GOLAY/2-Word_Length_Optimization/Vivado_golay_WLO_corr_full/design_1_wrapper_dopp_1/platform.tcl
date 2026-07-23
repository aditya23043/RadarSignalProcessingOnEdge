# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /mnt/arch/home/adi/repo/AELD_Lab_2026/HLS_WLO/Vivado_golay_WLO_corr_full/design_1_wrapper_dopp_1/platform.tcl
# 
# OR launch xsct and run below command.
# source /mnt/arch/home/adi/repo/AELD_Lab_2026/HLS_WLO/Vivado_golay_WLO_corr_full/design_1_wrapper_dopp_1/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {design_1_wrapper_dopp_1}\
-hw {/mnt/arch/home/adi/repo/AELD_Lab_2026/HLS_WLO/Vivado_golay_WLO_corr_full/design_1_wrapper_dopp.xsa}\
-out {/mnt/arch/home/adi/repo/AELD_Lab_2026/HLS_WLO/Vivado_golay_WLO_corr_full}

platform write
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform generate -domains 
platform active {design_1_wrapper_dopp_1}
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick
bsp reload
bsp config stdin "ps7_coresight_comp_0"
bsp config stdout "ps7_coresight_comp_0"
bsp write
bsp reload
catch {bsp regenerate}
platform generate
