set moduleName fft_512_top_Pipeline_VITIS_LOOP_44_1
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
set C_modelName {fft_512_top_Pipeline_VITIS_LOOP_44_1}
set C_modelType { void 0 }
set C_modelArgList {
	{ input_r_V_data_V int 64 regular {axi_s 0 volatile  { input_r Data } }  }
	{ input_r_V_keep_V int 8 regular {axi_s 0 volatile  { input_r Keep } }  }
	{ input_r_V_strb_V int 8 regular {axi_s 0 volatile  { input_r Strb } }  }
	{ input_r_V_last_V int 1 regular {axi_s 0 volatile  { input_r Last } }  }
	{ zc_M_value float 32 regular {array 512 { 0 3 } 0 1 }  }
	{ zc_M_value_1 float 32 regular {array 512 { 0 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "input_r_V_data_V", "interface" : "axis", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "input_r_V_keep_V", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "input_r_V_strb_V", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "input_r_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "zc_M_value", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "zc_M_value_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ input_r_TVALID sc_in sc_logic 1 invld 0 } 
	{ input_r_TDATA sc_in sc_lv 64 signal 0 } 
	{ input_r_TREADY sc_out sc_logic 1 inacc 3 } 
	{ input_r_TKEEP sc_in sc_lv 8 signal 1 } 
	{ input_r_TSTRB sc_in sc_lv 8 signal 2 } 
	{ input_r_TLAST sc_in sc_lv 1 signal 3 } 
	{ zc_M_value_address0 sc_out sc_lv 9 signal 4 } 
	{ zc_M_value_ce0 sc_out sc_logic 1 signal 4 } 
	{ zc_M_value_we0 sc_out sc_logic 1 signal 4 } 
	{ zc_M_value_d0 sc_out sc_lv 32 signal 4 } 
	{ zc_M_value_1_address0 sc_out sc_lv 9 signal 5 } 
	{ zc_M_value_1_ce0 sc_out sc_logic 1 signal 5 } 
	{ zc_M_value_1_we0 sc_out sc_logic 1 signal 5 } 
	{ zc_M_value_1_d0 sc_out sc_lv 32 signal 5 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "input_r_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "input_r_V_data_V", "role": "default" }} , 
 	{ "name": "input_r_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "input_r_V_data_V", "role": "default" }} , 
 	{ "name": "input_r_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "input_r_V_last_V", "role": "default" }} , 
 	{ "name": "input_r_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "input_r_V_keep_V", "role": "default" }} , 
 	{ "name": "input_r_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "input_r_V_strb_V", "role": "default" }} , 
 	{ "name": "input_r_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "input_r_V_last_V", "role": "default" }} , 
 	{ "name": "zc_M_value_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "zc_M_value", "role": "address0" }} , 
 	{ "name": "zc_M_value_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "zc_M_value", "role": "ce0" }} , 
 	{ "name": "zc_M_value_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "zc_M_value", "role": "we0" }} , 
 	{ "name": "zc_M_value_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "zc_M_value", "role": "d0" }} , 
 	{ "name": "zc_M_value_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "zc_M_value_1", "role": "address0" }} , 
 	{ "name": "zc_M_value_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "zc_M_value_1", "role": "ce0" }} , 
 	{ "name": "zc_M_value_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "zc_M_value_1", "role": "we0" }} , 
 	{ "name": "zc_M_value_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "zc_M_value_1", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "fft_512_top_Pipeline_VITIS_LOOP_44_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "514", "EstimateLatencyMax" : "514",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r_V_data_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "input_r_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_r_V_keep_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "input_r_V_strb_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "input_r_V_last_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "zc_M_value", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "zc_M_value_1", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_44_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_512_top_Pipeline_VITIS_LOOP_44_1 {
		input_r_V_data_V {Type I LastRead 0 FirstWrite -1}
		input_r_V_keep_V {Type I LastRead 0 FirstWrite -1}
		input_r_V_strb_V {Type I LastRead 0 FirstWrite -1}
		input_r_V_last_V {Type I LastRead 0 FirstWrite -1}
		zc_M_value {Type O LastRead -1 FirstWrite 0}
		zc_M_value_1 {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "514", "Max" : "514"}
	, {"Name" : "Interval", "Min" : "514", "Max" : "514"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	input_r_V_data_V { axis {  { input_r_TVALID in_vld 0 1 }  { input_r_TDATA in_data 0 64 } } }
	input_r_V_keep_V { axis {  { input_r_TKEEP in_data 0 8 } } }
	input_r_V_strb_V { axis {  { input_r_TSTRB in_data 0 8 } } }
	input_r_V_last_V { axis {  { input_r_TREADY in_acc 1 1 }  { input_r_TLAST in_data 0 1 } } }
	zc_M_value { ap_memory {  { zc_M_value_address0 mem_address 1 9 }  { zc_M_value_ce0 mem_ce 1 1 }  { zc_M_value_we0 mem_we 1 1 }  { zc_M_value_d0 mem_din 1 32 } } }
	zc_M_value_1 { ap_memory {  { zc_M_value_1_address0 mem_address 1 9 }  { zc_M_value_1_ce0 mem_ce 1 1 }  { zc_M_value_1_we0 mem_we 1 1 }  { zc_M_value_1_d0 mem_din 1 32 } } }
}
