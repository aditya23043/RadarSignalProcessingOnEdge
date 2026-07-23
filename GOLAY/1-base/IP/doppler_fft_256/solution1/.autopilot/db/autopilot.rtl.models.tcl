set SynModuleInfo {
  {SRCNAME doppler_fft_256_Pipeline_1 MODELNAME doppler_fft_256_Pipeline_1 RTLNAME doppler_fft_256_doppler_fft_256_Pipeline_1
    SUBMODULES {
      {MODELNAME doppler_fft_256_flow_control_loop_pipe_sequential_init RTLNAME doppler_fft_256_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME doppler_fft_256_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME doppler_fft_256_Pipeline_VITIS_LOOP_58_1 MODELNAME doppler_fft_256_Pipeline_VITIS_LOOP_58_1 RTLNAME doppler_fft_256_doppler_fft_256_Pipeline_VITIS_LOOP_58_1}
  {SRCNAME fft_fast_Pipeline_VITIS_LOOP_8_1 MODELNAME fft_fast_Pipeline_VITIS_LOOP_8_1 RTLNAME doppler_fft_256_fft_fast_Pipeline_VITIS_LOOP_8_1
    SUBMODULES {
      {MODELNAME doppler_fft_256_fft_fast_Pipeline_VITIS_LOOP_8_1_br_lut_ROM_AUTO_1R RTLNAME doppler_fft_256_fft_fast_Pipeline_VITIS_LOOP_8_1_br_lut_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME fft_fast_Pipeline_VITIS_LOOP_23_4 MODELNAME fft_fast_Pipeline_VITIS_LOOP_23_4 RTLNAME doppler_fft_256_fft_fast_Pipeline_VITIS_LOOP_23_4
    SUBMODULES {
      {MODELNAME doppler_fft_256_faddfsub_32ns_32ns_32_5_full_dsp_1 RTLNAME doppler_fft_256_faddfsub_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fsub IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME doppler_fft_256_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME doppler_fft_256_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME doppler_fft_256_fft_fast_Pipeline_VITIS_LOOP_23_4_tw_M_value_1_ROM_AUTO_1R RTLNAME doppler_fft_256_fft_fast_Pipeline_VITIS_LOOP_23_4_tw_M_value_1_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME doppler_fft_256_fft_fast_Pipeline_VITIS_LOOP_23_4_tw_M_value_ROM_AUTO_1R RTLNAME doppler_fft_256_fft_fast_Pipeline_VITIS_LOOP_23_4_tw_M_value_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME fft_fast MODELNAME fft_fast RTLNAME doppler_fft_256_fft_fast}
  {SRCNAME doppler_fft_256_Pipeline_VITIS_LOOP_38_1 MODELNAME doppler_fft_256_Pipeline_VITIS_LOOP_38_1 RTLNAME doppler_fft_256_doppler_fft_256_Pipeline_VITIS_LOOP_38_1}
  {SRCNAME doppler_fft_256_Pipeline_VITIS_LOOP_66_2 MODELNAME doppler_fft_256_Pipeline_VITIS_LOOP_66_2 RTLNAME doppler_fft_256_doppler_fft_256_Pipeline_VITIS_LOOP_66_2}
  {SRCNAME doppler_fft_256 MODELNAME doppler_fft_256 RTLNAME doppler_fft_256 IS_TOP 1
    SUBMODULES {
      {MODELNAME doppler_fft_256_range_dop_map_M_value_RAM_AUTO_1R1W RTLNAME doppler_fft_256_range_dop_map_M_value_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME doppler_fft_256_regslice_both RTLNAME doppler_fft_256_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME doppler_fft_256_regslice_both_U}
    }
  }
}
