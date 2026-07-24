set SynModuleInfo {
  {SRCNAME ifft_512_top_Pipeline_1 MODELNAME ifft_512_top_Pipeline_1 RTLNAME ifft_512_top_ifft_512_top_Pipeline_1
    SUBMODULES {
      {MODELNAME ifft_512_top_flow_control_loop_pipe_sequential_init RTLNAME ifft_512_top_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME ifft_512_top_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME ifft_512_top_Pipeline_VITIS_LOOP_56_1 MODELNAME ifft_512_top_Pipeline_VITIS_LOOP_56_1 RTLNAME ifft_512_top_ifft_512_top_Pipeline_VITIS_LOOP_56_1}
  {SRCNAME ifft_fast_Pipeline_VITIS_LOOP_12_2 MODELNAME ifft_fast_Pipeline_VITIS_LOOP_12_2 RTLNAME ifft_512_top_ifft_fast_Pipeline_VITIS_LOOP_12_2
    SUBMODULES {
      {MODELNAME ifft_512_top_ifft_fast_Pipeline_VITIS_LOOP_12_2_br_lut_ROM_AUTO_1R RTLNAME ifft_512_top_ifft_fast_Pipeline_VITIS_LOOP_12_2_br_lut_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME ifft_fast_Pipeline_VITIS_LOOP_28_5 MODELNAME ifft_fast_Pipeline_VITIS_LOOP_28_5 RTLNAME ifft_512_top_ifft_fast_Pipeline_VITIS_LOOP_28_5
    SUBMODULES {
      {MODELNAME ifft_512_top_faddfsub_32ns_32ns_32_5_full_dsp_1 RTLNAME ifft_512_top_faddfsub_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fsub IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME ifft_512_top_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME ifft_512_top_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME ifft_512_top_ifft_fast_Pipeline_VITIS_LOOP_28_5_tw_M_value_1_ROM_AUTO_1R RTLNAME ifft_512_top_ifft_fast_Pipeline_VITIS_LOOP_28_5_tw_M_value_1_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME ifft_512_top_ifft_fast_Pipeline_VITIS_LOOP_28_5_tw_M_value_ROM_AUTO_1R RTLNAME ifft_512_top_ifft_fast_Pipeline_VITIS_LOOP_28_5_tw_M_value_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME ifft_fast_Pipeline_VITIS_LOOP_43_6 MODELNAME ifft_fast_Pipeline_VITIS_LOOP_43_6 RTLNAME ifft_512_top_ifft_fast_Pipeline_VITIS_LOOP_43_6}
  {SRCNAME ifft_fast MODELNAME ifft_fast RTLNAME ifft_512_top_ifft_fast}
  {SRCNAME ifft_512_top_Pipeline_VITIS_LOOP_63_2 MODELNAME ifft_512_top_Pipeline_VITIS_LOOP_63_2 RTLNAME ifft_512_top_ifft_512_top_Pipeline_VITIS_LOOP_63_2}
  {SRCNAME ifft_512_top MODELNAME ifft_512_top RTLNAME ifft_512_top IS_TOP 1
    SUBMODULES {
      {MODELNAME ifft_512_top_zc_M_value_RAM_AUTO_1R1W RTLNAME ifft_512_top_zc_M_value_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME ifft_512_top_regslice_both RTLNAME ifft_512_top_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME ifft_512_top_regslice_both_U}
    }
  }
}
