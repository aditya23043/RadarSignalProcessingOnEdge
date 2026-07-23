set moduleName ifft_1024_top
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {ifft_1024_top}
set C_modelType { void 0 }
set C_modelArgList {
	{ input_r_V_data_V int 64 regular {axi_s 0 volatile  { input_r Data } }  }
	{ input_r_V_keep_V int 8 regular {axi_s 0 volatile  { input_r Keep } }  }
	{ input_r_V_strb_V int 8 regular {axi_s 0 volatile  { input_r Strb } }  }
	{ input_r_V_last_V int 1 regular {axi_s 0 volatile  { input_r Last } }  }
	{ output_r_V_data_V int 64 regular {axi_s 1 volatile  { output_r Data } }  }
	{ output_r_V_keep_V int 8 regular {axi_s 1 volatile  { output_r Keep } }  }
	{ output_r_V_strb_V int 8 regular {axi_s 1 volatile  { output_r Strb } }  }
	{ output_r_V_last_V int 1 regular {axi_s 1 volatile  { output_r Last } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "input_r_V_data_V", "interface" : "axis", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "input_r_V_keep_V", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "input_r_V_strb_V", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "input_r_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "output_r_V_data_V", "interface" : "axis", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "output_r_V_keep_V", "interface" : "axis", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "output_r_V_strb_V", "interface" : "axis", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "output_r_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 14
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ input_r_TDATA sc_in sc_lv 64 signal 0 } 
	{ input_r_TVALID sc_in sc_logic 1 invld 3 } 
	{ input_r_TREADY sc_out sc_logic 1 inacc 3 } 
	{ input_r_TKEEP sc_in sc_lv 8 signal 1 } 
	{ input_r_TSTRB sc_in sc_lv 8 signal 2 } 
	{ input_r_TLAST sc_in sc_lv 1 signal 3 } 
	{ output_r_TDATA sc_out sc_lv 64 signal 4 } 
	{ output_r_TVALID sc_out sc_logic 1 outvld 7 } 
	{ output_r_TREADY sc_in sc_logic 1 outacc 7 } 
	{ output_r_TKEEP sc_out sc_lv 8 signal 5 } 
	{ output_r_TSTRB sc_out sc_lv 8 signal 6 } 
	{ output_r_TLAST sc_out sc_lv 1 signal 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "input_r_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "input_r_V_data_V", "role": "default" }} , 
 	{ "name": "input_r_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "input_r_V_last_V", "role": "default" }} , 
 	{ "name": "input_r_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "input_r_V_last_V", "role": "default" }} , 
 	{ "name": "input_r_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "input_r_V_keep_V", "role": "default" }} , 
 	{ "name": "input_r_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "input_r_V_strb_V", "role": "default" }} , 
 	{ "name": "input_r_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "input_r_V_last_V", "role": "default" }} , 
 	{ "name": "output_r_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "output_r_V_data_V", "role": "default" }} , 
 	{ "name": "output_r_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "output_r_V_last_V", "role": "default" }} , 
 	{ "name": "output_r_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "output_r_V_last_V", "role": "default" }} , 
 	{ "name": "output_r_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "output_r_V_keep_V", "role": "default" }} , 
 	{ "name": "output_r_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "output_r_V_strb_V", "role": "default" }} , 
 	{ "name": "output_r_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "output_r_V_last_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "7", "9", "11", "13", "29", "45", "49", "50", "51", "52", "53", "54", "55", "56"],
		"CDFG" : "ifft_1024_top",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r_V_data_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_ifft_1024_top_Pipeline_VITIS_LOOP_53_2_fu_166", "Port" : "input_r_V_data_V", "Inst_start_state" : "7", "Inst_end_state" : "8"},
					{"ID" : "9", "SubInstance" : "grp_ifft_1024_top_Pipeline_VITIS_LOOP_48_1_fu_152", "Port" : "input_r_V_data_V", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "input_r_V_keep_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_ifft_1024_top_Pipeline_VITIS_LOOP_53_2_fu_166", "Port" : "input_r_V_keep_V", "Inst_start_state" : "7", "Inst_end_state" : "8"},
					{"ID" : "9", "SubInstance" : "grp_ifft_1024_top_Pipeline_VITIS_LOOP_48_1_fu_152", "Port" : "input_r_V_keep_V", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "input_r_V_strb_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_ifft_1024_top_Pipeline_VITIS_LOOP_53_2_fu_166", "Port" : "input_r_V_strb_V", "Inst_start_state" : "7", "Inst_end_state" : "8"},
					{"ID" : "9", "SubInstance" : "grp_ifft_1024_top_Pipeline_VITIS_LOOP_48_1_fu_152", "Port" : "input_r_V_strb_V", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "input_r_V_last_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_ifft_1024_top_Pipeline_VITIS_LOOP_53_2_fu_166", "Port" : "input_r_V_last_V", "Inst_start_state" : "7", "Inst_end_state" : "8"},
					{"ID" : "9", "SubInstance" : "grp_ifft_1024_top_Pipeline_VITIS_LOOP_48_1_fu_152", "Port" : "input_r_V_last_V", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "output_r_V_data_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_ifft_1024_top_Pipeline_VITIS_LOOP_85_3_fu_204", "Port" : "output_r_V_data_V", "Inst_start_state" : "11", "Inst_end_state" : "12"}]},
			{"Name" : "output_r_V_keep_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_ifft_1024_top_Pipeline_VITIS_LOOP_85_3_fu_204", "Port" : "output_r_V_keep_V", "Inst_start_state" : "11", "Inst_end_state" : "12"}]},
			{"Name" : "output_r_V_strb_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_ifft_1024_top_Pipeline_VITIS_LOOP_85_3_fu_204", "Port" : "output_r_V_strb_V", "Inst_start_state" : "11", "Inst_end_state" : "12"}]},
			{"Name" : "output_r_V_last_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_ifft_1024_top_Pipeline_VITIS_LOOP_85_3_fu_204", "Port" : "output_r_V_last_V", "Inst_start_state" : "11", "Inst_end_state" : "12"}]},
			{"Name" : "br_lut", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "grp_ifft_fast_fu_180", "Port" : "br_lut", "Inst_start_state" : "9", "Inst_end_state" : "10"},
					{"ID" : "29", "SubInstance" : "grp_ifft_fast_fu_192", "Port" : "br_lut", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "tw_M_value_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "grp_ifft_fast_fu_180", "Port" : "tw_M_value_1", "Inst_start_state" : "9", "Inst_end_state" : "10"},
					{"ID" : "29", "SubInstance" : "grp_ifft_fast_fu_192", "Port" : "tw_M_value_1", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "tw_M_value", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "grp_ifft_fast_fu_180", "Port" : "tw_M_value", "Inst_start_state" : "9", "Inst_end_state" : "10"},
					{"ID" : "29", "SubInstance" : "grp_ifft_fast_fu_192", "Port" : "tw_M_value", "Inst_start_state" : "9", "Inst_end_state" : "10"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ga_M_value_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ga_M_value_1_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.gb_M_value_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.gb_M_value_1_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_ifft_1024_top_Pipeline_1_fu_140", "Parent" : "0", "Child" : ["6"],
		"CDFG" : "ifft_1024_top_Pipeline_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1025", "EstimateLatencyMax" : "1025",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "ga_M_value", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ga_M_value_1", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "NotSupport"}]},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_ifft_1024_top_Pipeline_1_fu_140.flow_control_loop_pipe_sequential_init_U", "Parent" : "5"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_ifft_1024_top_Pipeline_2_fu_146", "Parent" : "0", "Child" : ["8"],
		"CDFG" : "ifft_1024_top_Pipeline_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1025", "EstimateLatencyMax" : "1025",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "gb_M_value", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "gb_M_value_1", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "NotSupport"}]},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_ifft_1024_top_Pipeline_2_fu_146.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_ifft_1024_top_Pipeline_VITIS_LOOP_48_1_fu_152", "Parent" : "0", "Child" : ["10"],
		"CDFG" : "ifft_1024_top_Pipeline_VITIS_LOOP_48_1",
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
			{"Name" : "input_r_V_data_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "input_r_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_r_V_keep_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "input_r_V_strb_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "input_r_V_last_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "ga_M_value", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ga_M_value_1", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_48_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_ifft_1024_top_Pipeline_VITIS_LOOP_48_1_fu_152.flow_control_loop_pipe_sequential_init_U", "Parent" : "9"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_ifft_1024_top_Pipeline_VITIS_LOOP_53_2_fu_166", "Parent" : "0", "Child" : ["12"],
		"CDFG" : "ifft_1024_top_Pipeline_VITIS_LOOP_53_2",
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
			{"Name" : "input_r_V_data_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "input_r_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_r_V_keep_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "input_r_V_strb_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "input_r_V_last_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "gb_M_value", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "gb_M_value_1", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_53_2", "PipelineType" : "NotSupport"}]},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_ifft_1024_top_Pipeline_VITIS_LOOP_53_2_fu_166.flow_control_loop_pipe_sequential_init_U", "Parent" : "11"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_ifft_fast_fu_180", "Parent" : "0", "Child" : ["14", "17", "19", "27", "28"],
		"CDFG" : "ifft_fast",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_ifft_fast_Pipeline_VITIS_LOOP_33_5_fu_77", "Port" : "x_0", "Inst_start_state" : "3", "Inst_end_state" : "7"},
					{"ID" : "19", "SubInstance" : "grp_ifft_fast_Pipeline_VITIS_LOOP_22_4_fu_85", "Port" : "x_0", "Inst_start_state" : "5", "Inst_end_state" : "6"},
					{"ID" : "14", "SubInstance" : "grp_ifft_fast_Pipeline_VITIS_LOOP_7_1_fu_67", "Port" : "x_0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "x_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_ifft_fast_Pipeline_VITIS_LOOP_33_5_fu_77", "Port" : "x_1", "Inst_start_state" : "3", "Inst_end_state" : "7"},
					{"ID" : "19", "SubInstance" : "grp_ifft_fast_Pipeline_VITIS_LOOP_22_4_fu_85", "Port" : "x_1", "Inst_start_state" : "5", "Inst_end_state" : "6"},
					{"ID" : "14", "SubInstance" : "grp_ifft_fast_Pipeline_VITIS_LOOP_7_1_fu_67", "Port" : "x_1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "br_lut", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_ifft_fast_Pipeline_VITIS_LOOP_7_1_fu_67", "Port" : "br_lut", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "tw_M_value_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "19", "SubInstance" : "grp_ifft_fast_Pipeline_VITIS_LOOP_22_4_fu_85", "Port" : "tw_M_value_1", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "tw_M_value", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "19", "SubInstance" : "grp_ifft_fast_Pipeline_VITIS_LOOP_22_4_fu_85", "Port" : "tw_M_value", "Inst_start_state" : "5", "Inst_end_state" : "6"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_21_3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "7", "FirstState" : "ap_ST_fsm_state4", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state4"], "PreState" : ["ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state3"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_18_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "7", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state7"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_ifft_fast_fu_180.grp_ifft_fast_Pipeline_VITIS_LOOP_7_1_fu_67", "Parent" : "13", "Child" : ["15", "16"],
		"CDFG" : "ifft_fast_Pipeline_VITIS_LOOP_7_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "3075", "EstimateLatencyMax" : "3075",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "x_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "br_lut", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_7_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "15", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ifft_fast_fu_180.grp_ifft_fast_Pipeline_VITIS_LOOP_7_1_fu_67.br_lut_U", "Parent" : "14"},
	{"ID" : "16", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ifft_fast_fu_180.grp_ifft_fast_Pipeline_VITIS_LOOP_7_1_fu_67.flow_control_loop_pipe_sequential_init_U", "Parent" : "14"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_ifft_fast_fu_180.grp_ifft_fast_Pipeline_VITIS_LOOP_33_5_fu_77", "Parent" : "13", "Child" : ["18"],
		"CDFG" : "ifft_fast_Pipeline_VITIS_LOOP_33_5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1031", "EstimateLatencyMax" : "1031",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "x_1", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_33_5", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter6", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter6", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "18", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ifft_fast_fu_180.grp_ifft_fast_Pipeline_VITIS_LOOP_33_5_fu_77.flow_control_loop_pipe_sequential_init_U", "Parent" : "17"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_ifft_fast_fu_180.grp_ifft_fast_Pipeline_VITIS_LOOP_22_4_fu_85", "Parent" : "13", "Child" : ["20", "21", "22", "23", "24", "25", "26"],
		"CDFG" : "ifft_fast_Pipeline_VITIS_LOOP_22_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "20", "EstimateLatencyMax" : "9218",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "m2", "Type" : "None", "Direction" : "I"},
			{"Name" : "trunc_ln21_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "trunc_ln21_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "x_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "tw_M_value_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "tw_M_value", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_22_4", "PipelineType" : "NotSupport"}]},
	{"ID" : "20", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ifft_fast_fu_180.grp_ifft_fast_Pipeline_VITIS_LOOP_22_4_fu_85.tw_M_value_1_U", "Parent" : "19"},
	{"ID" : "21", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ifft_fast_fu_180.grp_ifft_fast_Pipeline_VITIS_LOOP_22_4_fu_85.tw_M_value_U", "Parent" : "19"},
	{"ID" : "22", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ifft_fast_fu_180.grp_ifft_fast_Pipeline_VITIS_LOOP_22_4_fu_85.faddfsub_32ns_32ns_32_5_full_dsp_1_U20", "Parent" : "19"},
	{"ID" : "23", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ifft_fast_fu_180.grp_ifft_fast_Pipeline_VITIS_LOOP_22_4_fu_85.faddfsub_32ns_32ns_32_5_full_dsp_1_U21", "Parent" : "19"},
	{"ID" : "24", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ifft_fast_fu_180.grp_ifft_fast_Pipeline_VITIS_LOOP_22_4_fu_85.fmul_32ns_32ns_32_4_max_dsp_1_U24", "Parent" : "19"},
	{"ID" : "25", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ifft_fast_fu_180.grp_ifft_fast_Pipeline_VITIS_LOOP_22_4_fu_85.fmul_32ns_32ns_32_4_max_dsp_1_U25", "Parent" : "19"},
	{"ID" : "26", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ifft_fast_fu_180.grp_ifft_fast_Pipeline_VITIS_LOOP_22_4_fu_85.flow_control_loop_pipe_sequential_init_U", "Parent" : "19"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_ifft_fast_fu_180.fmul_32ns_32ns_32_4_max_dsp_1_U39", "Parent" : "13"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_ifft_fast_fu_180.fmul_32ns_32ns_32_4_max_dsp_1_U40", "Parent" : "13"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_ifft_fast_fu_192", "Parent" : "0", "Child" : ["30", "33", "35", "43", "44"],
		"CDFG" : "ifft_fast",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "33", "SubInstance" : "grp_ifft_fast_Pipeline_VITIS_LOOP_33_5_fu_77", "Port" : "x_0", "Inst_start_state" : "3", "Inst_end_state" : "7"},
					{"ID" : "35", "SubInstance" : "grp_ifft_fast_Pipeline_VITIS_LOOP_22_4_fu_85", "Port" : "x_0", "Inst_start_state" : "5", "Inst_end_state" : "6"},
					{"ID" : "30", "SubInstance" : "grp_ifft_fast_Pipeline_VITIS_LOOP_7_1_fu_67", "Port" : "x_0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "x_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "33", "SubInstance" : "grp_ifft_fast_Pipeline_VITIS_LOOP_33_5_fu_77", "Port" : "x_1", "Inst_start_state" : "3", "Inst_end_state" : "7"},
					{"ID" : "35", "SubInstance" : "grp_ifft_fast_Pipeline_VITIS_LOOP_22_4_fu_85", "Port" : "x_1", "Inst_start_state" : "5", "Inst_end_state" : "6"},
					{"ID" : "30", "SubInstance" : "grp_ifft_fast_Pipeline_VITIS_LOOP_7_1_fu_67", "Port" : "x_1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "br_lut", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "30", "SubInstance" : "grp_ifft_fast_Pipeline_VITIS_LOOP_7_1_fu_67", "Port" : "br_lut", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "tw_M_value_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "35", "SubInstance" : "grp_ifft_fast_Pipeline_VITIS_LOOP_22_4_fu_85", "Port" : "tw_M_value_1", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "tw_M_value", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "35", "SubInstance" : "grp_ifft_fast_Pipeline_VITIS_LOOP_22_4_fu_85", "Port" : "tw_M_value", "Inst_start_state" : "5", "Inst_end_state" : "6"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_21_3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "7", "FirstState" : "ap_ST_fsm_state4", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state4"], "PreState" : ["ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state3"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_18_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "7", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state7"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_ifft_fast_fu_192.grp_ifft_fast_Pipeline_VITIS_LOOP_7_1_fu_67", "Parent" : "29", "Child" : ["31", "32"],
		"CDFG" : "ifft_fast_Pipeline_VITIS_LOOP_7_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "3075", "EstimateLatencyMax" : "3075",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "x_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "br_lut", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_7_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "31", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ifft_fast_fu_192.grp_ifft_fast_Pipeline_VITIS_LOOP_7_1_fu_67.br_lut_U", "Parent" : "30"},
	{"ID" : "32", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ifft_fast_fu_192.grp_ifft_fast_Pipeline_VITIS_LOOP_7_1_fu_67.flow_control_loop_pipe_sequential_init_U", "Parent" : "30"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_ifft_fast_fu_192.grp_ifft_fast_Pipeline_VITIS_LOOP_33_5_fu_77", "Parent" : "29", "Child" : ["34"],
		"CDFG" : "ifft_fast_Pipeline_VITIS_LOOP_33_5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1031", "EstimateLatencyMax" : "1031",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "x_1", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_33_5", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter6", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter6", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "34", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ifft_fast_fu_192.grp_ifft_fast_Pipeline_VITIS_LOOP_33_5_fu_77.flow_control_loop_pipe_sequential_init_U", "Parent" : "33"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_ifft_fast_fu_192.grp_ifft_fast_Pipeline_VITIS_LOOP_22_4_fu_85", "Parent" : "29", "Child" : ["36", "37", "38", "39", "40", "41", "42"],
		"CDFG" : "ifft_fast_Pipeline_VITIS_LOOP_22_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "20", "EstimateLatencyMax" : "9218",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "m2", "Type" : "None", "Direction" : "I"},
			{"Name" : "trunc_ln21_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "trunc_ln21_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "x_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "tw_M_value_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "tw_M_value", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_22_4", "PipelineType" : "NotSupport"}]},
	{"ID" : "36", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ifft_fast_fu_192.grp_ifft_fast_Pipeline_VITIS_LOOP_22_4_fu_85.tw_M_value_1_U", "Parent" : "35"},
	{"ID" : "37", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ifft_fast_fu_192.grp_ifft_fast_Pipeline_VITIS_LOOP_22_4_fu_85.tw_M_value_U", "Parent" : "35"},
	{"ID" : "38", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ifft_fast_fu_192.grp_ifft_fast_Pipeline_VITIS_LOOP_22_4_fu_85.faddfsub_32ns_32ns_32_5_full_dsp_1_U20", "Parent" : "35"},
	{"ID" : "39", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ifft_fast_fu_192.grp_ifft_fast_Pipeline_VITIS_LOOP_22_4_fu_85.faddfsub_32ns_32ns_32_5_full_dsp_1_U21", "Parent" : "35"},
	{"ID" : "40", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ifft_fast_fu_192.grp_ifft_fast_Pipeline_VITIS_LOOP_22_4_fu_85.fmul_32ns_32ns_32_4_max_dsp_1_U24", "Parent" : "35"},
	{"ID" : "41", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ifft_fast_fu_192.grp_ifft_fast_Pipeline_VITIS_LOOP_22_4_fu_85.fmul_32ns_32ns_32_4_max_dsp_1_U25", "Parent" : "35"},
	{"ID" : "42", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ifft_fast_fu_192.grp_ifft_fast_Pipeline_VITIS_LOOP_22_4_fu_85.flow_control_loop_pipe_sequential_init_U", "Parent" : "35"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_ifft_fast_fu_192.fmul_32ns_32ns_32_4_max_dsp_1_U39", "Parent" : "29"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_ifft_fast_fu_192.fmul_32ns_32ns_32_4_max_dsp_1_U40", "Parent" : "29"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_ifft_1024_top_Pipeline_VITIS_LOOP_85_3_fu_204", "Parent" : "0", "Child" : ["46", "47", "48"],
		"CDFG" : "ifft_1024_top_Pipeline_VITIS_LOOP_85_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1031", "EstimateLatencyMax" : "1031",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "ga_M_value", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ga_M_value_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "gb_M_value", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "gb_M_value_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "output_r_V_data_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "output_r_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "output_r_V_keep_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "output_r_V_strb_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "output_r_V_last_V", "Type" : "Axis", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_85_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter6", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter6", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_ifft_1024_top_Pipeline_VITIS_LOOP_85_3_fu_204.fadd_32ns_32ns_32_5_full_dsp_1_U45", "Parent" : "45"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_ifft_1024_top_Pipeline_VITIS_LOOP_85_3_fu_204.fadd_32ns_32ns_32_5_full_dsp_1_U46", "Parent" : "45"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_ifft_1024_top_Pipeline_VITIS_LOOP_85_3_fu_204.flow_control_loop_pipe_sequential_init_U", "Parent" : "45"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_input_r_V_data_V_U", "Parent" : "0"},
	{"ID" : "50", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_input_r_V_keep_V_U", "Parent" : "0"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_input_r_V_strb_V_U", "Parent" : "0"},
	{"ID" : "52", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_input_r_V_last_V_U", "Parent" : "0"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_output_r_V_data_V_U", "Parent" : "0"},
	{"ID" : "54", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_output_r_V_keep_V_U", "Parent" : "0"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_output_r_V_strb_V_U", "Parent" : "0"},
	{"ID" : "56", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_output_r_V_last_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	ifft_1024_top {
		input_r_V_data_V {Type I LastRead 0 FirstWrite -1}
		input_r_V_keep_V {Type I LastRead 0 FirstWrite -1}
		input_r_V_strb_V {Type I LastRead 0 FirstWrite -1}
		input_r_V_last_V {Type I LastRead 0 FirstWrite -1}
		output_r_V_data_V {Type O LastRead -1 FirstWrite 6}
		output_r_V_keep_V {Type O LastRead -1 FirstWrite 6}
		output_r_V_strb_V {Type O LastRead -1 FirstWrite 6}
		output_r_V_last_V {Type O LastRead -1 FirstWrite 6}
		br_lut {Type I LastRead -1 FirstWrite -1}
		tw_M_value_1 {Type I LastRead -1 FirstWrite -1}
		tw_M_value {Type I LastRead -1 FirstWrite -1}}
	ifft_1024_top_Pipeline_1 {
		ga_M_value {Type O LastRead -1 FirstWrite 0}
		ga_M_value_1 {Type O LastRead -1 FirstWrite 0}}
	ifft_1024_top_Pipeline_2 {
		gb_M_value {Type O LastRead -1 FirstWrite 0}
		gb_M_value_1 {Type O LastRead -1 FirstWrite 0}}
	ifft_1024_top_Pipeline_VITIS_LOOP_48_1 {
		input_r_V_data_V {Type I LastRead 0 FirstWrite -1}
		input_r_V_keep_V {Type I LastRead 0 FirstWrite -1}
		input_r_V_strb_V {Type I LastRead 0 FirstWrite -1}
		input_r_V_last_V {Type I LastRead 0 FirstWrite -1}
		ga_M_value {Type O LastRead -1 FirstWrite 0}
		ga_M_value_1 {Type O LastRead -1 FirstWrite 0}}
	ifft_1024_top_Pipeline_VITIS_LOOP_53_2 {
		input_r_V_data_V {Type I LastRead 0 FirstWrite -1}
		input_r_V_keep_V {Type I LastRead 0 FirstWrite -1}
		input_r_V_strb_V {Type I LastRead 0 FirstWrite -1}
		input_r_V_last_V {Type I LastRead 0 FirstWrite -1}
		gb_M_value {Type O LastRead -1 FirstWrite 0}
		gb_M_value_1 {Type O LastRead -1 FirstWrite 0}}
	ifft_fast {
		x_0 {Type IO LastRead 2 FirstWrite 2}
		x_1 {Type IO LastRead 2 FirstWrite 2}
		br_lut {Type I LastRead -1 FirstWrite -1}
		tw_M_value_1 {Type I LastRead -1 FirstWrite -1}
		tw_M_value {Type I LastRead -1 FirstWrite -1}}
	ifft_fast_Pipeline_VITIS_LOOP_7_1 {
		x_0 {Type IO LastRead 2 FirstWrite 2}
		x_1 {Type IO LastRead 2 FirstWrite 2}
		br_lut {Type I LastRead -1 FirstWrite -1}}
	ifft_fast_Pipeline_VITIS_LOOP_33_5 {
		x_0 {Type IO LastRead 0 FirstWrite 6}
		x_1 {Type IO LastRead 0 FirstWrite 6}}
	ifft_fast_Pipeline_VITIS_LOOP_22_4 {
		m2 {Type I LastRead 0 FirstWrite -1}
		trunc_ln21_1 {Type I LastRead 0 FirstWrite -1}
		trunc_ln21_2 {Type I LastRead 0 FirstWrite -1}
		x_0 {Type IO LastRead 1 FirstWrite 16}
		x_1 {Type IO LastRead 1 FirstWrite 16}
		tw_M_value_1 {Type I LastRead -1 FirstWrite -1}
		tw_M_value {Type I LastRead -1 FirstWrite -1}}
	ifft_fast {
		x_0 {Type IO LastRead 2 FirstWrite 2}
		x_1 {Type IO LastRead 2 FirstWrite 2}
		br_lut {Type I LastRead -1 FirstWrite -1}
		tw_M_value_1 {Type I LastRead -1 FirstWrite -1}
		tw_M_value {Type I LastRead -1 FirstWrite -1}}
	ifft_fast_Pipeline_VITIS_LOOP_7_1 {
		x_0 {Type IO LastRead 2 FirstWrite 2}
		x_1 {Type IO LastRead 2 FirstWrite 2}
		br_lut {Type I LastRead -1 FirstWrite -1}}
	ifft_fast_Pipeline_VITIS_LOOP_33_5 {
		x_0 {Type IO LastRead 0 FirstWrite 6}
		x_1 {Type IO LastRead 0 FirstWrite 6}}
	ifft_fast_Pipeline_VITIS_LOOP_22_4 {
		m2 {Type I LastRead 0 FirstWrite -1}
		trunc_ln21_1 {Type I LastRead 0 FirstWrite -1}
		trunc_ln21_2 {Type I LastRead 0 FirstWrite -1}
		x_0 {Type IO LastRead 1 FirstWrite 16}
		x_1 {Type IO LastRead 1 FirstWrite 16}
		tw_M_value_1 {Type I LastRead -1 FirstWrite -1}
		tw_M_value {Type I LastRead -1 FirstWrite -1}}
	ifft_1024_top_Pipeline_VITIS_LOOP_85_3 {
		ga_M_value {Type I LastRead 0 FirstWrite -1}
		ga_M_value_1 {Type I LastRead 0 FirstWrite -1}
		gb_M_value {Type I LastRead 0 FirstWrite -1}
		gb_M_value_1 {Type I LastRead 0 FirstWrite -1}
		output_r_V_data_V {Type O LastRead -1 FirstWrite 6}
		output_r_V_keep_V {Type O LastRead -1 FirstWrite 6}
		output_r_V_strb_V {Type O LastRead -1 FirstWrite 6}
		output_r_V_last_V {Type O LastRead -1 FirstWrite 6}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	input_r_V_data_V { axis {  { input_r_TDATA in_data 0 64 } } }
	input_r_V_keep_V { axis {  { input_r_TKEEP in_data 0 8 } } }
	input_r_V_strb_V { axis {  { input_r_TSTRB in_data 0 8 } } }
	input_r_V_last_V { axis {  { input_r_TVALID in_vld 0 1 }  { input_r_TREADY in_acc 1 1 }  { input_r_TLAST in_data 0 1 } } }
	output_r_V_data_V { axis {  { output_r_TDATA out_data 1 64 } } }
	output_r_V_keep_V { axis {  { output_r_TKEEP out_data 1 8 } } }
	output_r_V_strb_V { axis {  { output_r_TSTRB out_data 1 8 } } }
	output_r_V_last_V { axis {  { output_r_TVALID out_vld 1 1 }  { output_r_TREADY out_acc 0 1 }  { output_r_TLAST out_data 1 1 } } }
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
