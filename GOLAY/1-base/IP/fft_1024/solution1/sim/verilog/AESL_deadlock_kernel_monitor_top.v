`timescale 1 ns / 1 ps

module AESL_deadlock_kernel_monitor_top ( 
    input wire kernel_monitor_clock,
    input wire kernel_monitor_reset
);
wire [3:0] axis_block_sigs;
wire [4:0] inst_idle_sigs;
wire [0:0] inst_block_sigs;
wire kernel_block;

assign axis_block_sigs[0] = ~AESL_inst_fft_1024_top.grp_fft_1024_top_Pipeline_VITIS_LOOP_45_1_fu_154.input_r_TDATA_blk_n;
assign axis_block_sigs[1] = ~AESL_inst_fft_1024_top.grp_fft_1024_top_Pipeline_VITIS_LOOP_50_2_fu_168.input_r_TDATA_blk_n;
assign axis_block_sigs[2] = ~AESL_inst_fft_1024_top.grp_fft_1024_top_Pipeline_VITIS_LOOP_59_3_fu_206.output_r_TDATA_blk_n;
assign axis_block_sigs[3] = ~AESL_inst_fft_1024_top.grp_fft_1024_top_Pipeline_VITIS_LOOP_65_4_fu_220.output_r_TDATA_blk_n;

assign inst_block_sigs[0] = 1'b0;

assign inst_idle_sigs[0] = 1'b0;
assign inst_idle_sigs[1] = AESL_inst_fft_1024_top.grp_fft_1024_top_Pipeline_VITIS_LOOP_45_1_fu_154.ap_idle;
assign inst_idle_sigs[2] = AESL_inst_fft_1024_top.grp_fft_1024_top_Pipeline_VITIS_LOOP_50_2_fu_168.ap_idle;
assign inst_idle_sigs[3] = AESL_inst_fft_1024_top.grp_fft_1024_top_Pipeline_VITIS_LOOP_59_3_fu_206.ap_idle;
assign inst_idle_sigs[4] = AESL_inst_fft_1024_top.grp_fft_1024_top_Pipeline_VITIS_LOOP_65_4_fu_220.ap_idle;

AESL_deadlock_idx0_monitor AESL_deadlock_idx0_monitor_U (
    .clock(kernel_monitor_clock),
    .reset(kernel_monitor_reset),
    .axis_block_sigs(axis_block_sigs),
    .inst_idle_sigs(inst_idle_sigs),
    .inst_block_sigs(inst_block_sigs),
    .block(kernel_block)
);

initial begin
reg block_delay = 0;
    while(1) begin
        @(posedge kernel_monitor_clock);
    if (kernel_block == 1'b1 && block_delay == 1'b0)
    $display("find kernel block.");
    block_delay = kernel_block;
    end
end

endmodule
