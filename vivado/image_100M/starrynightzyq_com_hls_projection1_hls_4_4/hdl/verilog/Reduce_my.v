// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module Reduce_my (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        src_rows_V_dout,
        src_rows_V_empty_n,
        src_rows_V_read,
        src_cols_V_dout,
        src_cols_V_empty_n,
        src_cols_V_read,
        src_data_stream_V_dout,
        src_data_stream_V_empty_n,
        src_data_stream_V_read,
        Vdst_data_stream_V_din,
        Vdst_data_stream_V_full_n,
        Vdst_data_stream_V_write
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_pp0_stage0 = 4'd4;
parameter    ap_ST_fsm_state6 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [31:0] src_rows_V_dout;
input   src_rows_V_empty_n;
output   src_rows_V_read;
input  [31:0] src_cols_V_dout;
input   src_cols_V_empty_n;
output   src_cols_V_read;
input  [7:0] src_data_stream_V_dout;
input   src_data_stream_V_empty_n;
output   src_data_stream_V_read;
output  [15:0] Vdst_data_stream_V_din;
input   Vdst_data_stream_V_full_n;
output   Vdst_data_stream_V_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg src_rows_V_read;
reg src_cols_V_read;
reg src_data_stream_V_read;
reg Vdst_data_stream_V_write;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    src_rows_V_blk_n;
reg    src_cols_V_blk_n;
reg    src_data_stream_V_blk_n;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage0;
reg    Vdst_data_stream_V_blk_n;
reg    ap_enable_reg_pp0_iter2;
reg   [0:0] tmp_41_i_reg_269;
reg   [31:0] t_V_3_reg_160;
reg   [31:0] rows_V_reg_240;
reg    ap_block_state1;
reg   [31:0] cols_V_reg_245;
wire   [32:0] r_V_fu_175_p2;
reg   [32:0] r_V_reg_250;
wire   [0:0] exitcond3_i_fu_181_p2;
wire    ap_CS_fsm_state2;
wire   [31:0] i_V_fu_186_p2;
reg   [31:0] i_V_reg_259;
wire   [0:0] tmp_i_57_fu_192_p2;
reg   [0:0] tmp_i_57_reg_264;
wire   [0:0] tmp_41_i_fu_202_p2;
wire   [0:0] exitcond_i_fu_207_p2;
wire    ap_block_state3_pp0_stage0_iter0;
reg    ap_block_state4_pp0_stage0_iter1;
reg    ap_block_state5_pp0_stage0_iter2;
reg    ap_block_pp0_stage0_11001;
wire   [31:0] j_V_fu_212_p2;
reg    ap_enable_reg_pp0_iter0;
reg   [9:0] dst_buffer_addr_reg_282;
reg   [9:0] dst_buffer_addr_reg_282_pp0_iter1_reg;
wire   [15:0] tmp_9_fu_234_p2;
reg   [15:0] tmp_9_reg_288;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state3;
wire   [9:0] dst_buffer_address0;
reg    dst_buffer_ce0;
wire   [15:0] dst_buffer_q0;
reg    dst_buffer_ce1;
reg    dst_buffer_we1;
reg   [31:0] t_V_reg_149;
wire    ap_CS_fsm_state6;
wire   [63:0] tmp_42_i_fu_218_p1;
reg    ap_block_pp0_stage0_01001;
wire   [32:0] lhs_V_cast_i_fu_171_p1;
wire   [32:0] tmp_40_cast_i_fu_198_p1;
wire   [15:0] storemerge_i_fu_223_p3;
wire   [15:0] tmp_43_i_fu_230_p1;
reg   [3:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 4'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
end

Reduce_my_dst_bufbkb #(
    .DataWidth( 16 ),
    .AddressRange( 640 ),
    .AddressWidth( 10 ))
dst_buffer_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(dst_buffer_address0),
    .ce0(dst_buffer_ce0),
    .q0(dst_buffer_q0),
    .address1(dst_buffer_addr_reg_282_pp0_iter1_reg),
    .ce1(dst_buffer_ce1),
    .we1(dst_buffer_we1),
    .d1(tmp_9_reg_288)
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
        end else if (((exitcond3_i_fu_181_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_pp0_exit_iter0_state3) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if (((exitcond3_i_fu_181_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            if ((1'b1 == ap_condition_pp0_exit_iter0_state3)) begin
                ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state3);
            end else if ((1'b1 == 1'b1)) begin
                ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end else if (((exitcond3_i_fu_181_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_i_fu_207_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        t_V_3_reg_160 <= j_V_fu_212_p2;
    end else if (((exitcond3_i_fu_181_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        t_V_3_reg_160 <= 32'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        t_V_reg_149 <= i_V_reg_259;
    end else if ((~((ap_start == 1'b0) | (src_cols_V_empty_n == 1'b0) | (src_rows_V_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        t_V_reg_149 <= 32'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start == 1'b0) | (src_cols_V_empty_n == 1'b0) | (src_rows_V_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        cols_V_reg_245 <= src_cols_V_dout;
        r_V_reg_250 <= r_V_fu_175_p2;
        rows_V_reg_240 <= src_rows_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_i_fu_207_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        dst_buffer_addr_reg_282 <= tmp_42_i_fu_218_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        dst_buffer_addr_reg_282_pp0_iter1_reg <= dst_buffer_addr_reg_282;
        tmp_9_reg_288 <= tmp_9_fu_234_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        i_V_reg_259 <= i_V_fu_186_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond3_i_fu_181_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        tmp_41_i_reg_269 <= tmp_41_i_fu_202_p2;
        tmp_i_57_reg_264 <= tmp_i_57_fu_192_p2;
    end
end

always @ (*) begin
    if (((tmp_41_i_reg_269 == 1'd1) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        Vdst_data_stream_V_blk_n = Vdst_data_stream_V_full_n;
    end else begin
        Vdst_data_stream_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_41_i_reg_269 == 1'd1) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        Vdst_data_stream_V_write = 1'b1;
    end else begin
        Vdst_data_stream_V_write = 1'b0;
    end
end

always @ (*) begin
    if ((exitcond_i_fu_207_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state3 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state3 = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond3_i_fu_181_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
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
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond3_i_fu_181_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        dst_buffer_ce0 = 1'b1;
    end else begin
        dst_buffer_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        dst_buffer_ce1 = 1'b1;
    end else begin
        dst_buffer_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_41_i_reg_269 == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        dst_buffer_we1 = 1'b1;
    end else begin
        dst_buffer_we1 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        src_cols_V_blk_n = src_cols_V_empty_n;
    end else begin
        src_cols_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (src_cols_V_empty_n == 1'b0) | (src_rows_V_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        src_cols_V_read = 1'b1;
    end else begin
        src_cols_V_read = 1'b0;
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
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        src_data_stream_V_read = 1'b1;
    end else begin
        src_data_stream_V_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        src_rows_V_blk_n = src_rows_V_empty_n;
    end else begin
        src_rows_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (src_cols_V_empty_n == 1'b0) | (src_rows_V_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        src_rows_V_read = 1'b1;
    end else begin
        src_rows_V_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (src_cols_V_empty_n == 1'b0) | (src_rows_V_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((exitcond3_i_fu_181_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((exitcond_i_fu_207_p2 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone)) & ~((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone)) | ((exitcond_i_fu_207_p2 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone)))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign Vdst_data_stream_V_din = tmp_9_reg_288;

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd3];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = (((tmp_41_i_reg_269 == 1'd1) & (1'b0 == Vdst_data_stream_V_full_n) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((src_data_stream_V_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((tmp_41_i_reg_269 == 1'd1) & (1'b0 == Vdst_data_stream_V_full_n) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((src_data_stream_V_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((tmp_41_i_reg_269 == 1'd1) & (1'b0 == Vdst_data_stream_V_full_n) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((src_data_stream_V_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (src_cols_V_empty_n == 1'b0) | (src_rows_V_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state3_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state4_pp0_stage0_iter1 = (src_data_stream_V_empty_n == 1'b0);
end

always @ (*) begin
    ap_block_state5_pp0_stage0_iter2 = ((tmp_41_i_reg_269 == 1'd1) & (1'b0 == Vdst_data_stream_V_full_n));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign dst_buffer_address0 = tmp_42_i_fu_218_p1;

assign exitcond3_i_fu_181_p2 = ((t_V_reg_149 == rows_V_reg_240) ? 1'b1 : 1'b0);

assign exitcond_i_fu_207_p2 = ((t_V_3_reg_160 == cols_V_reg_245) ? 1'b1 : 1'b0);

assign i_V_fu_186_p2 = (t_V_reg_149 + 32'd1);

assign j_V_fu_212_p2 = (t_V_3_reg_160 + 32'd1);

assign lhs_V_cast_i_fu_171_p1 = src_rows_V_dout;

assign r_V_fu_175_p2 = ($signed(lhs_V_cast_i_fu_171_p1) + $signed(33'd8589934591));

assign storemerge_i_fu_223_p3 = ((tmp_i_57_reg_264[0:0] === 1'b1) ? 16'd0 : dst_buffer_q0);

assign tmp_40_cast_i_fu_198_p1 = t_V_reg_149;

assign tmp_41_i_fu_202_p2 = ((tmp_40_cast_i_fu_198_p1 == r_V_reg_250) ? 1'b1 : 1'b0);

assign tmp_42_i_fu_218_p1 = t_V_3_reg_160;

assign tmp_43_i_fu_230_p1 = src_data_stream_V_dout;

assign tmp_9_fu_234_p2 = (storemerge_i_fu_223_p3 + tmp_43_i_fu_230_p1);

assign tmp_i_57_fu_192_p2 = ((t_V_reg_149 == 32'd0) ? 1'b1 : 1'b0);

endmodule //Reduce_my
