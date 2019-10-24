// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module minus_vector (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        src_data_stream_V_dout,
        src_data_stream_V_empty_n,
        src_data_stream_V_read,
        diff_sum,
        diff_sum_ap_vld
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_pp0_stage0 = 4'd4;
parameter    ap_ST_fsm_state5 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [7:0] src_data_stream_V_dout;
input   src_data_stream_V_empty_n;
output   src_data_stream_V_read;
output  [15:0] diff_sum;
output   diff_sum_ap_vld;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg src_data_stream_V_read;
reg[15:0] diff_sum;
reg diff_sum_ap_vld;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [9:0] mask_10_address0;
reg    mask_10_ce0;
wire   [0:0] mask_10_q0;
reg    src_data_stream_V_blk_n;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage0;
reg   [4:0] t_V_1_reg_126;
wire   [0:0] exitcond1_fu_142_p2;
wire    ap_CS_fsm_state2;
wire   [4:0] i_V_fu_148_p2;
reg   [4:0] i_V_reg_292;
wire   [0:0] tmp_6_fu_154_p2;
reg   [0:0] tmp_6_reg_297;
wire   [10:0] r_V_fu_184_p2;
reg   [10:0] r_V_reg_302;
wire   [0:0] exitcond_fu_190_p2;
reg   [0:0] exitcond_reg_307;
wire    ap_block_state3_pp0_stage0_iter0;
reg    ap_block_state4_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_11001;
wire   [4:0] j_V_fu_196_p2;
reg    ap_enable_reg_pp0_iter0;
wire   [0:0] tmp_s_fu_208_p2;
reg   [0:0] tmp_s_reg_316;
wire   [0:0] or_cond_fu_234_p2;
reg   [0:0] or_cond_reg_326;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state3;
reg   [4:0] t_V_reg_114;
reg    ap_block_state1;
wire    ap_CS_fsm_state5;
wire  signed [63:0] sum_cast_fu_223_p1;
reg   [15:0] diff_sum_t_fu_84;
wire   [15:0] diff_sum_t_2_fu_268_p3;
reg   [15:0] diff_sum_preg;
reg    ap_block_pp0_stage0_01001;
wire   [9:0] p_shl_fu_160_p3;
wire   [6:0] p_shl2_fu_172_p3;
wire   [10:0] p_shl_cast_fu_168_p1;
wire   [10:0] p_shl2_cast_fu_180_p1;
wire   [4:0] tmp_9_fu_202_p2;
wire   [10:0] tmp_3_cast_fu_214_p1;
wire   [10:0] sum_fu_218_p2;
wire   [0:0] tmp_10_fu_228_p2;
wire   [0:0] tmp_2_fu_242_p2;
wire   [0:0] tmp_fu_248_p2;
wire   [15:0] tmp_7_fu_254_p2;
wire   [15:0] diff_sum_t_3_fu_260_p3;
reg   [3:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 4'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 diff_sum_preg = 16'd0;
end

minus_vector_masklbW #(
    .DataWidth( 1 ),
    .AddressRange( 784 ),
    .AddressWidth( 10 ))
mask_10_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(mask_10_address0),
    .ce0(mask_10_ce0),
    .q0(mask_10_q0)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((exitcond1_fu_142_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_pp0_exit_iter0_state3))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if (((exitcond1_fu_142_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state3))) begin
            ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state3);
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if (((exitcond1_fu_142_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        diff_sum_preg <= 16'd0;
    end else begin
        if (((or_cond_reg_326 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_01001))) begin
            diff_sum_preg <= diff_sum_t_2_fu_268_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (exitcond_reg_307 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        diff_sum_t_fu_84 <= diff_sum_t_2_fu_268_p3;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        diff_sum_t_fu_84 <= 16'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (exitcond_fu_190_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        t_V_1_reg_126 <= j_V_fu_196_p2;
    end else if (((exitcond1_fu_142_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        t_V_1_reg_126 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        t_V_reg_114 <= i_V_reg_292;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        t_V_reg_114 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        exitcond_reg_307 <= exitcond_fu_190_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        i_V_reg_292 <= i_V_fu_148_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (exitcond_fu_190_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        or_cond_reg_326 <= or_cond_fu_234_p2;
        tmp_s_reg_316 <= tmp_s_fu_208_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond1_fu_142_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        r_V_reg_302[10 : 2] <= r_V_fu_184_p2[10 : 2];
        tmp_6_reg_297 <= tmp_6_fu_154_p2;
    end
end

always @ (*) begin
    if ((exitcond_fu_190_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state3 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state3 = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond1_fu_142_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond1_fu_142_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((or_cond_reg_326 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_01001))) begin
        diff_sum = diff_sum_t_2_fu_268_p3;
    end else begin
        diff_sum = diff_sum_preg;
    end
end

always @ (*) begin
    if (((or_cond_reg_326 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_01001))) begin
        diff_sum_ap_vld = 1'b1;
    end else begin
        diff_sum_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        mask_10_ce0 = 1'b1;
    end else begin
        mask_10_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        src_data_stream_V_blk_n = src_data_stream_V_empty_n;
    end else begin
        src_data_stream_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        src_data_stream_V_read = 1'b1;
    end else begin
        src_data_stream_V_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((exitcond1_fu_142_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if (~((1'b0 == ap_block_pp0_stage0_subdone) & (exitcond_fu_190_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (exitcond_fu_190_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd3];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((src_data_stream_V_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((src_data_stream_V_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((src_data_stream_V_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state3_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state4_pp0_stage0_iter1 = (src_data_stream_V_empty_n == 1'b0);
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign diff_sum_t_2_fu_268_p3 = ((tmp_s_reg_316[0:0] === 1'b1) ? 16'd0 : diff_sum_t_3_fu_260_p3);

assign diff_sum_t_3_fu_260_p3 = ((tmp_fu_248_p2[0:0] === 1'b1) ? tmp_7_fu_254_p2 : diff_sum_t_fu_84);

assign exitcond1_fu_142_p2 = ((t_V_reg_114 == 5'd28) ? 1'b1 : 1'b0);

assign exitcond_fu_190_p2 = ((t_V_1_reg_126 == 5'd28) ? 1'b1 : 1'b0);

assign i_V_fu_148_p2 = (t_V_reg_114 + 5'd1);

assign j_V_fu_196_p2 = (t_V_1_reg_126 + 5'd1);

assign mask_10_address0 = sum_cast_fu_223_p1;

assign or_cond_fu_234_p2 = (tmp_6_reg_297 & tmp_10_fu_228_p2);

assign p_shl2_cast_fu_180_p1 = p_shl2_fu_172_p3;

assign p_shl2_fu_172_p3 = {{t_V_reg_114}, {2'd0}};

assign p_shl_cast_fu_168_p1 = p_shl_fu_160_p3;

assign p_shl_fu_160_p3 = {{t_V_reg_114}, {5'd0}};

assign r_V_fu_184_p2 = (p_shl_cast_fu_168_p1 - p_shl2_cast_fu_180_p1);

assign sum_cast_fu_223_p1 = $signed(sum_fu_218_p2);

assign sum_fu_218_p2 = (r_V_reg_302 + tmp_3_cast_fu_214_p1);

assign tmp_10_fu_228_p2 = ((t_V_1_reg_126 == 5'd27) ? 1'b1 : 1'b0);

assign tmp_2_fu_242_p2 = ((src_data_stream_V_dout != 8'd0) ? 1'b1 : 1'b0);

assign tmp_3_cast_fu_214_p1 = t_V_1_reg_126;

assign tmp_6_fu_154_p2 = ((t_V_reg_114 == 5'd27) ? 1'b1 : 1'b0);

assign tmp_7_fu_254_p2 = (diff_sum_t_fu_84 + 16'd1);

assign tmp_9_fu_202_p2 = (t_V_reg_114 | t_V_1_reg_126);

assign tmp_fu_248_p2 = (tmp_2_fu_242_p2 ^ mask_10_q0);

assign tmp_s_fu_208_p2 = ((tmp_9_fu_202_p2 == 5'd0) ? 1'b1 : 1'b0);

always @ (posedge ap_clk) begin
    r_V_reg_302[1:0] <= 2'b00;
end

endmodule //minus_vector
