set SynModuleInfo {
  {SRCNAME trigger_ip MODELNAME trigger_ip RTLNAME trigger_ip IS_TOP 1
    SUBMODULES {
      {MODELNAME trigger_ip_control_s_axi RTLNAME trigger_ip_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME trigger_ip_regslice_both RTLNAME trigger_ip_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME trigger_ip_regslice_both_U}
    }
  }
}
