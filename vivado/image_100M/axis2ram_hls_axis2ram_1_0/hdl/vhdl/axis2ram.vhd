-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.2
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity axis2ram is
port (
    input_r_TDATA : IN STD_LOGIC_VECTOR (7 downto 0);
    input_r_TKEEP : IN STD_LOGIC_VECTOR (0 downto 0);
    input_r_TSTRB : IN STD_LOGIC_VECTOR (0 downto 0);
    input_r_TUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    input_r_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
    input_r_TID : IN STD_LOGIC_VECTOR (0 downto 0);
    input_r_TDEST : IN STD_LOGIC_VECTOR (0 downto 0);
    output_r_address0 : OUT STD_LOGIC_VECTOR (18 downto 0);
    output_r_ce0 : OUT STD_LOGIC;
    output_r_d0 : OUT STD_LOGIC_VECTOR (0 downto 0);
    output_r_q0 : IN STD_LOGIC_VECTOR (0 downto 0);
    output_r_we0 : OUT STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    input_r_TVALID : IN STD_LOGIC;
    input_r_TREADY : OUT STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC );
end;


architecture behav of axis2ram is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "axis2ram,hls_ip_2018_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7a100tcsg324-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=dataflow,HLS_SYN_CLOCK=8.640000,HLS_SYN_LAT=-1,HLS_SYN_TPT=-1,HLS_SYN_MEM=0,HLS_SYN_DSP=1,HLS_SYN_FF=504,HLS_SYN_LUT=918,HLS_VERSION=2018_2}";
    constant ap_const_lv19_0 : STD_LOGIC_VECTOR (18 downto 0) := "0000000000000000000";
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_logic_1 : STD_LOGIC := '1';

    signal ap_rst_n_inv : STD_LOGIC;
    signal Block_proc_U0_ap_start : STD_LOGIC;
    signal Block_proc_U0_ap_done : STD_LOGIC;
    signal Block_proc_U0_ap_continue : STD_LOGIC;
    signal Block_proc_U0_ap_idle : STD_LOGIC;
    signal Block_proc_U0_ap_ready : STD_LOGIC;
    signal Block_proc_U0_img_0_rows_V_out_din : STD_LOGIC_VECTOR (9 downto 0);
    signal Block_proc_U0_img_0_rows_V_out_write : STD_LOGIC;
    signal Block_proc_U0_img_0_cols_V_out_din : STD_LOGIC_VECTOR (10 downto 0);
    signal Block_proc_U0_img_0_cols_V_out_write : STD_LOGIC;
    signal AXIvideo2Mat_U0_ap_start : STD_LOGIC;
    signal AXIvideo2Mat_U0_ap_done : STD_LOGIC;
    signal AXIvideo2Mat_U0_ap_continue : STD_LOGIC;
    signal AXIvideo2Mat_U0_ap_idle : STD_LOGIC;
    signal AXIvideo2Mat_U0_ap_ready : STD_LOGIC;
    signal AXIvideo2Mat_U0_start_out : STD_LOGIC;
    signal AXIvideo2Mat_U0_start_write : STD_LOGIC;
    signal AXIvideo2Mat_U0_input_r_TREADY : STD_LOGIC;
    signal AXIvideo2Mat_U0_img_rows_V_read : STD_LOGIC;
    signal AXIvideo2Mat_U0_img_cols_V_read : STD_LOGIC;
    signal AXIvideo2Mat_U0_img_data_stream_V_din : STD_LOGIC_VECTOR (7 downto 0);
    signal AXIvideo2Mat_U0_img_data_stream_V_write : STD_LOGIC;
    signal AXIvideo2Mat_U0_img_rows_V_out_din : STD_LOGIC_VECTOR (9 downto 0);
    signal AXIvideo2Mat_U0_img_rows_V_out_write : STD_LOGIC;
    signal AXIvideo2Mat_U0_img_cols_V_out_din : STD_LOGIC_VECTOR (10 downto 0);
    signal AXIvideo2Mat_U0_img_cols_V_out_write : STD_LOGIC;
    signal mat2vector_U0_ap_start : STD_LOGIC;
    signal mat2vector_U0_ap_done : STD_LOGIC;
    signal mat2vector_U0_ap_continue : STD_LOGIC;
    signal mat2vector_U0_ap_idle : STD_LOGIC;
    signal mat2vector_U0_ap_ready : STD_LOGIC;
    signal mat2vector_U0_src_rows_V_read : STD_LOGIC;
    signal mat2vector_U0_src_cols_V_read : STD_LOGIC;
    signal mat2vector_U0_src_data_stream_V_read : STD_LOGIC;
    signal mat2vector_U0_dst_address0 : STD_LOGIC_VECTOR (18 downto 0);
    signal mat2vector_U0_dst_ce0 : STD_LOGIC;
    signal mat2vector_U0_dst_we0 : STD_LOGIC;
    signal mat2vector_U0_dst_d0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sync_continue : STD_LOGIC;
    signal img_0_rows_V_c_full_n : STD_LOGIC;
    signal img_0_rows_V_c_dout : STD_LOGIC_VECTOR (9 downto 0);
    signal img_0_rows_V_c_empty_n : STD_LOGIC;
    signal img_0_cols_V_c_full_n : STD_LOGIC;
    signal img_0_cols_V_c_dout : STD_LOGIC_VECTOR (10 downto 0);
    signal img_0_cols_V_c_empty_n : STD_LOGIC;
    signal img_0_data_stream_0_full_n : STD_LOGIC;
    signal img_0_data_stream_0_dout : STD_LOGIC_VECTOR (7 downto 0);
    signal img_0_data_stream_0_empty_n : STD_LOGIC;
    signal img_0_rows_V_c4_full_n : STD_LOGIC;
    signal img_0_rows_V_c4_dout : STD_LOGIC_VECTOR (9 downto 0);
    signal img_0_rows_V_c4_empty_n : STD_LOGIC;
    signal img_0_cols_V_c5_full_n : STD_LOGIC;
    signal img_0_cols_V_c5_dout : STD_LOGIC_VECTOR (10 downto 0);
    signal img_0_cols_V_c5_empty_n : STD_LOGIC;
    signal ap_sync_done : STD_LOGIC;
    signal ap_sync_ready : STD_LOGIC;
    signal Block_proc_U0_start_full_n : STD_LOGIC;
    signal Block_proc_U0_start_write : STD_LOGIC;
    signal start_for_mat2vector_U0_din : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_mat2vector_U0_full_n : STD_LOGIC;
    signal start_for_mat2vector_U0_dout : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_mat2vector_U0_empty_n : STD_LOGIC;
    signal mat2vector_U0_start_full_n : STD_LOGIC;
    signal mat2vector_U0_start_write : STD_LOGIC;

    component Block_proc IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        img_0_rows_V_out_din : OUT STD_LOGIC_VECTOR (9 downto 0);
        img_0_rows_V_out_full_n : IN STD_LOGIC;
        img_0_rows_V_out_write : OUT STD_LOGIC;
        img_0_cols_V_out_din : OUT STD_LOGIC_VECTOR (10 downto 0);
        img_0_cols_V_out_full_n : IN STD_LOGIC;
        img_0_cols_V_out_write : OUT STD_LOGIC );
    end component;


    component AXIvideo2Mat IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        start_full_n : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        start_out : OUT STD_LOGIC;
        start_write : OUT STD_LOGIC;
        input_r_TDATA : IN STD_LOGIC_VECTOR (7 downto 0);
        input_r_TVALID : IN STD_LOGIC;
        input_r_TREADY : OUT STD_LOGIC;
        input_r_TKEEP : IN STD_LOGIC_VECTOR (0 downto 0);
        input_r_TSTRB : IN STD_LOGIC_VECTOR (0 downto 0);
        input_r_TUSER : IN STD_LOGIC_VECTOR (0 downto 0);
        input_r_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
        input_r_TID : IN STD_LOGIC_VECTOR (0 downto 0);
        input_r_TDEST : IN STD_LOGIC_VECTOR (0 downto 0);
        img_rows_V_dout : IN STD_LOGIC_VECTOR (9 downto 0);
        img_rows_V_empty_n : IN STD_LOGIC;
        img_rows_V_read : OUT STD_LOGIC;
        img_cols_V_dout : IN STD_LOGIC_VECTOR (10 downto 0);
        img_cols_V_empty_n : IN STD_LOGIC;
        img_cols_V_read : OUT STD_LOGIC;
        img_data_stream_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
        img_data_stream_V_full_n : IN STD_LOGIC;
        img_data_stream_V_write : OUT STD_LOGIC;
        img_rows_V_out_din : OUT STD_LOGIC_VECTOR (9 downto 0);
        img_rows_V_out_full_n : IN STD_LOGIC;
        img_rows_V_out_write : OUT STD_LOGIC;
        img_cols_V_out_din : OUT STD_LOGIC_VECTOR (10 downto 0);
        img_cols_V_out_full_n : IN STD_LOGIC;
        img_cols_V_out_write : OUT STD_LOGIC );
    end component;


    component mat2vector IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        src_rows_V_dout : IN STD_LOGIC_VECTOR (9 downto 0);
        src_rows_V_empty_n : IN STD_LOGIC;
        src_rows_V_read : OUT STD_LOGIC;
        src_cols_V_dout : IN STD_LOGIC_VECTOR (10 downto 0);
        src_cols_V_empty_n : IN STD_LOGIC;
        src_cols_V_read : OUT STD_LOGIC;
        src_data_stream_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
        src_data_stream_V_empty_n : IN STD_LOGIC;
        src_data_stream_V_read : OUT STD_LOGIC;
        dst_address0 : OUT STD_LOGIC_VECTOR (18 downto 0);
        dst_ce0 : OUT STD_LOGIC;
        dst_we0 : OUT STD_LOGIC;
        dst_d0 : OUT STD_LOGIC_VECTOR (0 downto 0) );
    end component;


    component fifo_w10_d2_A IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (9 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (9 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component fifo_w11_d2_A IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (10 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (10 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component fifo_w8_d2_A IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (7 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (7 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component start_for_mat2veccud IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (0 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (0 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;



begin
    Block_proc_U0 : component Block_proc
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => Block_proc_U0_ap_start,
        ap_done => Block_proc_U0_ap_done,
        ap_continue => Block_proc_U0_ap_continue,
        ap_idle => Block_proc_U0_ap_idle,
        ap_ready => Block_proc_U0_ap_ready,
        img_0_rows_V_out_din => Block_proc_U0_img_0_rows_V_out_din,
        img_0_rows_V_out_full_n => img_0_rows_V_c_full_n,
        img_0_rows_V_out_write => Block_proc_U0_img_0_rows_V_out_write,
        img_0_cols_V_out_din => Block_proc_U0_img_0_cols_V_out_din,
        img_0_cols_V_out_full_n => img_0_cols_V_c_full_n,
        img_0_cols_V_out_write => Block_proc_U0_img_0_cols_V_out_write);

    AXIvideo2Mat_U0 : component AXIvideo2Mat
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => AXIvideo2Mat_U0_ap_start,
        start_full_n => start_for_mat2vector_U0_full_n,
        ap_done => AXIvideo2Mat_U0_ap_done,
        ap_continue => AXIvideo2Mat_U0_ap_continue,
        ap_idle => AXIvideo2Mat_U0_ap_idle,
        ap_ready => AXIvideo2Mat_U0_ap_ready,
        start_out => AXIvideo2Mat_U0_start_out,
        start_write => AXIvideo2Mat_U0_start_write,
        input_r_TDATA => input_r_TDATA,
        input_r_TVALID => input_r_TVALID,
        input_r_TREADY => AXIvideo2Mat_U0_input_r_TREADY,
        input_r_TKEEP => input_r_TKEEP,
        input_r_TSTRB => input_r_TSTRB,
        input_r_TUSER => input_r_TUSER,
        input_r_TLAST => input_r_TLAST,
        input_r_TID => input_r_TID,
        input_r_TDEST => input_r_TDEST,
        img_rows_V_dout => img_0_rows_V_c_dout,
        img_rows_V_empty_n => img_0_rows_V_c_empty_n,
        img_rows_V_read => AXIvideo2Mat_U0_img_rows_V_read,
        img_cols_V_dout => img_0_cols_V_c_dout,
        img_cols_V_empty_n => img_0_cols_V_c_empty_n,
        img_cols_V_read => AXIvideo2Mat_U0_img_cols_V_read,
        img_data_stream_V_din => AXIvideo2Mat_U0_img_data_stream_V_din,
        img_data_stream_V_full_n => img_0_data_stream_0_full_n,
        img_data_stream_V_write => AXIvideo2Mat_U0_img_data_stream_V_write,
        img_rows_V_out_din => AXIvideo2Mat_U0_img_rows_V_out_din,
        img_rows_V_out_full_n => img_0_rows_V_c4_full_n,
        img_rows_V_out_write => AXIvideo2Mat_U0_img_rows_V_out_write,
        img_cols_V_out_din => AXIvideo2Mat_U0_img_cols_V_out_din,
        img_cols_V_out_full_n => img_0_cols_V_c5_full_n,
        img_cols_V_out_write => AXIvideo2Mat_U0_img_cols_V_out_write);

    mat2vector_U0 : component mat2vector
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => mat2vector_U0_ap_start,
        ap_done => mat2vector_U0_ap_done,
        ap_continue => mat2vector_U0_ap_continue,
        ap_idle => mat2vector_U0_ap_idle,
        ap_ready => mat2vector_U0_ap_ready,
        src_rows_V_dout => img_0_rows_V_c4_dout,
        src_rows_V_empty_n => img_0_rows_V_c4_empty_n,
        src_rows_V_read => mat2vector_U0_src_rows_V_read,
        src_cols_V_dout => img_0_cols_V_c5_dout,
        src_cols_V_empty_n => img_0_cols_V_c5_empty_n,
        src_cols_V_read => mat2vector_U0_src_cols_V_read,
        src_data_stream_V_dout => img_0_data_stream_0_dout,
        src_data_stream_V_empty_n => img_0_data_stream_0_empty_n,
        src_data_stream_V_read => mat2vector_U0_src_data_stream_V_read,
        dst_address0 => mat2vector_U0_dst_address0,
        dst_ce0 => mat2vector_U0_dst_ce0,
        dst_we0 => mat2vector_U0_dst_we0,
        dst_d0 => mat2vector_U0_dst_d0);

    img_0_rows_V_c_U : component fifo_w10_d2_A
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Block_proc_U0_img_0_rows_V_out_din,
        if_full_n => img_0_rows_V_c_full_n,
        if_write => Block_proc_U0_img_0_rows_V_out_write,
        if_dout => img_0_rows_V_c_dout,
        if_empty_n => img_0_rows_V_c_empty_n,
        if_read => AXIvideo2Mat_U0_img_rows_V_read);

    img_0_cols_V_c_U : component fifo_w11_d2_A
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Block_proc_U0_img_0_cols_V_out_din,
        if_full_n => img_0_cols_V_c_full_n,
        if_write => Block_proc_U0_img_0_cols_V_out_write,
        if_dout => img_0_cols_V_c_dout,
        if_empty_n => img_0_cols_V_c_empty_n,
        if_read => AXIvideo2Mat_U0_img_cols_V_read);

    img_0_data_stream_0_U : component fifo_w8_d2_A
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => AXIvideo2Mat_U0_img_data_stream_V_din,
        if_full_n => img_0_data_stream_0_full_n,
        if_write => AXIvideo2Mat_U0_img_data_stream_V_write,
        if_dout => img_0_data_stream_0_dout,
        if_empty_n => img_0_data_stream_0_empty_n,
        if_read => mat2vector_U0_src_data_stream_V_read);

    img_0_rows_V_c4_U : component fifo_w10_d2_A
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => AXIvideo2Mat_U0_img_rows_V_out_din,
        if_full_n => img_0_rows_V_c4_full_n,
        if_write => AXIvideo2Mat_U0_img_rows_V_out_write,
        if_dout => img_0_rows_V_c4_dout,
        if_empty_n => img_0_rows_V_c4_empty_n,
        if_read => mat2vector_U0_src_rows_V_read);

    img_0_cols_V_c5_U : component fifo_w11_d2_A
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => AXIvideo2Mat_U0_img_cols_V_out_din,
        if_full_n => img_0_cols_V_c5_full_n,
        if_write => AXIvideo2Mat_U0_img_cols_V_out_write,
        if_dout => img_0_cols_V_c5_dout,
        if_empty_n => img_0_cols_V_c5_empty_n,
        if_read => mat2vector_U0_src_cols_V_read);

    start_for_mat2veccud_U : component start_for_mat2veccud
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => start_for_mat2vector_U0_din,
        if_full_n => start_for_mat2vector_U0_full_n,
        if_write => AXIvideo2Mat_U0_start_write,
        if_dout => start_for_mat2vector_U0_dout,
        if_empty_n => start_for_mat2vector_U0_empty_n,
        if_read => mat2vector_U0_ap_ready);




    AXIvideo2Mat_U0_ap_continue <= ap_const_logic_1;
    AXIvideo2Mat_U0_ap_start <= ap_start;
    Block_proc_U0_ap_continue <= ap_const_logic_1;
    Block_proc_U0_ap_start <= ap_start;
    Block_proc_U0_start_full_n <= ap_const_logic_1;
    Block_proc_U0_start_write <= ap_const_logic_0;
    ap_done <= mat2vector_U0_ap_done;
    ap_idle <= (mat2vector_U0_ap_idle and Block_proc_U0_ap_idle and AXIvideo2Mat_U0_ap_idle);
    ap_ready <= AXIvideo2Mat_U0_ap_ready;

    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;

    ap_sync_continue <= ap_const_logic_1;
    ap_sync_done <= mat2vector_U0_ap_done;
    ap_sync_ready <= AXIvideo2Mat_U0_ap_ready;
    input_r_TREADY <= AXIvideo2Mat_U0_input_r_TREADY;
    mat2vector_U0_ap_continue <= ap_const_logic_1;
    mat2vector_U0_ap_start <= start_for_mat2vector_U0_empty_n;
    mat2vector_U0_start_full_n <= ap_const_logic_1;
    mat2vector_U0_start_write <= ap_const_logic_0;
    output_r_address0 <= mat2vector_U0_dst_address0;
    output_r_ce0 <= mat2vector_U0_dst_ce0;
    output_r_d0 <= mat2vector_U0_dst_d0;
    output_r_we0 <= mat2vector_U0_dst_we0;
    start_for_mat2vector_U0_din <= (0=>ap_const_logic_1, others=>'-');
end behav;
