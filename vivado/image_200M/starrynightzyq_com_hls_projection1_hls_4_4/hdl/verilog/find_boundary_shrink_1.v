// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module find_boundary_shrink_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        src_cols_V_dout,
        src_cols_V_empty_n,
        src_cols_V_read,
        src_data_stream_V_dout,
        src_data_stream_V_empty_n,
        src_data_stream_V_read,
        threshold_width_dout,
        threshold_width_empty_n,
        threshold_width_read,
        shrink_x_min_dout,
        shrink_x_min_empty_n,
        shrink_x_min_read,
        shrink_x_max_dout,
        shrink_x_max_empty_n,
        shrink_x_max_read,
        bound_min,
        bound_min_ap_vld,
        bound_max,
        bound_max_ap_vld
);

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_state2 = 5'd2;
parameter    ap_ST_fsm_state3 = 5'd4;
parameter    ap_ST_fsm_pp0_stage0 = 5'd8;
parameter    ap_ST_fsm_state11 = 5'd16;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [31:0] src_cols_V_dout;
input   src_cols_V_empty_n;
output   src_cols_V_read;
input  [15:0] src_data_stream_V_dout;
input   src_data_stream_V_empty_n;
output   src_data_stream_V_read;
input  [31:0] threshold_width_dout;
input   threshold_width_empty_n;
output   threshold_width_read;
input  [7:0] shrink_x_min_dout;
input   shrink_x_min_empty_n;
output   shrink_x_min_read;
input  [7:0] shrink_x_max_dout;
input   shrink_x_max_empty_n;
output   shrink_x_max_read;
output  [15:0] bound_min;
output   bound_min_ap_vld;
output  [15:0] bound_max;
output   bound_max_ap_vld;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg src_cols_V_read;
reg src_data_stream_V_read;
reg threshold_width_read;
reg shrink_x_min_read;
reg shrink_x_max_read;
reg bound_min_ap_vld;
reg bound_max_ap_vld;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    src_cols_V_blk_n;
reg    src_data_stream_V_blk_n;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage0;
reg   [0:0] exitcond_reg_589;
reg    threshold_width_blk_n;
reg    shrink_x_min_blk_n;
reg    shrink_x_max_blk_n;
reg   [0:0] inBlock_i_i_reg_182;
reg   [15:0] bound_min_r_1_i_i_reg_194;
reg   [15:0] bound_max_r_1_i_i_reg_206;
reg   [7:0] character_num_i_i_reg_218;
reg   [30:0] i_i_i_reg_230;
reg   [7:0] shrink_x_min_read_reg_520;
reg    ap_block_state1;
reg   [7:0] shrink_x_max_read_reg_526;
wire   [15:0] p_threshold_fu_241_p1;
reg   [15:0] p_threshold_reg_532;
reg   [31:0] cols_reg_538;
wire   [30:0] tmp_7_fu_245_p1;
reg   [30:0] tmp_7_reg_543;
wire   [0:0] tmp_i_i_fu_249_p2;
reg   [0:0] tmp_i_i_reg_548;
wire    ap_CS_fsm_state2;
wire   [30:0] length_fu_254_p3;
reg   [30:0] length_reg_553;
wire    ap_CS_fsm_state3;
wire   [30:0] tmp_13_i_i_fu_260_p2;
reg   [30:0] tmp_13_i_i_reg_559;
wire   [16:0] tmp_14_cast_i_i_fu_266_p1;
reg   [16:0] tmp_14_cast_i_i_reg_564;
wire   [16:0] tmp_15_cast_i_i_fu_269_p1;
reg   [16:0] tmp_15_cast_i_i_reg_569;
wire   [15:0] tmp_16_i_i_fu_272_p1;
reg   [15:0] tmp_16_i_i_reg_574;
wire   [15:0] tmp_17_i_i_fu_275_p1;
reg   [15:0] tmp_17_i_i_reg_579;
wire   [15:0] tmp_fu_278_p1;
reg   [15:0] tmp_reg_584;
wire   [0:0] exitcond_fu_282_p2;
wire    ap_block_state4_pp0_stage0_iter0;
reg    ap_block_state5_pp0_stage0_iter1;
wire    ap_block_state6_pp0_stage0_iter2;
wire    ap_block_state7_pp0_stage0_iter3;
wire    ap_block_state8_pp0_stage0_iter4;
wire    ap_block_state9_pp0_stage0_iter5;
wire    ap_block_state10_pp0_stage0_iter6;
reg    ap_block_pp0_stage0_11001;
reg   [0:0] exitcond_reg_589_pp0_iter1_reg;
reg   [0:0] exitcond_reg_589_pp0_iter2_reg;
reg   [0:0] exitcond_reg_589_pp0_iter3_reg;
reg   [0:0] exitcond_reg_589_pp0_iter4_reg;
wire   [30:0] i_fu_287_p2;
reg    ap_enable_reg_pp0_iter0;
wire   [0:0] tmp_19_i_i_fu_293_p2;
reg   [0:0] tmp_19_i_i_reg_598;
reg   [0:0] tmp_19_i_i_reg_598_pp0_iter1_reg;
reg   [0:0] tmp_19_i_i_reg_598_pp0_iter2_reg;
reg   [0:0] tmp_19_i_i_reg_598_pp0_iter3_reg;
wire   [15:0] bound_min_r_1_fu_299_p1;
reg   [15:0] bound_min_r_1_reg_607;
reg   [15:0] bound_min_r_1_reg_607_pp0_iter1_reg;
reg   [15:0] bound_min_r_1_reg_607_pp0_iter2_reg;
reg   [15:0] bound_min_r_1_reg_607_pp0_iter3_reg;
wire   [0:0] tmp_23_i_i_fu_303_p2;
reg   [0:0] tmp_23_i_i_reg_613;
reg   [0:0] tmp_23_i_i_reg_613_pp0_iter1_reg;
reg   [0:0] tmp_23_i_i_reg_613_pp0_iter2_reg;
reg   [0:0] tmp_23_i_i_reg_613_pp0_iter3_reg;
reg   [0:0] tmp_23_i_i_reg_613_pp0_iter4_reg;
reg   [0:0] tmp_23_i_i_reg_613_pp0_iter5_reg;
reg   [15:0] tmp_8_reg_617;
wire   [0:0] tmp_20_i_i_fu_308_p2;
reg   [0:0] tmp_20_i_i_reg_623;
wire   [0:0] ult_fu_312_p2;
reg   [0:0] ult_reg_628;
wire   [0:0] or_cond_i_i_fu_341_p2;
reg   [0:0] or_cond_i_i_reg_633;
wire   [0:0] tmp_21_i_i_fu_368_p2;
reg   [0:0] tmp_21_i_i_reg_638;
wire   [0:0] sel_tmp2_fu_391_p2;
reg   [0:0] sel_tmp2_reg_643;
wire   [0:0] inBlock_3_i_i_fu_397_p3;
reg   [0:0] inBlock_3_i_i_reg_648;
reg    ap_enable_reg_pp0_iter3;
wire   [15:0] bound_max_r_1_3_i_i_fu_413_p3;
reg   [15:0] bound_max_r_1_3_i_i_reg_653;
wire   [7:0] character_num_3_i_i_fu_429_p3;
reg   [7:0] character_num_3_i_i_reg_660;
wire   [15:0] bound_min_r_1_3_i_i_fu_457_p3;
reg   [15:0] bound_min_r_1_3_i_i_reg_665;
reg    ap_enable_reg_pp0_iter4;
wire   [16:0] tmp_25_i_i_fu_496_p2;
reg   [16:0] tmp_25_i_i_reg_672;
wire   [15:0] tmp_27_i_i_fu_501_p2;
reg   [15:0] tmp_27_i_i_reg_677;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state4;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter5;
reg    ap_enable_reg_pp0_iter6;
reg   [0:0] ap_phi_mux_inBlock_i_i_phi_fu_186_p4;
reg   [15:0] ap_phi_mux_bound_min_r_1_i_i_phi_fu_198_p4;
reg   [15:0] ap_phi_mux_bound_max_r_1_i_i_phi_fu_210_p4;
reg   [7:0] ap_phi_mux_character_num_i_i_phi_fu_222_p4;
reg    ap_block_pp0_stage0_01001;
wire   [0:0] not_i_i_fu_316_p2;
wire   [0:0] p_inBlock_i_i_fu_321_p2;
wire   [0:0] rev2_fu_346_p2;
wire   [0:0] inBlock_0_not_i_i_fu_351_p2;
wire   [0:0] tmp9_fu_357_p2;
wire   [7:0] p_character_num_i_i_fu_334_p3;
wire   [0:0] brmerge_i_i_fu_363_p2;
wire   [0:0] sel_tmp_fu_385_p2;
wire   [15:0] bound_max_r_fu_374_p2;
wire   [15:0] p_bound_max_r_1_i_i_fu_327_p3;
wire   [15:0] sel_tmp9_fu_405_p3;
wire   [7:0] character_num_fu_379_p2;
wire   [7:0] sel_tmp3_fu_421_p3;
wire   [15:0] p_bound_min_r_1_i_i_fu_437_p3;
wire   [15:0] p_bound_min_r_1_i_i_38_fu_444_p3;
wire   [15:0] sel_tmp5_fu_450_p3;
wire   [16:0] tmp_30_cast_i_i_fu_464_p1;
wire   [16:0] tmp_31_i_i_fu_467_p2;
wire   [0:0] tmp_10_fu_472_p3;
wire   [15:0] tmp_33_i_i_fu_480_p2;
wire   [16:0] tmp_24_cast_i_i_fu_493_p1;
wire   [30:0] tmp_25_cast_i_i_cast_fu_505_p1;
wire   [0:0] tmp_26_i_i_fu_508_p2;
wire    ap_CS_fsm_state11;
reg   [4:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 5'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter5 = 1'b0;
#0 ap_enable_reg_pp0_iter6 = 1'b0;
end

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
        end else if ((1'b1 == ap_CS_fsm_state11)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_pp0_exit_iter0_state4))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state3)) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            if ((1'b1 == ap_condition_pp0_exit_iter0_state4)) begin
                ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state4);
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
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter5 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter6 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter6 <= ap_enable_reg_pp0_iter5;
        end else if ((1'b1 == ap_CS_fsm_state3)) begin
            ap_enable_reg_pp0_iter6 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_reg_589_pp0_iter3_reg == 1'd0) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        bound_max_r_1_i_i_reg_206 <= bound_max_r_1_3_i_i_reg_653;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        bound_max_r_1_i_i_reg_206 <= 16'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_reg_589_pp0_iter4_reg == 1'd0) & (ap_enable_reg_pp0_iter5 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        bound_min_r_1_i_i_reg_194 <= bound_min_r_1_3_i_i_reg_665;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        bound_min_r_1_i_i_reg_194 <= 16'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_reg_589_pp0_iter3_reg == 1'd0) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        character_num_i_i_reg_218 <= character_num_3_i_i_reg_660;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        character_num_i_i_reg_218 <= 8'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_fu_282_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        i_i_i_reg_230 <= i_fu_287_p2;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        i_i_i_reg_230 <= 31'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_reg_589_pp0_iter3_reg == 1'd0) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        inBlock_i_i_reg_182 <= inBlock_3_i_i_reg_648;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        inBlock_i_i_reg_182 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_reg_589_pp0_iter2_reg == 1'd0) & (ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        bound_max_r_1_3_i_i_reg_653 <= bound_max_r_1_3_i_i_fu_413_p3;
        character_num_3_i_i_reg_660 <= character_num_3_i_i_fu_429_p3;
        inBlock_3_i_i_reg_648 <= inBlock_3_i_i_fu_397_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_reg_589_pp0_iter3_reg == 1'd0) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        bound_min_r_1_3_i_i_reg_665 <= bound_min_r_1_3_i_i_fu_457_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_fu_282_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        bound_min_r_1_reg_607 <= bound_min_r_1_fu_299_p1;
        tmp_19_i_i_reg_598 <= tmp_19_i_i_fu_293_p2;
        tmp_23_i_i_reg_613 <= tmp_23_i_i_fu_303_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        bound_min_r_1_reg_607_pp0_iter1_reg <= bound_min_r_1_reg_607;
        exitcond_reg_589 <= exitcond_fu_282_p2;
        exitcond_reg_589_pp0_iter1_reg <= exitcond_reg_589;
        tmp_19_i_i_reg_598_pp0_iter1_reg <= tmp_19_i_i_reg_598;
        tmp_23_i_i_reg_613_pp0_iter1_reg <= tmp_23_i_i_reg_613;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        bound_min_r_1_reg_607_pp0_iter2_reg <= bound_min_r_1_reg_607_pp0_iter1_reg;
        bound_min_r_1_reg_607_pp0_iter3_reg <= bound_min_r_1_reg_607_pp0_iter2_reg;
        exitcond_reg_589_pp0_iter2_reg <= exitcond_reg_589_pp0_iter1_reg;
        exitcond_reg_589_pp0_iter3_reg <= exitcond_reg_589_pp0_iter2_reg;
        exitcond_reg_589_pp0_iter4_reg <= exitcond_reg_589_pp0_iter3_reg;
        tmp_19_i_i_reg_598_pp0_iter2_reg <= tmp_19_i_i_reg_598_pp0_iter1_reg;
        tmp_19_i_i_reg_598_pp0_iter3_reg <= tmp_19_i_i_reg_598_pp0_iter2_reg;
        tmp_23_i_i_reg_613_pp0_iter2_reg <= tmp_23_i_i_reg_613_pp0_iter1_reg;
        tmp_23_i_i_reg_613_pp0_iter3_reg <= tmp_23_i_i_reg_613_pp0_iter2_reg;
        tmp_23_i_i_reg_613_pp0_iter4_reg <= tmp_23_i_i_reg_613_pp0_iter3_reg;
        tmp_23_i_i_reg_613_pp0_iter5_reg <= tmp_23_i_i_reg_613_pp0_iter4_reg;
    end
end

always @ (posedge ap_clk) begin
    if ((~((shrink_x_max_empty_n == 1'b0) | (shrink_x_min_empty_n == 1'b0) | (threshold_width_empty_n == 1'b0) | (src_cols_V_empty_n == 1'b0) | (ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        cols_reg_538 <= src_cols_V_dout;
        p_threshold_reg_532 <= p_threshold_fu_241_p1;
        shrink_x_max_read_reg_526 <= shrink_x_max_dout;
        shrink_x_min_read_reg_520 <= shrink_x_min_dout;
        tmp_7_reg_543 <= tmp_7_fu_245_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        length_reg_553 <= length_fu_254_p3;
        tmp_13_i_i_reg_559 <= tmp_13_i_i_fu_260_p2;
        tmp_14_cast_i_i_reg_564[7 : 0] <= tmp_14_cast_i_i_fu_266_p1[7 : 0];
        tmp_15_cast_i_i_reg_569[7 : 0] <= tmp_15_cast_i_i_fu_269_p1[7 : 0];
        tmp_16_i_i_reg_574[7 : 0] <= tmp_16_i_i_fu_272_p1[7 : 0];
        tmp_17_i_i_reg_579[7 : 0] <= tmp_17_i_i_fu_275_p1[7 : 0];
        tmp_reg_584 <= tmp_fu_278_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_reg_589_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        or_cond_i_i_reg_633 <= or_cond_i_i_fu_341_p2;
        sel_tmp2_reg_643 <= sel_tmp2_fu_391_p2;
        tmp_21_i_i_reg_638 <= tmp_21_i_i_fu_368_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_reg_589_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_20_i_i_reg_623 <= tmp_20_i_i_fu_308_p2;
        ult_reg_628 <= ult_fu_312_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_23_i_i_reg_613_pp0_iter4_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_25_i_i_reg_672 <= tmp_25_i_i_fu_496_p2;
        tmp_27_i_i_reg_677 <= tmp_27_i_i_fu_501_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_reg_589 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_8_reg_617 <= src_data_stream_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        tmp_i_i_reg_548 <= tmp_i_i_fu_249_p2;
    end
end

always @ (*) begin
    if ((exitcond_fu_282_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state4 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state4 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
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
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond_reg_589_pp0_iter3_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        ap_phi_mux_bound_max_r_1_i_i_phi_fu_210_p4 = bound_max_r_1_3_i_i_reg_653;
    end else begin
        ap_phi_mux_bound_max_r_1_i_i_phi_fu_210_p4 = bound_max_r_1_i_i_reg_206;
    end
end

always @ (*) begin
    if (((exitcond_reg_589_pp0_iter4_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
        ap_phi_mux_bound_min_r_1_i_i_phi_fu_198_p4 = bound_min_r_1_3_i_i_reg_665;
    end else begin
        ap_phi_mux_bound_min_r_1_i_i_phi_fu_198_p4 = bound_min_r_1_i_i_reg_194;
    end
end

always @ (*) begin
    if (((exitcond_reg_589_pp0_iter3_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        ap_phi_mux_character_num_i_i_phi_fu_222_p4 = character_num_3_i_i_reg_660;
    end else begin
        ap_phi_mux_character_num_i_i_phi_fu_222_p4 = character_num_i_i_reg_218;
    end
end

always @ (*) begin
    if (((exitcond_reg_589_pp0_iter3_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        ap_phi_mux_inBlock_i_i_phi_fu_186_p4 = inBlock_3_i_i_reg_648;
    end else begin
        ap_phi_mux_inBlock_i_i_phi_fu_186_p4 = inBlock_i_i_reg_182;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_01001) & (ap_enable_reg_pp0_iter4 == 1'b1) & (tmp_23_i_i_reg_613_pp0_iter3_reg == 1'd1))) begin
        bound_max_ap_vld = 1'b1;
    end else begin
        bound_max_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_01001) & (ap_enable_reg_pp0_iter6 == 1'b1) & (tmp_23_i_i_reg_613_pp0_iter5_reg == 1'd1))) begin
        bound_min_ap_vld = 1'b1;
    end else begin
        bound_min_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        shrink_x_max_blk_n = shrink_x_max_empty_n;
    end else begin
        shrink_x_max_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((shrink_x_max_empty_n == 1'b0) | (shrink_x_min_empty_n == 1'b0) | (threshold_width_empty_n == 1'b0) | (src_cols_V_empty_n == 1'b0) | (ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        shrink_x_max_read = 1'b1;
    end else begin
        shrink_x_max_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        shrink_x_min_blk_n = shrink_x_min_empty_n;
    end else begin
        shrink_x_min_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((shrink_x_max_empty_n == 1'b0) | (shrink_x_min_empty_n == 1'b0) | (threshold_width_empty_n == 1'b0) | (src_cols_V_empty_n == 1'b0) | (ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        shrink_x_min_read = 1'b1;
    end else begin
        shrink_x_min_read = 1'b0;
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
    if ((~((shrink_x_max_empty_n == 1'b0) | (shrink_x_min_empty_n == 1'b0) | (threshold_width_empty_n == 1'b0) | (src_cols_V_empty_n == 1'b0) | (ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        src_cols_V_read = 1'b1;
    end else begin
        src_cols_V_read = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond_reg_589 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        src_data_stream_V_blk_n = src_data_stream_V_empty_n;
    end else begin
        src_data_stream_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((exitcond_reg_589 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        src_data_stream_V_read = 1'b1;
    end else begin
        src_data_stream_V_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        threshold_width_blk_n = threshold_width_empty_n;
    end else begin
        threshold_width_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((shrink_x_max_empty_n == 1'b0) | (shrink_x_min_empty_n == 1'b0) | (threshold_width_empty_n == 1'b0) | (src_cols_V_empty_n == 1'b0) | (ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        threshold_width_read = 1'b1;
    end else begin
        threshold_width_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((shrink_x_max_empty_n == 1'b0) | (shrink_x_min_empty_n == 1'b0) | (threshold_width_empty_n == 1'b0) | (src_cols_V_empty_n == 1'b0) | (ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_enable_reg_pp0_iter1 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (exitcond_fu_282_p2 == 1'd1)) & ~((ap_enable_reg_pp0_iter5 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter6 == 1'b1)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter5 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter6 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (exitcond_fu_282_p2 == 1'd1)))) begin
                ap_NS_fsm = ap_ST_fsm_state11;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((exitcond_reg_589 == 1'd0) & (src_data_stream_V_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((exitcond_reg_589 == 1'd0) & (src_data_stream_V_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((exitcond_reg_589 == 1'd0) & (src_data_stream_V_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_state1 = ((shrink_x_max_empty_n == 1'b0) | (shrink_x_min_empty_n == 1'b0) | (threshold_width_empty_n == 1'b0) | (src_cols_V_empty_n == 1'b0) | (ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state10_pp0_stage0_iter6 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state5_pp0_stage0_iter1 = ((exitcond_reg_589 == 1'd0) & (src_data_stream_V_empty_n == 1'b0));
end

assign ap_block_state6_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp0_stage0_iter5 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign bound_max = ((tmp_10_fu_472_p3[0:0] === 1'b1) ? 16'd0 : tmp_33_i_i_fu_480_p2);

assign bound_max_r_1_3_i_i_fu_413_p3 = ((sel_tmp2_fu_391_p2[0:0] === 1'b1) ? p_bound_max_r_1_i_i_fu_327_p3 : sel_tmp9_fu_405_p3);

assign bound_max_r_fu_374_p2 = ($signed(16'd65535) + $signed(bound_min_r_1_reg_607_pp0_iter2_reg));

assign bound_min = ((tmp_26_i_i_fu_508_p2[0:0] === 1'b1) ? tmp_reg_584 : tmp_27_i_i_reg_677);

assign bound_min_r_1_3_i_i_fu_457_p3 = ((sel_tmp2_reg_643[0:0] === 1'b1) ? p_bound_min_r_1_i_i_fu_437_p3 : sel_tmp5_fu_450_p3);

assign bound_min_r_1_fu_299_p1 = i_i_i_reg_230[15:0];

assign brmerge_i_i_fu_363_p2 = (tmp_19_i_i_reg_598_pp0_iter2_reg | tmp9_fu_357_p2);

assign character_num_3_i_i_fu_429_p3 = ((sel_tmp2_fu_391_p2[0:0] === 1'b1) ? p_character_num_i_i_fu_334_p3 : sel_tmp3_fu_421_p3);

assign character_num_fu_379_p2 = (8'd1 + p_character_num_i_i_fu_334_p3);

assign exitcond_fu_282_p2 = ((i_i_i_reg_230 == length_reg_553) ? 1'b1 : 1'b0);

assign i_fu_287_p2 = (i_i_i_reg_230 + 31'd1);

assign inBlock_0_not_i_i_fu_351_p2 = (ap_phi_mux_inBlock_i_i_phi_fu_186_p4 ^ 1'd1);

assign inBlock_3_i_i_fu_397_p3 = ((sel_tmp2_fu_391_p2[0:0] === 1'b1) ? p_inBlock_i_i_fu_321_p2 : sel_tmp_fu_385_p2);

assign length_fu_254_p3 = ((tmp_i_i_reg_548[0:0] === 1'b1) ? 31'd1 : tmp_7_reg_543);

assign not_i_i_fu_316_p2 = (tmp_19_i_i_reg_598_pp0_iter2_reg ^ 1'd1);

assign or_cond_i_i_fu_341_p2 = (tmp_20_i_i_reg_623 | p_inBlock_i_i_fu_321_p2);

assign p_bound_max_r_1_i_i_fu_327_p3 = ((tmp_19_i_i_reg_598_pp0_iter2_reg[0:0] === 1'b1) ? 16'd0 : ap_phi_mux_bound_max_r_1_i_i_phi_fu_210_p4);

assign p_bound_min_r_1_i_i_38_fu_444_p3 = ((tmp_21_i_i_reg_638[0:0] === 1'b1) ? bound_min_r_1_reg_607_pp0_iter3_reg : p_bound_min_r_1_i_i_fu_437_p3);

assign p_bound_min_r_1_i_i_fu_437_p3 = ((tmp_19_i_i_reg_598_pp0_iter3_reg[0:0] === 1'b1) ? 16'd0 : ap_phi_mux_bound_min_r_1_i_i_phi_fu_198_p4);

assign p_character_num_i_i_fu_334_p3 = ((tmp_19_i_i_reg_598_pp0_iter2_reg[0:0] === 1'b1) ? 8'd0 : ap_phi_mux_character_num_i_i_phi_fu_222_p4);

assign p_inBlock_i_i_fu_321_p2 = (not_i_i_fu_316_p2 & ap_phi_mux_inBlock_i_i_phi_fu_186_p4);

assign p_threshold_fu_241_p1 = threshold_width_dout[15:0];

assign rev2_fu_346_p2 = (ult_reg_628 ^ 1'd1);

assign sel_tmp2_fu_391_p2 = (or_cond_i_i_fu_341_p2 & brmerge_i_i_fu_363_p2);

assign sel_tmp3_fu_421_p3 = ((or_cond_i_i_fu_341_p2[0:0] === 1'b1) ? character_num_fu_379_p2 : p_character_num_i_i_fu_334_p3);

assign sel_tmp5_fu_450_p3 = ((or_cond_i_i_reg_633[0:0] === 1'b1) ? p_bound_min_r_1_i_i_fu_437_p3 : p_bound_min_r_1_i_i_38_fu_444_p3);

assign sel_tmp9_fu_405_p3 = ((or_cond_i_i_fu_341_p2[0:0] === 1'b1) ? bound_max_r_fu_374_p2 : p_bound_max_r_1_i_i_fu_327_p3);

assign sel_tmp_fu_385_p2 = (or_cond_i_i_fu_341_p2 ^ 1'd1);

assign tmp9_fu_357_p2 = (rev2_fu_346_p2 | inBlock_0_not_i_i_fu_351_p2);

assign tmp_10_fu_472_p3 = tmp_31_i_i_fu_467_p2[32'd16];

assign tmp_13_i_i_fu_260_p2 = ($signed(31'd2147483647) + $signed(length_fu_254_p3));

assign tmp_14_cast_i_i_fu_266_p1 = shrink_x_min_read_reg_520;

assign tmp_15_cast_i_i_fu_269_p1 = shrink_x_max_read_reg_526;

assign tmp_16_i_i_fu_272_p1 = shrink_x_max_read_reg_526;

assign tmp_17_i_i_fu_275_p1 = shrink_x_min_read_reg_520;

assign tmp_19_i_i_fu_293_p2 = ((i_i_i_reg_230 == 31'd0) ? 1'b1 : 1'b0);

assign tmp_20_i_i_fu_308_p2 = ((tmp_8_reg_617 < p_threshold_reg_532) ? 1'b1 : 1'b0);

assign tmp_21_i_i_fu_368_p2 = ((p_character_num_i_i_fu_334_p3 == 8'd0) ? 1'b1 : 1'b0);

assign tmp_23_i_i_fu_303_p2 = ((i_i_i_reg_230 == tmp_13_i_i_reg_559) ? 1'b1 : 1'b0);

assign tmp_24_cast_i_i_fu_493_p1 = bound_min_r_1_3_i_i_reg_665;

assign tmp_25_cast_i_i_cast_fu_505_p1 = tmp_25_i_i_reg_672;

assign tmp_25_i_i_fu_496_p2 = (tmp_24_cast_i_i_fu_493_p1 + tmp_14_cast_i_i_reg_564);

assign tmp_26_i_i_fu_508_p2 = ((tmp_25_cast_i_i_cast_fu_505_p1 > length_reg_553) ? 1'b1 : 1'b0);

assign tmp_27_i_i_fu_501_p2 = (bound_min_r_1_3_i_i_reg_665 + tmp_17_i_i_reg_579);

assign tmp_30_cast_i_i_fu_464_p1 = bound_max_r_1_3_i_i_reg_653;

assign tmp_31_i_i_fu_467_p2 = (tmp_30_cast_i_i_fu_464_p1 - tmp_15_cast_i_i_reg_569);

assign tmp_33_i_i_fu_480_p2 = (bound_max_r_1_3_i_i_reg_653 - tmp_16_i_i_reg_574);

assign tmp_7_fu_245_p1 = src_cols_V_dout[30:0];

assign tmp_fu_278_p1 = length_fu_254_p3[15:0];

assign tmp_i_i_fu_249_p2 = (($signed(cols_reg_538) < $signed(32'd1)) ? 1'b1 : 1'b0);

assign ult_fu_312_p2 = ((tmp_8_reg_617 < p_threshold_reg_532) ? 1'b1 : 1'b0);

always @ (posedge ap_clk) begin
    tmp_14_cast_i_i_reg_564[16:8] <= 9'b000000000;
    tmp_15_cast_i_i_reg_569[16:8] <= 9'b000000000;
    tmp_16_i_i_reg_574[15:8] <= 8'b00000000;
    tmp_17_i_i_reg_579[15:8] <= 8'b00000000;
end

endmodule //find_boundary_shrink_1
