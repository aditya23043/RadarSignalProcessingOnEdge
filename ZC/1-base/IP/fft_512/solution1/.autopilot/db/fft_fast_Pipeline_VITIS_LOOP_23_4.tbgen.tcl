set moduleName fft_fast_Pipeline_VITIS_LOOP_23_4
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {fft_fast_Pipeline_VITIS_LOOP_23_4}
set C_modelType { void 0 }
set C_modelArgList {
	{ m2 int 9 regular  }
	{ trunc_ln22_1 int 9 regular  }
	{ trunc_ln22_2 int 9 regular  }
	{ x_0 float 32 regular {array 512 { 2 2 } 1 1 }  }
	{ x_1 float 32 regular {array 512 { 2 2 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "m2", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "trunc_ln22_1", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "trunc_ln22_2", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "x_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "x_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 29
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m2 sc_in sc_lv 9 signal 0 } 
	{ trunc_ln22_1 sc_in sc_lv 9 signal 1 } 
	{ trunc_ln22_2 sc_in sc_lv 9 signal 2 } 
	{ x_0_address0 sc_out sc_lv 9 signal 3 } 
	{ x_0_ce0 sc_out sc_logic 1 signal 3 } 
	{ x_0_we0 sc_out sc_logic 1 signal 3 } 
	{ x_0_d0 sc_out sc_lv 32 signal 3 } 
	{ x_0_q0 sc_in sc_lv 32 signal 3 } 
	{ x_0_address1 sc_out sc_lv 9 signal 3 } 
	{ x_0_ce1 sc_out sc_logic 1 signal 3 } 
	{ x_0_we1 sc_out sc_logic 1 signal 3 } 
	{ x_0_d1 sc_out sc_lv 32 signal 3 } 
	{ x_0_q1 sc_in sc_lv 32 signal 3 } 
	{ x_1_address0 sc_out sc_lv 9 signal 4 } 
	{ x_1_ce0 sc_out sc_logic 1 signal 4 } 
	{ x_1_we0 sc_out sc_logic 1 signal 4 } 
	{ x_1_d0 sc_out sc_lv 32 signal 4 } 
	{ x_1_q0 sc_in sc_lv 32 signal 4 } 
	{ x_1_address1 sc_out sc_lv 9 signal 4 } 
	{ x_1_ce1 sc_out sc_logic 1 signal 4 } 
	{ x_1_we1 sc_out sc_logic 1 signal 4 } 
	{ x_1_d1 sc_out sc_lv 32 signal 4 } 
	{ x_1_q1 sc_in sc_lv 32 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m2", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "m2", "role": "default" }} , 
 	{ "name": "trunc_ln22_1", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "trunc_ln22_1", "role": "default" }} , 
 	{ "name": "trunc_ln22_2", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "trunc_ln22_2", "role": "default" }} , 
 	{ "name": "x_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "x_0", "role": "address0" }} , 
 	{ "name": "x_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_0", "role": "ce0" }} , 
 	{ "name": "x_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_0", "role": "we0" }} , 
 	{ "name": "x_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "x_0", "role": "d0" }} , 
 	{ "name": "x_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "x_0", "role": "q0" }} , 
 	{ "name": "x_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "x_0", "role": "address1" }} , 
 	{ "name": "x_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_0", "role": "ce1" }} , 
 	{ "name": "x_0_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_0", "role": "we1" }} , 
 	{ "name": "x_0_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "x_0", "role": "d1" }} , 
 	{ "name": "x_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "x_0", "role": "q1" }} , 
 	{ "name": "x_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "x_1", "role": "address0" }} , 
 	{ "name": "x_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_1", "role": "ce0" }} , 
 	{ "name": "x_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_1", "role": "we0" }} , 
 	{ "name": "x_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "x_1", "role": "d0" }} , 
 	{ "name": "x_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "x_1", "role": "q0" }} , 
 	{ "name": "x_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "x_1", "role": "address1" }} , 
 	{ "name": "x_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_1", "role": "ce1" }} , 
 	{ "name": "x_1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_1", "role": "we1" }} , 
 	{ "name": "x_1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "x_1", "role": "d1" }} , 
 	{ "name": "x_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "x_1", "role": "q1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9"],
		"CDFG" : "fft_fast_Pipeline_VITIS_LOOP_23_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "20", "EstimateLatencyMax" : "4610",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "m2", "Type" : "None", "Direction" : "I"},
			{"Name" : "trunc_ln22_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "trunc_ln22_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "x_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "tw_M_value_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "tw_M_value", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_23_4", "PipelineType" : "NotSupport"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.tw_M_value_1_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.tw_M_value_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.faddfsub_32ns_32ns_32_5_full_dsp_1_U12", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.faddfsub_32ns_32ns_32_5_full_dsp_1_U13", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U14", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U15", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U16", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U17", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_fast_Pipeline_VITIS_LOOP_23_4 {
		m2 {Type I LastRead 0 FirstWrite -1}
		trunc_ln22_1 {Type I LastRead 0 FirstWrite -1}
		trunc_ln22_2 {Type I LastRead 0 FirstWrite -1}
		x_0 {Type IO LastRead 1 FirstWrite 16}
		x_1 {Type IO LastRead 1 FirstWrite 16}
		tw_M_value_1 {Type I LastRead -1 FirstWrite -1}
		tw_M_value {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "20", "Max" : "4610"}
	, {"Name" : "Interval", "Min" : "20", "Max" : "4610"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	m2 { ap_none {  { m2 in_data 0 9 } } }
	trunc_ln22_1 { ap_none {  { trunc_ln22_1 in_data 0 9 } } }
	trunc_ln22_2 { ap_none {  { trunc_ln22_2 in_data 0 9 } } }
	x_0 { ap_memory {  { x_0_address0 mem_address 1 9 }  { x_0_ce0 mem_ce 1 1 }  { x_0_we0 mem_we 1 1 }  { x_0_d0 mem_din 1 32 }  { x_0_q0 mem_dout 0 32 }  { x_0_address1 MemPortADDR2 1 9 }  { x_0_ce1 MemPortCE2 1 1 }  { x_0_we1 MemPortWE2 1 1 }  { x_0_d1 MemPortDIN2 1 32 }  { x_0_q1 MemPortDOUT2 0 32 } } }
	x_1 { ap_memory {  { x_1_address0 mem_address 1 9 }  { x_1_ce0 mem_ce 1 1 }  { x_1_we0 mem_we 1 1 }  { x_1_d0 mem_din 1 32 }  { x_1_q0 mem_dout 0 32 }  { x_1_address1 MemPortADDR2 1 9 }  { x_1_ce1 MemPortCE2 1 1 }  { x_1_we1 MemPortWE2 1 1 }  { x_1_d1 MemPortDIN2 1 32 }  { x_1_q1 MemPortDOUT2 0 32 } } }
}
