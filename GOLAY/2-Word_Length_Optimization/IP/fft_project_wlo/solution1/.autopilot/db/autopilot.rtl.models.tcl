set SynModuleInfo {
  {SRCNAME fft_1024_top_Pipeline_VITIS_LOOP_47_1 MODELNAME fft_1024_top_Pipeline_VITIS_LOOP_47_1 RTLNAME fft_1024_top_fft_1024_top_Pipeline_VITIS_LOOP_47_1
    SUBMODULES {
      {MODELNAME fft_1024_top_flow_control_loop_pipe_sequential_init RTLNAME fft_1024_top_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME fft_1024_top_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME fft_1024_top_Pipeline_VITIS_LOOP_54_2 MODELNAME fft_1024_top_Pipeline_VITIS_LOOP_54_2 RTLNAME fft_1024_top_fft_1024_top_Pipeline_VITIS_LOOP_54_2}
  {SRCNAME fft_fast_Pipeline_VITIS_LOOP_7_1 MODELNAME fft_fast_Pipeline_VITIS_LOOP_7_1 RTLNAME fft_1024_top_fft_fast_Pipeline_VITIS_LOOP_7_1
    SUBMODULES {
      {MODELNAME fft_1024_top_fft_fast_Pipeline_VITIS_LOOP_7_1_br_lut_ROM_AUTO_1R RTLNAME fft_1024_top_fft_fast_Pipeline_VITIS_LOOP_7_1_br_lut_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME fft_fast_Pipeline_VITIS_LOOP_21_4 MODELNAME fft_fast_Pipeline_VITIS_LOOP_21_4 RTLNAME fft_1024_top_fft_fast_Pipeline_VITIS_LOOP_21_4
    SUBMODULES {
      {MODELNAME fft_1024_top_mul_26s_26s_50_1_1 RTLNAME fft_1024_top_mul_26s_26s_50_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME fft_1024_top_fft_fast_Pipeline_VITIS_LOOP_21_4_tw_M_real_V_ROM_AUTO_1R RTLNAME fft_1024_top_fft_fast_Pipeline_VITIS_LOOP_21_4_tw_M_real_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME fft_1024_top_fft_fast_Pipeline_VITIS_LOOP_21_4_tw_M_imag_V_ROM_AUTO_1R RTLNAME fft_1024_top_fft_fast_Pipeline_VITIS_LOOP_21_4_tw_M_imag_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME fft_fast MODELNAME fft_fast RTLNAME fft_1024_top_fft_fast}
  {SRCNAME fft_1024_top_Pipeline_VITIS_LOOP_63_3 MODELNAME fft_1024_top_Pipeline_VITIS_LOOP_63_3 RTLNAME fft_1024_top_fft_1024_top_Pipeline_VITIS_LOOP_63_3}
  {SRCNAME fft_1024_top_Pipeline_VITIS_LOOP_72_4 MODELNAME fft_1024_top_Pipeline_VITIS_LOOP_72_4 RTLNAME fft_1024_top_fft_1024_top_Pipeline_VITIS_LOOP_72_4}
  {SRCNAME fft_1024_top MODELNAME fft_1024_top RTLNAME fft_1024_top IS_TOP 1
    SUBMODULES {
      {MODELNAME fft_1024_top_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME fft_1024_top_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME fft_1024_top_fpext_32ns_64_2_no_dsp_1 RTLNAME fft_1024_top_fpext_32ns_64_2_no_dsp_1 BINDTYPE op TYPE fpext IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME fft_1024_top_ga_M_real_V_RAM_AUTO_1R1W RTLNAME fft_1024_top_ga_M_real_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME fft_1024_top_regslice_both RTLNAME fft_1024_top_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME fft_1024_top_regslice_both_U}
    }
  }
}
