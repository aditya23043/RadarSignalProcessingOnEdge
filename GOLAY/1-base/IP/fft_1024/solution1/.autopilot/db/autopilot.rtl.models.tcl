set SynModuleInfo {
  {SRCNAME fft_1024_top_Pipeline_1 MODELNAME fft_1024_top_Pipeline_1 RTLNAME fft_1024_top_fft_1024_top_Pipeline_1
    SUBMODULES {
      {MODELNAME fft_1024_top_flow_control_loop_pipe_sequential_init RTLNAME fft_1024_top_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME fft_1024_top_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME fft_1024_top_Pipeline_2 MODELNAME fft_1024_top_Pipeline_2 RTLNAME fft_1024_top_fft_1024_top_Pipeline_2}
  {SRCNAME fft_1024_top_Pipeline_VITIS_LOOP_45_1 MODELNAME fft_1024_top_Pipeline_VITIS_LOOP_45_1 RTLNAME fft_1024_top_fft_1024_top_Pipeline_VITIS_LOOP_45_1}
  {SRCNAME fft_1024_top_Pipeline_VITIS_LOOP_50_2 MODELNAME fft_1024_top_Pipeline_VITIS_LOOP_50_2 RTLNAME fft_1024_top_fft_1024_top_Pipeline_VITIS_LOOP_50_2}
  {SRCNAME fft_fast_Pipeline_VITIS_LOOP_7_1 MODELNAME fft_fast_Pipeline_VITIS_LOOP_7_1 RTLNAME fft_1024_top_fft_fast_Pipeline_VITIS_LOOP_7_1
    SUBMODULES {
      {MODELNAME fft_1024_top_fft_fast_Pipeline_VITIS_LOOP_7_1_br_lut_ROM_AUTO_1R RTLNAME fft_1024_top_fft_fast_Pipeline_VITIS_LOOP_7_1_br_lut_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME fft_fast_Pipeline_VITIS_LOOP_22_4 MODELNAME fft_fast_Pipeline_VITIS_LOOP_22_4 RTLNAME fft_1024_top_fft_fast_Pipeline_VITIS_LOOP_22_4
    SUBMODULES {
      {MODELNAME fft_1024_top_faddfsub_32ns_32ns_32_5_full_dsp_1 RTLNAME fft_1024_top_faddfsub_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fsub IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME fft_1024_top_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME fft_1024_top_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME fft_1024_top_fft_fast_Pipeline_VITIS_LOOP_22_4_tw_M_value_1_ROM_AUTO_1R RTLNAME fft_1024_top_fft_fast_Pipeline_VITIS_LOOP_22_4_tw_M_value_1_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME fft_1024_top_fft_fast_Pipeline_VITIS_LOOP_22_4_tw_M_value_ROM_AUTO_1R RTLNAME fft_1024_top_fft_fast_Pipeline_VITIS_LOOP_22_4_tw_M_value_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME fft_fast MODELNAME fft_fast RTLNAME fft_1024_top_fft_fast}
  {SRCNAME fft_1024_top_Pipeline_VITIS_LOOP_59_3 MODELNAME fft_1024_top_Pipeline_VITIS_LOOP_59_3 RTLNAME fft_1024_top_fft_1024_top_Pipeline_VITIS_LOOP_59_3}
  {SRCNAME fft_1024_top_Pipeline_VITIS_LOOP_65_4 MODELNAME fft_1024_top_Pipeline_VITIS_LOOP_65_4 RTLNAME fft_1024_top_fft_1024_top_Pipeline_VITIS_LOOP_65_4}
  {SRCNAME fft_1024_top MODELNAME fft_1024_top RTLNAME fft_1024_top IS_TOP 1
    SUBMODULES {
      {MODELNAME fft_1024_top_ga_M_value_RAM_AUTO_1R1W RTLNAME fft_1024_top_ga_M_value_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME fft_1024_top_regslice_both RTLNAME fft_1024_top_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME fft_1024_top_regslice_both_U}
    }
  }
}
