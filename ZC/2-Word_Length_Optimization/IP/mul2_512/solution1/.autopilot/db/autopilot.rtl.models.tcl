set SynModuleInfo {
  {SRCNAME mul512_Pipeline_1 MODELNAME mul512_Pipeline_1 RTLNAME mul512_mul512_Pipeline_1
    SUBMODULES {
      {MODELNAME mul512_flow_control_loop_pipe_sequential_init RTLNAME mul512_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME mul512_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME mul512_Pipeline_2 MODELNAME mul512_Pipeline_2 RTLNAME mul512_mul512_Pipeline_2}
  {SRCNAME mul512_Pipeline_VITIS_LOOP_15_1 MODELNAME mul512_Pipeline_VITIS_LOOP_15_1 RTLNAME mul512_mul512_Pipeline_VITIS_LOOP_15_1}
  {SRCNAME mul512_Pipeline_VITIS_LOOP_20_2 MODELNAME mul512_Pipeline_VITIS_LOOP_20_2 RTLNAME mul512_mul512_Pipeline_VITIS_LOOP_20_2
    SUBMODULES {
      {MODELNAME mul512_fsub_32ns_32ns_32_5_full_dsp_1 RTLNAME mul512_fsub_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fsub IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME mul512_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME mul512_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME mul512_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME mul512_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME mul512_mul512_Pipeline_VITIS_LOOP_20_2_zc_conj_M_value_1_ROM_AUTO_1R RTLNAME mul512_mul512_Pipeline_VITIS_LOOP_20_2_zc_conj_M_value_1_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME mul512_mul512_Pipeline_VITIS_LOOP_20_2_zc_conj_M_value_ROM_AUTO_1R RTLNAME mul512_mul512_Pipeline_VITIS_LOOP_20_2_zc_conj_M_value_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME mul512_Pipeline_VITIS_LOOP_25_3 MODELNAME mul512_Pipeline_VITIS_LOOP_25_3 RTLNAME mul512_mul512_Pipeline_VITIS_LOOP_25_3}
  {SRCNAME mul512 MODELNAME mul512 RTLNAME mul512 IS_TOP 1
    SUBMODULES {
      {MODELNAME mul512_zc_M_value_RAM_AUTO_1R1W RTLNAME mul512_zc_M_value_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME mul512_regslice_both RTLNAME mul512_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME mul512_regslice_both_U}
    }
  }
}
