set SynModuleInfo {
  {SRCNAME doppler_fft_256_Pipeline_VITIS_LOOP_65_1 MODELNAME doppler_fft_256_Pipeline_VITIS_LOOP_65_1 RTLNAME doppler_fft_256_doppler_fft_256_Pipeline_VITIS_LOOP_65_1
    SUBMODULES {
      {MODELNAME doppler_fft_256_fpext_32ns_64_2_no_dsp_1 RTLNAME doppler_fft_256_fpext_32ns_64_2_no_dsp_1 BINDTYPE op TYPE fpext IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME doppler_fft_256_flow_control_loop_pipe_sequential_init RTLNAME doppler_fft_256_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME doppler_fft_256_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME fft_fast_Pipeline_VITIS_LOOP_8_1 MODELNAME fft_fast_Pipeline_VITIS_LOOP_8_1 RTLNAME doppler_fft_256_fft_fast_Pipeline_VITIS_LOOP_8_1
    SUBMODULES {
      {MODELNAME doppler_fft_256_fft_fast_Pipeline_VITIS_LOOP_8_1_br_lut_ROM_AUTO_1R RTLNAME doppler_fft_256_fft_fast_Pipeline_VITIS_LOOP_8_1_br_lut_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME fft_fast_Pipeline_VITIS_LOOP_23_4 MODELNAME fft_fast_Pipeline_VITIS_LOOP_23_4 RTLNAME doppler_fft_256_fft_fast_Pipeline_VITIS_LOOP_23_4
    SUBMODULES {
      {MODELNAME doppler_fft_256_mul_mul_19s_19s_36_4_1 RTLNAME doppler_fft_256_mul_mul_19s_19s_36_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME doppler_fft_256_fft_fast_Pipeline_VITIS_LOOP_23_4_tw_M_value_1_ROM_AUTO_1R RTLNAME doppler_fft_256_fft_fast_Pipeline_VITIS_LOOP_23_4_tw_M_value_1_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME doppler_fft_256_fft_fast_Pipeline_VITIS_LOOP_23_4_tw_M_value_ROM_AUTO_1R RTLNAME doppler_fft_256_fft_fast_Pipeline_VITIS_LOOP_23_4_tw_M_value_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME fft_fast MODELNAME fft_fast RTLNAME doppler_fft_256_fft_fast}
  {SRCNAME doppler_fft_256_Pipeline_VITIS_LOOP_49_1 MODELNAME doppler_fft_256_Pipeline_VITIS_LOOP_49_1 RTLNAME doppler_fft_256_doppler_fft_256_Pipeline_VITIS_LOOP_49_1}
  {SRCNAME doppler_fft_256_Pipeline_VITIS_LOOP_74_2 MODELNAME doppler_fft_256_Pipeline_VITIS_LOOP_74_2 RTLNAME doppler_fft_256_doppler_fft_256_Pipeline_VITIS_LOOP_74_2}
  {SRCNAME doppler_fft_256 MODELNAME doppler_fft_256 RTLNAME doppler_fft_256 IS_TOP 1
    SUBMODULES {
      {MODELNAME doppler_fft_256_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME doppler_fft_256_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME doppler_fft_256_buf_M_real_V_RAM_AUTO_1R1W RTLNAME doppler_fft_256_buf_M_real_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME doppler_fft_256_regslice_both RTLNAME doppler_fft_256_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME doppler_fft_256_regslice_both_U}
    }
  }
}
