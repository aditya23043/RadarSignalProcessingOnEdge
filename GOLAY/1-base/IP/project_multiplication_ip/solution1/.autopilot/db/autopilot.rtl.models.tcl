set SynModuleInfo {
  {SRCNAME corr_multiplication_Pipeline_VITIS_LOOP_27_1 MODELNAME corr_multiplication_Pipeline_VITIS_LOOP_27_1 RTLNAME corr_multiplication_corr_multiplication_Pipeline_VITIS_LOOP_27_1
    SUBMODULES {
      {MODELNAME corr_multiplication_corr_multiplication_Pipeline_VITIS_LOOP_27_1_ga_conj_M_value_1_ROM_AUTO_1R RTLNAME corr_multiplication_corr_multiplication_Pipeline_VITIS_LOOP_27_1_ga_conj_M_value_1_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME corr_multiplication_corr_multiplication_Pipeline_VITIS_LOOP_27_1_ga_conj_M_value_ROM_AUTO_1R RTLNAME corr_multiplication_corr_multiplication_Pipeline_VITIS_LOOP_27_1_ga_conj_M_value_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME corr_multiplication_flow_control_loop_pipe_sequential_init RTLNAME corr_multiplication_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME corr_multiplication_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME corr_multiplication_Pipeline_VITIS_LOOP_45_2 MODELNAME corr_multiplication_Pipeline_VITIS_LOOP_45_2 RTLNAME corr_multiplication_corr_multiplication_Pipeline_VITIS_LOOP_45_2
    SUBMODULES {
      {MODELNAME corr_multiplication_corr_multiplication_Pipeline_VITIS_LOOP_45_2_gb_conj_M_value_1_ROM_AUTO_1R RTLNAME corr_multiplication_corr_multiplication_Pipeline_VITIS_LOOP_45_2_gb_conj_M_value_1_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME corr_multiplication_corr_multiplication_Pipeline_VITIS_LOOP_45_2_gb_conj_M_value_ROM_AUTO_1R RTLNAME corr_multiplication_corr_multiplication_Pipeline_VITIS_LOOP_45_2_gb_conj_M_value_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME corr_multiplication MODELNAME corr_multiplication RTLNAME corr_multiplication IS_TOP 1
    SUBMODULES {
      {MODELNAME corr_multiplication_fsub_32ns_32ns_32_5_full_dsp_1 RTLNAME corr_multiplication_fsub_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fsub IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME corr_multiplication_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME corr_multiplication_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME corr_multiplication_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME corr_multiplication_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME corr_multiplication_regslice_both RTLNAME corr_multiplication_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME corr_multiplication_regslice_both_U}
    }
  }
}
