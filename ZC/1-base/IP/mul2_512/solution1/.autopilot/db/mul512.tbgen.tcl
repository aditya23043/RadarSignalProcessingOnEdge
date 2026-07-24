set moduleName mul512
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
set C_modelName {mul512}
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
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "7", "9", "11", "21", "23", "24", "25", "26", "27", "28", "29", "30"],
		"CDFG" : "mul512",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2074", "EstimateLatencyMax" : "2074",
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
					{"ID" : "9", "SubInstance" : "grp_mul512_Pipeline_VITIS_LOOP_15_1_fu_148", "Port" : "input_r_V_data_V", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "input_r_V_keep_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_mul512_Pipeline_VITIS_LOOP_15_1_fu_148", "Port" : "input_r_V_keep_V", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "input_r_V_strb_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_mul512_Pipeline_VITIS_LOOP_15_1_fu_148", "Port" : "input_r_V_strb_V", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "input_r_V_last_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_mul512_Pipeline_VITIS_LOOP_15_1_fu_148", "Port" : "input_r_V_last_V", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "output_r_V_data_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_mul512_Pipeline_VITIS_LOOP_25_3_fu_174", "Port" : "output_r_V_data_V", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "output_r_V_keep_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_mul512_Pipeline_VITIS_LOOP_25_3_fu_174", "Port" : "output_r_V_keep_V", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "output_r_V_strb_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_mul512_Pipeline_VITIS_LOOP_25_3_fu_174", "Port" : "output_r_V_strb_V", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "output_r_V_last_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_mul512_Pipeline_VITIS_LOOP_25_3_fu_174", "Port" : "output_r_V_last_V", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "zc_conj_M_value_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_mul512_Pipeline_VITIS_LOOP_20_2_fu_162", "Port" : "zc_conj_M_value_1", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "zc_conj_M_value", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_mul512_Pipeline_VITIS_LOOP_20_2_fu_162", "Port" : "zc_conj_M_value", "Inst_start_state" : "6", "Inst_end_state" : "7"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.zc_M_value_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.zc_M_value_1_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.output_zc_M_value_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.output_zc_M_value_1_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_mul512_Pipeline_1_fu_136", "Parent" : "0", "Child" : ["6"],
		"CDFG" : "mul512_Pipeline_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "513", "EstimateLatencyMax" : "513",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zc_M_value", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "zc_M_value_1", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "NotSupport"}]},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mul512_Pipeline_1_fu_136.flow_control_loop_pipe_sequential_init_U", "Parent" : "5"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_mul512_Pipeline_2_fu_142", "Parent" : "0", "Child" : ["8"],
		"CDFG" : "mul512_Pipeline_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "513", "EstimateLatencyMax" : "513",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "output_zc_M_value", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "output_zc_M_value_1", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "NotSupport"}]},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mul512_Pipeline_2_fu_142.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_mul512_Pipeline_VITIS_LOOP_15_1_fu_148", "Parent" : "0", "Child" : ["10"],
		"CDFG" : "mul512_Pipeline_VITIS_LOOP_15_1",
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
			{"Name" : "VITIS_LOOP_15_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mul512_Pipeline_VITIS_LOOP_15_1_fu_148.flow_control_loop_pipe_sequential_init_U", "Parent" : "9"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_mul512_Pipeline_VITIS_LOOP_20_2_fu_162", "Parent" : "0", "Child" : ["12", "13", "14", "15", "16", "17", "18", "19", "20"],
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
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mul512_Pipeline_VITIS_LOOP_20_2_fu_162.zc_conj_M_value_1_U", "Parent" : "11"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mul512_Pipeline_VITIS_LOOP_20_2_fu_162.zc_conj_M_value_U", "Parent" : "11"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mul512_Pipeline_VITIS_LOOP_20_2_fu_162.fsub_32ns_32ns_32_5_full_dsp_1_U11", "Parent" : "11"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mul512_Pipeline_VITIS_LOOP_20_2_fu_162.fadd_32ns_32ns_32_5_full_dsp_1_U12", "Parent" : "11"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mul512_Pipeline_VITIS_LOOP_20_2_fu_162.fmul_32ns_32ns_32_4_max_dsp_1_U13", "Parent" : "11"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mul512_Pipeline_VITIS_LOOP_20_2_fu_162.fmul_32ns_32ns_32_4_max_dsp_1_U14", "Parent" : "11"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mul512_Pipeline_VITIS_LOOP_20_2_fu_162.fmul_32ns_32ns_32_4_max_dsp_1_U15", "Parent" : "11"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mul512_Pipeline_VITIS_LOOP_20_2_fu_162.fmul_32ns_32ns_32_4_max_dsp_1_U16", "Parent" : "11"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mul512_Pipeline_VITIS_LOOP_20_2_fu_162.flow_control_loop_pipe_sequential_init_U", "Parent" : "11"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_mul512_Pipeline_VITIS_LOOP_25_3_fu_174", "Parent" : "0", "Child" : ["22"],
		"CDFG" : "mul512_Pipeline_VITIS_LOOP_25_3",
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
			{"Name" : "output_zc_M_value", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "output_zc_M_value_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "output_r_V_data_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "output_r_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "output_r_V_keep_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "output_r_V_strb_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "output_r_V_last_V", "Type" : "Axis", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_25_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mul512_Pipeline_VITIS_LOOP_25_3_fu_174.flow_control_loop_pipe_sequential_init_U", "Parent" : "21"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_input_r_V_data_V_U", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_input_r_V_keep_V_U", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_input_r_V_strb_V_U", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_input_r_V_last_V_U", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_output_r_V_data_V_U", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_output_r_V_keep_V_U", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_output_r_V_strb_V_U", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_output_r_V_last_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	mul512 {
		input_r_V_data_V {Type I LastRead 0 FirstWrite -1}
		input_r_V_keep_V {Type I LastRead 0 FirstWrite -1}
		input_r_V_strb_V {Type I LastRead 0 FirstWrite -1}
		input_r_V_last_V {Type I LastRead 0 FirstWrite -1}
		output_r_V_data_V {Type O LastRead -1 FirstWrite 1}
		output_r_V_keep_V {Type O LastRead -1 FirstWrite 1}
		output_r_V_strb_V {Type O LastRead -1 FirstWrite 1}
		output_r_V_last_V {Type O LastRead -1 FirstWrite 1}
		zc_conj_M_value_1 {Type I LastRead -1 FirstWrite -1}
		zc_conj_M_value {Type I LastRead -1 FirstWrite -1}}
	mul512_Pipeline_1 {
		zc_M_value {Type O LastRead -1 FirstWrite 0}
		zc_M_value_1 {Type O LastRead -1 FirstWrite 0}}
	mul512_Pipeline_2 {
		output_zc_M_value {Type O LastRead -1 FirstWrite 0}
		output_zc_M_value_1 {Type O LastRead -1 FirstWrite 0}}
	mul512_Pipeline_VITIS_LOOP_15_1 {
		input_r_V_data_V {Type I LastRead 0 FirstWrite -1}
		input_r_V_keep_V {Type I LastRead 0 FirstWrite -1}
		input_r_V_strb_V {Type I LastRead 0 FirstWrite -1}
		input_r_V_last_V {Type I LastRead 0 FirstWrite -1}
		zc_M_value {Type O LastRead -1 FirstWrite 0}
		zc_M_value_1 {Type O LastRead -1 FirstWrite 0}}
	mul512_Pipeline_VITIS_LOOP_20_2 {
		zc_M_value {Type I LastRead 0 FirstWrite -1}
		zc_M_value_1 {Type I LastRead 0 FirstWrite -1}
		output_zc_M_value {Type O LastRead -1 FirstWrite 11}
		output_zc_M_value_1 {Type O LastRead -1 FirstWrite 11}
		zc_conj_M_value_1 {Type I LastRead -1 FirstWrite -1}
		zc_conj_M_value {Type I LastRead -1 FirstWrite -1}}
	mul512_Pipeline_VITIS_LOOP_25_3 {
		output_zc_M_value {Type I LastRead 0 FirstWrite -1}
		output_zc_M_value_1 {Type I LastRead 0 FirstWrite -1}
		output_r_V_data_V {Type O LastRead -1 FirstWrite 1}
		output_r_V_keep_V {Type O LastRead -1 FirstWrite 1}
		output_r_V_strb_V {Type O LastRead -1 FirstWrite 1}
		output_r_V_last_V {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2074", "Max" : "2074"}
	, {"Name" : "Interval", "Min" : "2075", "Max" : "2075"}
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
