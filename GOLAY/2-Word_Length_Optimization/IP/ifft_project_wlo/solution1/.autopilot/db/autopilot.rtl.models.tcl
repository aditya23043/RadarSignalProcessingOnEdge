set SynModuleInfo {
  {SRCNAME ifft_1024_top_Pipeline_VITIS_LOOP_57_1 MODELNAME ifft_1024_top_Pipeline_VITIS_LOOP_57_1 RTLNAME ifft_1024_top_ifft_1024_top_Pipeline_VITIS_LOOP_57_1
    SUBMODULES {
      {MODELNAME ifft_1024_top_flow_control_loop_pipe_sequential_init RTLNAME ifft_1024_top_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME ifft_1024_top_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME ifft_1024_top_Pipeline_VITIS_LOOP_63_2 MODELNAME ifft_1024_top_Pipeline_VITIS_LOOP_63_2 RTLNAME ifft_1024_top_ifft_1024_top_Pipeline_VITIS_LOOP_63_2}
  {SRCNAME ifft_fast_Pipeline_VITIS_LOOP_12_1 MODELNAME ifft_fast_Pipeline_VITIS_LOOP_12_1 RTLNAME ifft_1024_top_ifft_fast_Pipeline_VITIS_LOOP_12_1
    SUBMODULES {
      {MODELNAME ifft_1024_top_ifft_fast_Pipeline_VITIS_LOOP_12_1_br_lut_ROM_AUTO_1R RTLNAME ifft_1024_top_ifft_fast_Pipeline_VITIS_LOOP_12_1_br_lut_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME ifft_fast_Pipeline_VITIS_LOOP_26_4 MODELNAME ifft_fast_Pipeline_VITIS_LOOP_26_4 RTLNAME ifft_1024_top_ifft_fast_Pipeline_VITIS_LOOP_26_4
    SUBMODULES {
      {MODELNAME ifft_1024_top_mul_24s_24s_46_1_1 RTLNAME ifft_1024_top_mul_24s_24s_46_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME ifft_1024_top_mul_24s_23ns_46_1_1 RTLNAME ifft_1024_top_mul_24s_23ns_46_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME ifft_1024_top_ifft_fast_Pipeline_VITIS_LOOP_26_4_tw_M_real_V_ROM_AUTO_1R RTLNAME ifft_1024_top_ifft_fast_Pipeline_VITIS_LOOP_26_4_tw_M_real_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME ifft_1024_top_ifft_fast_Pipeline_VITIS_LOOP_26_4_tw_M_imag_V_ROM_AUTO_1R RTLNAME ifft_1024_top_ifft_fast_Pipeline_VITIS_LOOP_26_4_tw_M_imag_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME ifft_fast MODELNAME ifft_fast RTLNAME ifft_1024_top_ifft_fast}
  {SRCNAME ifft_1024_top_Pipeline_VITIS_LOOP_72_3 MODELNAME ifft_1024_top_Pipeline_VITIS_LOOP_72_3 RTLNAME ifft_1024_top_ifft_1024_top_Pipeline_VITIS_LOOP_72_3}
  {SRCNAME ifft_1024_top MODELNAME ifft_1024_top RTLNAME ifft_1024_top IS_TOP 1
    SUBMODULES {
      {MODELNAME ifft_1024_top_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME ifft_1024_top_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME ifft_1024_top_fpext_32ns_64_2_no_dsp_1 RTLNAME ifft_1024_top_fpext_32ns_64_2_no_dsp_1 BINDTYPE op TYPE fpext IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME ifft_1024_top_ga_M_real_V_RAM_AUTO_1R1W RTLNAME ifft_1024_top_ga_M_real_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME ifft_1024_top_regslice_both RTLNAME ifft_1024_top_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME ifft_1024_top_regslice_both_U}
    }
  }
}
