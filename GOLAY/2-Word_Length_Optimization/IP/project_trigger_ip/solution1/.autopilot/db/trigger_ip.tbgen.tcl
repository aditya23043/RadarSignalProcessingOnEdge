set moduleName trigger_ip
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {trigger_ip}
set C_modelType { void 0 }
set C_modelArgList {
	{ s_axis_in_V_data_V int 64 regular {axi_s 0 volatile  { s_axis_in Data } }  }
	{ s_axis_in_V_keep_V int 8 regular {axi_s 0 volatile  { s_axis_in Keep } }  }
	{ s_axis_in_V_strb_V int 8 regular {axi_s 0 volatile  { s_axis_in Strb } }  }
	{ s_axis_in_V_last_V int 1 regular {axi_s 0 volatile  { s_axis_in Last } }  }
	{ m_axis_out_V_data_V int 64 regular {axi_s 1 volatile  { m_axis_out Data } }  }
	{ m_axis_out_V_keep_V int 8 regular {axi_s 1 volatile  { m_axis_out Keep } }  }
	{ m_axis_out_V_strb_V int 8 regular {axi_s 1 volatile  { m_axis_out Strb } }  }
	{ m_axis_out_V_last_V int 1 regular {axi_s 1 volatile  { m_axis_out Last } }  }
	{ sync_reset int 1 regular {axi_slave 0}  }
	{ trigger_done int 1 regular {axi_slave 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "s_axis_in_V_data_V", "interface" : "axis", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_in_V_keep_V", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_in_V_strb_V", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_in_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "m_axis_out_V_data_V", "interface" : "axis", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_out_V_keep_V", "interface" : "axis", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_out_V_strb_V", "interface" : "axis", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_out_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "sync_reset", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 1, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":23}} , 
 	{ "Name" : "trigger_done", "interface" : "axi_slave", "bundle":"control","type":"ap_ovld_nt","bitwidth" : 1, "direction" : "WRITEONLY", "offset" : {"out":24}, "offset_end" : {"out":31}} ]}
# RTL Port declarations: 
set portNum 32
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ s_axis_in_TVALID sc_in sc_logic 1 invld 3 } 
	{ m_axis_out_TREADY sc_in sc_logic 1 outacc 7 } 
	{ s_axis_in_TDATA sc_in sc_lv 64 signal 0 } 
	{ s_axis_in_TREADY sc_out sc_logic 1 inacc 3 } 
	{ s_axis_in_TKEEP sc_in sc_lv 8 signal 1 } 
	{ s_axis_in_TSTRB sc_in sc_lv 8 signal 2 } 
	{ s_axis_in_TLAST sc_in sc_lv 1 signal 3 } 
	{ m_axis_out_TDATA sc_out sc_lv 64 signal 4 } 
	{ m_axis_out_TVALID sc_out sc_logic 1 outvld 7 } 
	{ m_axis_out_TKEEP sc_out sc_lv 8 signal 5 } 
	{ m_axis_out_TSTRB sc_out sc_lv 8 signal 6 } 
	{ m_axis_out_TLAST sc_out sc_lv 1 signal 7 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 5 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 5 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"trigger_ip","role":"start","value":"0","valid_bit":"0"},{"name":"trigger_ip","role":"continue","value":"0","valid_bit":"4"},{"name":"trigger_ip","role":"auto_start","value":"0","valid_bit":"7"},{"name":"sync_reset","role":"data","value":"16"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"trigger_ip","role":"start","value":"0","valid_bit":"0"},{"name":"trigger_ip","role":"done","value":"0","valid_bit":"1"},{"name":"trigger_ip","role":"idle","value":"0","valid_bit":"2"},{"name":"trigger_ip","role":"ready","value":"0","valid_bit":"3"},{"name":"trigger_ip","role":"auto_start","value":"0","valid_bit":"7"},{"name":"trigger_done","role":"data","value":"24"}, {"name":"trigger_done","role":"valid","value":"28","valid_bit":"0"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "s_axis_in_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_in_V_last_V", "role": "default" }} , 
 	{ "name": "m_axis_out_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_out_V_last_V", "role": "default" }} , 
 	{ "name": "s_axis_in_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "s_axis_in_V_data_V", "role": "default" }} , 
 	{ "name": "s_axis_in_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_in_V_last_V", "role": "default" }} , 
 	{ "name": "s_axis_in_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "s_axis_in_V_keep_V", "role": "default" }} , 
 	{ "name": "s_axis_in_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "s_axis_in_V_strb_V", "role": "default" }} , 
 	{ "name": "s_axis_in_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_in_V_last_V", "role": "default" }} , 
 	{ "name": "m_axis_out_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "m_axis_out_V_data_V", "role": "default" }} , 
 	{ "name": "m_axis_out_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_out_V_last_V", "role": "default" }} , 
 	{ "name": "m_axis_out_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "m_axis_out_V_keep_V", "role": "default" }} , 
 	{ "name": "m_axis_out_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "m_axis_out_V_strb_V", "role": "default" }} , 
 	{ "name": "m_axis_out_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_axis_out_V_last_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9"],
		"CDFG" : "trigger_ip",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "2", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "2",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "s_axis_in_V_data_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_axis_in_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s_axis_in_V_keep_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "s_axis_in_V_strb_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "s_axis_in_V_last_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "m_axis_out_V_data_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "m_axis_out_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "m_axis_out_V_keep_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "m_axis_out_V_strb_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "m_axis_out_V_last_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "sync_reset", "Type" : "None", "Direction" : "I"},
			{"Name" : "trigger_done", "Type" : "OVld", "Direction" : "O"},
			{"Name" : "samp_cnt_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "batch_cnt_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "done_V", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_axis_in_V_data_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_axis_in_V_keep_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_axis_in_V_strb_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_axis_in_V_last_V_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_m_axis_out_V_data_V_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_m_axis_out_V_keep_V_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_m_axis_out_V_strb_V_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_m_axis_out_V_last_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	trigger_ip {
		s_axis_in_V_data_V {Type I LastRead 0 FirstWrite -1}
		s_axis_in_V_keep_V {Type I LastRead 0 FirstWrite -1}
		s_axis_in_V_strb_V {Type I LastRead 0 FirstWrite -1}
		s_axis_in_V_last_V {Type I LastRead 0 FirstWrite -1}
		m_axis_out_V_data_V {Type O LastRead -1 FirstWrite 1}
		m_axis_out_V_keep_V {Type O LastRead -1 FirstWrite 1}
		m_axis_out_V_strb_V {Type O LastRead -1 FirstWrite 1}
		m_axis_out_V_last_V {Type O LastRead -1 FirstWrite 1}
		sync_reset {Type I LastRead 0 FirstWrite -1}
		trigger_done {Type O LastRead -1 FirstWrite 1}
		samp_cnt_V {Type IO LastRead -1 FirstWrite -1}
		batch_cnt_V {Type IO LastRead -1 FirstWrite -1}
		done_V {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "2"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	s_axis_in_V_data_V { axis {  { s_axis_in_TDATA in_data 0 64 } } }
	s_axis_in_V_keep_V { axis {  { s_axis_in_TKEEP in_data 0 8 } } }
	s_axis_in_V_strb_V { axis {  { s_axis_in_TSTRB in_data 0 8 } } }
	s_axis_in_V_last_V { axis {  { s_axis_in_TVALID in_vld 0 1 }  { s_axis_in_TREADY in_acc 1 1 }  { s_axis_in_TLAST in_data 0 1 } } }
	m_axis_out_V_data_V { axis {  { m_axis_out_TDATA out_data 1 64 } } }
	m_axis_out_V_keep_V { axis {  { m_axis_out_TKEEP out_data 1 8 } } }
	m_axis_out_V_strb_V { axis {  { m_axis_out_TSTRB out_data 1 8 } } }
	m_axis_out_V_last_V { axis {  { m_axis_out_TREADY out_acc 0 1 }  { m_axis_out_TVALID out_vld 1 1 }  { m_axis_out_TLAST out_data 1 1 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
