set SynModuleInfo {
  {SRCNAME fft_512_top_Pipeline_1 MODELNAME fft_512_top_Pipeline_1 RTLNAME fft_512_top_fft_512_top_Pipeline_1
    SUBMODULES {
      {MODELNAME fft_512_top_flow_control_loop_pipe_sequential_init RTLNAME fft_512_top_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME fft_512_top_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME fft_512_top_Pipeline_VITIS_LOOP_44_1 MODELNAME fft_512_top_Pipeline_VITIS_LOOP_44_1 RTLNAME fft_512_top_fft_512_top_Pipeline_VITIS_LOOP_44_1}
  {SRCNAME fft_fast_Pipeline_VITIS_LOOP_8_1 MODELNAME fft_fast_Pipeline_VITIS_LOOP_8_1 RTLNAME fft_512_top_fft_fast_Pipeline_VITIS_LOOP_8_1
    SUBMODULES {
      {MODELNAME fft_512_top_fft_fast_Pipeline_VITIS_LOOP_8_1_br_lut_ROM_AUTO_1R RTLNAME fft_512_top_fft_fast_Pipeline_VITIS_LOOP_8_1_br_lut_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME fft_fast_Pipeline_VITIS_LOOP_23_4 MODELNAME fft_fast_Pipeline_VITIS_LOOP_23_4 RTLNAME fft_512_top_fft_fast_Pipeline_VITIS_LOOP_23_4
    SUBMODULES {
      {MODELNAME fft_512_top_faddfsub_32ns_32ns_32_5_full_dsp_1 RTLNAME fft_512_top_faddfsub_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fsub IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME fft_512_top_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME fft_512_top_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME fft_512_top_fft_fast_Pipeline_VITIS_LOOP_23_4_tw_M_value_1_ROM_AUTO_1R RTLNAME fft_512_top_fft_fast_Pipeline_VITIS_LOOP_23_4_tw_M_value_1_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME fft_512_top_fft_fast_Pipeline_VITIS_LOOP_23_4_tw_M_value_ROM_AUTO_1R RTLNAME fft_512_top_fft_fast_Pipeline_VITIS_LOOP_23_4_tw_M_value_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME fft_fast MODELNAME fft_fast RTLNAME fft_512_top_fft_fast}
  {SRCNAME fft_512_top_Pipeline_VITIS_LOOP_51_2 MODELNAME fft_512_top_Pipeline_VITIS_LOOP_51_2 RTLNAME fft_512_top_fft_512_top_Pipeline_VITIS_LOOP_51_2}
  {SRCNAME fft_512_top MODELNAME fft_512_top RTLNAME fft_512_top IS_TOP 1
    SUBMODULES {
      {MODELNAME fft_512_top_zc_M_value_RAM_AUTO_1R1W RTLNAME fft_512_top_zc_M_value_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME fft_512_top_regslice_both RTLNAME fft_512_top_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME fft_512_top_regslice_both_U}
    }
  }
}
