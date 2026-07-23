set moduleName fft_1024_top_Pipeline_VITIS_LOOP_65_4
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
set C_modelName {fft_1024_top_Pipeline_VITIS_LOOP_65_4}
set C_modelType { void 0 }
set C_modelArgList {
	{ gb_M_value float 32 regular {array 1024 { 1 3 } 1 1 }  }
	{ gb_M_value_1 float 32 regular {array 1024 { 1 3 } 1 1 }  }
	{ output_r_V_data_V int 64 regular {axi_s 1 volatile  { output_r Data } }  }
	{ output_r_V_keep_V int 8 regular {axi_s 1 volatile  { output_r Keep } }  }
	{ output_r_V_strb_V int 8 regular {axi_s 1 volatile  { output_r Strb } }  }
	{ output_r_V_last_V int 1 regular {axi_s 1 volatile  { output_r Last } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "gb_M_value", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "gb_M_value_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "output_r_V_data_V", "interface" : "axis", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "output_r_V_keep_V", "interface" : "axis", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "output_r_V_strb_V", "interface" : "axis", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "output_r_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 18
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ output_r_TREADY sc_in sc_logic 1 outacc 2 } 
	{ gb_M_value_address0 sc_out sc_lv 10 signal 0 } 
	{ gb_M_value_ce0 sc_out sc_logic 1 signal 0 } 
	{ gb_M_value_q0 sc_in sc_lv 32 signal 0 } 
	{ gb_M_value_1_address0 sc_out sc_lv 10 signal 1 } 
	{ gb_M_value_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ gb_M_value_1_q0 sc_in sc_lv 32 signal 1 } 
	{ output_r_TDATA sc_out sc_lv 64 signal 2 } 
	{ output_r_TVALID sc_out sc_logic 1 outvld 5 } 
	{ output_r_TKEEP sc_out sc_lv 8 signal 3 } 
	{ output_r_TSTRB sc_out sc_lv 8 signal 4 } 
	{ output_r_TLAST sc_out sc_lv 1 signal 5 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "output_r_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "output_r_V_data_V", "role": "default" }} , 
 	{ "name": "gb_M_value_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gb_M_value", "role": "address0" }} , 
 	{ "name": "gb_M_value_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gb_M_value", "role": "ce0" }} , 
 	{ "name": "gb_M_value_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gb_M_value", "role": "q0" }} , 
 	{ "name": "gb_M_value_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gb_M_value_1", "role": "address0" }} , 
 	{ "name": "gb_M_value_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gb_M_value_1", "role": "ce0" }} , 
 	{ "name": "gb_M_value_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gb_M_value_1", "role": "q0" }} , 
 	{ "name": "output_r_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "output_r_V_data_V", "role": "default" }} , 
 	{ "name": "output_r_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "output_r_V_last_V", "role": "default" }} , 
 	{ "name": "output_r_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "output_r_V_keep_V", "role": "default" }} , 
 	{ "name": "output_r_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "output_r_V_strb_V", "role": "default" }} , 
 	{ "name": "output_r_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "output_r_V_last_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "fft_1024_top_Pipeline_VITIS_LOOP_65_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "1026",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "gb_M_value", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "gb_M_value_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "output_r_V_data_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "output_r_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "output_r_V_keep_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "output_r_V_strb_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "output_r_V_last_V", "Type" : "Axis", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_65_4", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_1024_top_Pipeline_VITIS_LOOP_65_4 {
		gb_M_value {Type I LastRead 0 FirstWrite -1}
		gb_M_value_1 {Type I LastRead 0 FirstWrite -1}
		output_r_V_data_V {Type O LastRead -1 FirstWrite 1}
		output_r_V_keep_V {Type O LastRead -1 FirstWrite 1}
		output_r_V_strb_V {Type O LastRead -1 FirstWrite 1}
		output_r_V_last_V {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1026", "Max" : "1026"}
	, {"Name" : "Interval", "Min" : "1026", "Max" : "1026"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	gb_M_value { ap_memory {  { gb_M_value_address0 mem_address 1 10 }  { gb_M_value_ce0 mem_ce 1 1 }  { gb_M_value_q0 in_data 0 32 } } }
	gb_M_value_1 { ap_memory {  { gb_M_value_1_address0 mem_address 1 10 }  { gb_M_value_1_ce0 mem_ce 1 1 }  { gb_M_value_1_q0 in_data 0 32 } } }
	output_r_V_data_V { axis {  { output_r_TREADY out_acc 0 1 }  { output_r_TDATA out_data 1 64 } } }
	output_r_V_keep_V { axis {  { output_r_TKEEP out_data 1 8 } } }
	output_r_V_strb_V { axis {  { output_r_TSTRB out_data 1 8 } } }
	output_r_V_last_V { axis {  { output_r_TVALID out_vld 1 1 }  { output_r_TLAST out_data 1 1 } } }
}
