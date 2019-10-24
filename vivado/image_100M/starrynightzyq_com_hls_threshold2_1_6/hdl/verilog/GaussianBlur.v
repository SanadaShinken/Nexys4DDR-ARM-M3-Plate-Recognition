// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module GaussianBlur (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        p_src_rows_V_dout,
        p_src_rows_V_empty_n,
        p_src_rows_V_read,
        p_src_cols_V_dout,
        p_src_cols_V_empty_n,
        p_src_cols_V_read,
        p_src_data_stream_0_V_dout,
        p_src_data_stream_0_V_empty_n,
        p_src_data_stream_0_V_read,
        p_src_data_stream_1_V_dout,
        p_src_data_stream_1_V_empty_n,
        p_src_data_stream_1_V_read,
        p_src_data_stream_2_V_dout,
        p_src_data_stream_2_V_empty_n,
        p_src_data_stream_2_V_read,
        p_dst_data_stream_0_V_din,
        p_dst_data_stream_0_V_full_n,
        p_dst_data_stream_0_V_write,
        p_dst_data_stream_1_V_din,
        p_dst_data_stream_1_V_full_n,
        p_dst_data_stream_1_V_write,
        p_dst_data_stream_2_V_din,
        p_dst_data_stream_2_V_full_n,
        p_dst_data_stream_2_V_write
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [15:0] p_src_rows_V_dout;
input   p_src_rows_V_empty_n;
output   p_src_rows_V_read;
input  [15:0] p_src_cols_V_dout;
input   p_src_cols_V_empty_n;
output   p_src_cols_V_read;
input  [7:0] p_src_data_stream_0_V_dout;
input   p_src_data_stream_0_V_empty_n;
output   p_src_data_stream_0_V_read;
input  [7:0] p_src_data_stream_1_V_dout;
input   p_src_data_stream_1_V_empty_n;
output   p_src_data_stream_1_V_read;
input  [7:0] p_src_data_stream_2_V_dout;
input   p_src_data_stream_2_V_empty_n;
output   p_src_data_stream_2_V_read;
output  [7:0] p_dst_data_stream_0_V_din;
input   p_dst_data_stream_0_V_full_n;
output   p_dst_data_stream_0_V_write;
output  [7:0] p_dst_data_stream_1_V_din;
input   p_dst_data_stream_1_V_full_n;
output   p_dst_data_stream_1_V_write;
output  [7:0] p_dst_data_stream_2_V_din;
input   p_dst_data_stream_2_V_full_n;
output   p_dst_data_stream_2_V_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg p_src_rows_V_read;
reg p_src_cols_V_read;
reg p_src_data_stream_0_V_read;
reg p_src_data_stream_1_V_read;
reg p_src_data_stream_2_V_read;
reg p_dst_data_stream_0_V_write;
reg p_dst_data_stream_1_V_write;
reg p_dst_data_stream_2_V_write;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    p_src_rows_V_blk_n;
reg    p_src_cols_V_blk_n;
reg   [15:0] p_src_rows_V_read_reg_158;
reg    ap_block_state1;
reg   [15:0] p_src_cols_V_read_reg_163;
wire    grp_Filter2D_fu_138_ap_start;
wire    grp_Filter2D_fu_138_ap_done;
wire    grp_Filter2D_fu_138_ap_idle;
wire    grp_Filter2D_fu_138_ap_ready;
wire    grp_Filter2D_fu_138_p_src_data_stream_0_V_read;
wire    grp_Filter2D_fu_138_p_src_data_stream_1_V_read;
wire    grp_Filter2D_fu_138_p_src_data_stream_2_V_read;
wire   [7:0] grp_Filter2D_fu_138_p_dst_data_stream_0_V_din;
wire    grp_Filter2D_fu_138_p_dst_data_stream_0_V_write;
wire   [7:0] grp_Filter2D_fu_138_p_dst_data_stream_1_V_din;
wire    grp_Filter2D_fu_138_p_dst_data_stream_1_V_write;
wire   [7:0] grp_Filter2D_fu_138_p_dst_data_stream_2_V_din;
wire    grp_Filter2D_fu_138_p_dst_data_stream_2_V_write;
reg    grp_Filter2D_fu_138_ap_start_reg;
reg    ap_block_state1_ignore_call10;
wire    ap_CS_fsm_state2;
reg   [1:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 2'd1;
#0 grp_Filter2D_fu_138_ap_start_reg = 1'b0;
end

Filter2D grp_Filter2D_fu_138(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_Filter2D_fu_138_ap_start),
    .ap_done(grp_Filter2D_fu_138_ap_done),
    .ap_idle(grp_Filter2D_fu_138_ap_idle),
    .ap_ready(grp_Filter2D_fu_138_ap_ready),
    .p_src_rows_V_read(p_src_rows_V_read_reg_158),
    .p_src_cols_V_read(p_src_cols_V_read_reg_163),
    .p_src_data_stream_0_V_dout(p_src_data_stream_0_V_dout),
    .p_src_data_stream_0_V_empty_n(p_src_data_stream_0_V_empty_n),
    .p_src_data_stream_0_V_read(grp_Filter2D_fu_138_p_src_data_stream_0_V_read),
    .p_src_data_stream_1_V_dout(p_src_data_stream_1_V_dout),
    .p_src_data_stream_1_V_empty_n(p_src_data_stream_1_V_empty_n),
    .p_src_data_stream_1_V_read(grp_Filter2D_fu_138_p_src_data_stream_1_V_read),
    .p_src_data_stream_2_V_dout(p_src_data_stream_2_V_dout),
    .p_src_data_stream_2_V_empty_n(p_src_data_stream_2_V_empty_n),
    .p_src_data_stream_2_V_read(grp_Filter2D_fu_138_p_src_data_stream_2_V_read),
    .p_dst_data_stream_0_V_din(grp_Filter2D_fu_138_p_dst_data_stream_0_V_din),
    .p_dst_data_stream_0_V_full_n(p_dst_data_stream_0_V_full_n),
    .p_dst_data_stream_0_V_write(grp_Filter2D_fu_138_p_dst_data_stream_0_V_write),
    .p_dst_data_stream_1_V_din(grp_Filter2D_fu_138_p_dst_data_stream_1_V_din),
    .p_dst_data_stream_1_V_full_n(p_dst_data_stream_1_V_full_n),
    .p_dst_data_stream_1_V_write(grp_Filter2D_fu_138_p_dst_data_stream_1_V_write),
    .p_dst_data_stream_2_V_din(grp_Filter2D_fu_138_p_dst_data_stream_2_V_din),
    .p_dst_data_stream_2_V_full_n(p_dst_data_stream_2_V_full_n),
    .p_dst_data_stream_2_V_write(grp_Filter2D_fu_138_p_dst_data_stream_2_V_write)
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
        end else if (((grp_Filter2D_fu_138_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_Filter2D_fu_138_ap_start_reg <= 1'b0;
    end else begin
        if ((~((ap_start == 1'b0) | (p_src_cols_V_empty_n == 1'b0) | (p_src_rows_V_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            grp_Filter2D_fu_138_ap_start_reg <= 1'b1;
        end else if ((grp_Filter2D_fu_138_ap_ready == 1'b1)) begin
            grp_Filter2D_fu_138_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start == 1'b0) | (p_src_cols_V_empty_n == 1'b0) | (p_src_rows_V_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        p_src_cols_V_read_reg_163 <= p_src_cols_V_dout;
        p_src_rows_V_read_reg_158 <= p_src_rows_V_dout;
    end
end

always @ (*) begin
    if (((grp_Filter2D_fu_138_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
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
    if (((grp_Filter2D_fu_138_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        p_dst_data_stream_0_V_write = grp_Filter2D_fu_138_p_dst_data_stream_0_V_write;
    end else begin
        p_dst_data_stream_0_V_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        p_dst_data_stream_1_V_write = grp_Filter2D_fu_138_p_dst_data_stream_1_V_write;
    end else begin
        p_dst_data_stream_1_V_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        p_dst_data_stream_2_V_write = grp_Filter2D_fu_138_p_dst_data_stream_2_V_write;
    end else begin
        p_dst_data_stream_2_V_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        p_src_cols_V_blk_n = p_src_cols_V_empty_n;
    end else begin
        p_src_cols_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (p_src_cols_V_empty_n == 1'b0) | (p_src_rows_V_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        p_src_cols_V_read = 1'b1;
    end else begin
        p_src_cols_V_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        p_src_data_stream_0_V_read = grp_Filter2D_fu_138_p_src_data_stream_0_V_read;
    end else begin
        p_src_data_stream_0_V_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        p_src_data_stream_1_V_read = grp_Filter2D_fu_138_p_src_data_stream_1_V_read;
    end else begin
        p_src_data_stream_1_V_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        p_src_data_stream_2_V_read = grp_Filter2D_fu_138_p_src_data_stream_2_V_read;
    end else begin
        p_src_data_stream_2_V_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        p_src_rows_V_blk_n = p_src_rows_V_empty_n;
    end else begin
        p_src_rows_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (p_src_cols_V_empty_n == 1'b0) | (p_src_rows_V_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        p_src_rows_V_read = 1'b1;
    end else begin
        p_src_rows_V_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (p_src_cols_V_empty_n == 1'b0) | (p_src_rows_V_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((grp_Filter2D_fu_138_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (p_src_cols_V_empty_n == 1'b0) | (p_src_rows_V_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

always @ (*) begin
    ap_block_state1_ignore_call10 = ((ap_start == 1'b0) | (p_src_cols_V_empty_n == 1'b0) | (p_src_rows_V_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign grp_Filter2D_fu_138_ap_start = grp_Filter2D_fu_138_ap_start_reg;

assign p_dst_data_stream_0_V_din = grp_Filter2D_fu_138_p_dst_data_stream_0_V_din;

assign p_dst_data_stream_1_V_din = grp_Filter2D_fu_138_p_dst_data_stream_1_V_din;

assign p_dst_data_stream_2_V_din = grp_Filter2D_fu_138_p_dst_data_stream_2_V_din;

endmodule //GaussianBlur
