create_project prj -part xc7z020-clg484-1 -force
set_property target_language verilog [current_project]
set vivado_ver [version -short]
set COE_DIR "../../syn/verilog"
source "/mnt/arch/home/adi/repo/AELD_Lab_2026/as_close_as_midsem/zc/mul2_512/solution1/syn/verilog/mul512_fmul_32ns_32ns_32_4_max_dsp_1_ip.tcl"
source "/mnt/arch/home/adi/repo/AELD_Lab_2026/as_close_as_midsem/zc/mul2_512/solution1/syn/verilog/mul512_fadd_32ns_32ns_32_5_full_dsp_1_ip.tcl"
source "/mnt/arch/home/adi/repo/AELD_Lab_2026/as_close_as_midsem/zc/mul2_512/solution1/syn/verilog/mul512_fsub_32ns_32ns_32_5_full_dsp_1_ip.tcl"
