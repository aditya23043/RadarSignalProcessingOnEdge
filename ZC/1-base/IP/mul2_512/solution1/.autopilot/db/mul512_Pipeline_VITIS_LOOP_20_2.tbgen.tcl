set moduleName mul512_Pipeline_VITIS_LOOP_20_2
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
set C_modelName {mul512_Pipeline_VITIS_LOOP_20_2}
set C_modelType { void 0 }
set C_modelArgList {
	{ zc_M_value float 32 regular {array 512 { 1 3 } 1 1 }  }
	{ zc_M_value_1 float 32 regular {array 512 { 1 3 } 1 1 }  }
	{ output_zc_M_value float 32 regular {array 512 { 0 3 } 0 1 }  }
	{ output_zc_M_value_1 float 32 regular {array 512 { 0 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "zc_M_value", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "zc_M_value_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "output_zc_M_value", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "output_zc_M_value_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ zc_M_value_address0 sc_out sc_lv 9 signal 0 } 
	{ zc_M_value_ce0 sc_out sc_logic 1 signal 0 } 
	{ zc_M_value_q0 sc_in sc_lv 32 signal 0 } 
	{ zc_M_value_1_address0 sc_out sc_lv 9 signal 1 } 
	{ zc_M_value_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ zc_M_value_1_q0 sc_in sc_lv 32 signal 1 } 
	{ output_zc_M_value_address0 sc_out sc_lv 9 signal 2 } 
	{ output_zc_M_value_ce0 sc_out sc_logic 1 signal 2 } 
	{ output_zc_M_value_we0 sc_out sc_logic 1 signal 2 } 
	{ output_zc_M_value_d0 sc_out sc_lv 32 signal 2 } 
	{ output_zc_M_value_1_address0 sc_out sc_lv 9 signal 3 } 
	{ output_zc_M_value_1_ce0 sc_out sc_logic 1 signal 3 } 
	{ output_zc_M_value_1_we0 sc_out sc_logic 1 signal 3 } 
	{ output_zc_M_value_1_d0 sc_out sc_lv 32 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "zc_M_value_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "zc_M_value", "role": "address0" }} , 
 	{ "name": "zc_M_value_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "zc_M_value", "role": "ce0" }} , 
 	{ "name": "zc_M_value_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "zc_M_value", "role": "q0" }} , 
 	{ "name": "zc_M_value_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "zc_M_value_1", "role": "address0" }} , 
 	{ "name": "zc_M_value_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "zc_M_value_1", "role": "ce0" }} , 
 	{ "name": "zc_M_value_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "zc_M_value_1", "role": "q0" }} , 
 	{ "name": "output_zc_M_value_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "output_zc_M_value", "role": "address0" }} , 
 	{ "name": "output_zc_M_value_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_zc_M_value", "role": "ce0" }} , 
 	{ "name": "output_zc_M_value_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_zc_M_value", "role": "we0" }} , 
 	{ "name": "output_zc_M_value_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "output_zc_M_value", "role": "d0" }} , 
 	{ "name": "output_zc_M_value_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "output_zc_M_value_1", "role": "address0" }} , 
 	{ "name": "output_zc_M_value_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_zc_M_value_1", "role": "ce0" }} , 
 	{ "name": "output_zc_M_value_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_zc_M_value_1", "role": "we0" }} , 
 	{ "name": "output_zc_M_value_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "output_zc_M_value_1", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9"],
		"CDFG" : "mul512_Pipeline_VITIS_LOOP_20_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "524", "EstimateLatencyMax" : "524",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zc_M_value", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "zc_M_value_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "output_zc_M_value", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "output_zc_M_value_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "zc_conj_M_value_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "zc_conj_M_value", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_20_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter11", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter11", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.zc_conj_M_value_1_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.zc_conj_M_value_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fsub_32ns_32ns_32_5_full_dsp_1_U11", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U12", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U13", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U14", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U15", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U16", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	mul512_Pipeline_VITIS_LOOP_20_2 {
		zc_M_value {Type I LastRead 0 FirstWrite -1}
		zc_M_value_1 {Type I LastRead 0 FirstWrite -1}
		output_zc_M_value {Type O LastRead -1 FirstWrite 11}
		output_zc_M_value_1 {Type O LastRead -1 FirstWrite 11}
		zc_conj_M_value_1 {Type I LastRead -1 FirstWrite -1}
		zc_conj_M_value {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "524", "Max" : "524"}
	, {"Name" : "Interval", "Min" : "524", "Max" : "524"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	zc_M_value { ap_memory {  { zc_M_value_address0 mem_address 1 9 }  { zc_M_value_ce0 mem_ce 1 1 }  { zc_M_value_q0 mem_dout 0 32 } } }
	zc_M_value_1 { ap_memory {  { zc_M_value_1_address0 mem_address 1 9 }  { zc_M_value_1_ce0 mem_ce 1 1 }  { zc_M_value_1_q0 mem_dout 0 32 } } }
	output_zc_M_value { ap_memory {  { output_zc_M_value_address0 mem_address 1 9 }  { output_zc_M_value_ce0 mem_ce 1 1 }  { output_zc_M_value_we0 mem_we 1 1 }  { output_zc_M_value_d0 mem_din 1 32 } } }
	output_zc_M_value_1 { ap_memory {  { output_zc_M_value_1_address0 mem_address 1 9 }  { output_zc_M_value_1_ce0 mem_ce 1 1 }  { output_zc_M_value_1_we0 mem_we 1 1 }  { output_zc_M_value_1_d0 mem_din 1 32 } } }
}
