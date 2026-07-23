set SynModuleInfo {
  {SRCNAME corr_multiplication_Pipeline_VITIS_LOOP_17_1 MODELNAME corr_multiplication_Pipeline_VITIS_LOOP_17_1 RTLNAME corr_multiplication_corr_multiplication_Pipeline_VITIS_LOOP_17_1
    SUBMODULES {
      {MODELNAME corr_multiplication_mul_25s_27s_45_1_1 RTLNAME corr_multiplication_mul_25s_27s_45_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME corr_multiplication_mul_24s_27s_45_1_1 RTLNAME corr_multiplication_mul_24s_27s_45_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME corr_multiplication_corr_multiplication_Pipeline_VITIS_LOOP_17_1_ga_conj_M_real_V_ROM_AUTO_1R RTLNAME corr_multiplication_corr_multiplication_Pipeline_VITIS_LOOP_17_1_ga_conj_M_real_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME corr_multiplication_corr_multiplication_Pipeline_VITIS_LOOP_17_1_ga_conj_M_imag_V_ROM_AUTO_1R RTLNAME corr_multiplication_corr_multiplication_Pipeline_VITIS_LOOP_17_1_ga_conj_M_imag_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME corr_multiplication_flow_control_loop_pipe_sequential_init RTLNAME corr_multiplication_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME corr_multiplication_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME corr_multiplication_Pipeline_VITIS_LOOP_48_2 MODELNAME corr_multiplication_Pipeline_VITIS_LOOP_48_2 RTLNAME corr_multiplication_corr_multiplication_Pipeline_VITIS_LOOP_48_2
    SUBMODULES {
      {MODELNAME corr_multiplication_corr_multiplication_Pipeline_VITIS_LOOP_48_2_gb_conj_M_real_V_ROM_AUTO_1R RTLNAME corr_multiplication_corr_multiplication_Pipeline_VITIS_LOOP_48_2_gb_conj_M_real_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME corr_multiplication_corr_multiplication_Pipeline_VITIS_LOOP_48_2_gb_conj_M_imag_V_ROM_AUTO_1R RTLNAME corr_multiplication_corr_multiplication_Pipeline_VITIS_LOOP_48_2_gb_conj_M_imag_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME corr_multiplication MODELNAME corr_multiplication RTLNAME corr_multiplication IS_TOP 1
    SUBMODULES {
      {MODELNAME corr_multiplication_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME corr_multiplication_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME corr_multiplication_fpext_32ns_64_2_no_dsp_1 RTLNAME corr_multiplication_fpext_32ns_64_2_no_dsp_1 BINDTYPE op TYPE fpext IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME corr_multiplication_regslice_both RTLNAME corr_multiplication_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME corr_multiplication_regslice_both_U}
    }
  }
}
