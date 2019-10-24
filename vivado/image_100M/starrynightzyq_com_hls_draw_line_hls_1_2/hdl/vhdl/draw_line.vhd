-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.2
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity draw_line is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    src_data_stream_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    src_data_stream_V_empty_n : IN STD_LOGIC;
    src_data_stream_V_read : OUT STD_LOGIC;
    dst_rows_V_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    dst_rows_V_empty_n : IN STD_LOGIC;
    dst_rows_V_read : OUT STD_LOGIC;
    dst_cols_V_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    dst_cols_V_empty_n : IN STD_LOGIC;
    dst_cols_V_read : OUT STD_LOGIC;
    dst_data_stream_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    dst_data_stream_V_full_n : IN STD_LOGIC;
    dst_data_stream_V_write : OUT STD_LOGIC;
    bound_x_min_address0 : OUT STD_LOGIC_VECTOR (2 downto 0);
    bound_x_min_ce0 : OUT STD_LOGIC;
    bound_x_min_q0 : IN STD_LOGIC_VECTOR (15 downto 0);
    bound_x_max_address0 : OUT STD_LOGIC_VECTOR (2 downto 0);
    bound_x_max_ce0 : OUT STD_LOGIC;
    bound_x_max_q0 : IN STD_LOGIC_VECTOR (15 downto 0);
    bound_y_min_dout : IN STD_LOGIC_VECTOR (15 downto 0);
    bound_y_min_empty_n : IN STD_LOGIC;
    bound_y_min_read : OUT STD_LOGIC;
    bound_y_max_dout : IN STD_LOGIC_VECTOR (15 downto 0);
    bound_y_max_empty_n : IN STD_LOGIC;
    bound_y_max_read : OUT STD_LOGIC;
    box_num_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    box_num_empty_n : IN STD_LOGIC;
    box_num_read : OUT STD_LOGIC );
end;


architecture behav of draw_line is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (4 downto 0) := "00010";
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (4 downto 0) := "00100";
    constant ap_ST_fsm_pp0_stage1 : STD_LOGIC_VECTOR (4 downto 0) := "01000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (4 downto 0) := "10000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv9_1FF : STD_LOGIC_VECTOR (8 downto 0) := "111111111";
    constant ap_const_lv8_1 : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    constant ap_const_lv8_C8 : STD_LOGIC_VECTOR (7 downto 0) := "11001000";

    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal src_data_stream_V_blk_n : STD_LOGIC;
    signal ap_CS_fsm_pp0_stage1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage1 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC := '0';
    signal ap_block_pp0_stage1 : BOOLEAN;
    signal exitcond_i_reg_600 : STD_LOGIC_VECTOR (0 downto 0);
    signal dst_rows_V_blk_n : STD_LOGIC;
    signal dst_cols_V_blk_n : STD_LOGIC;
    signal dst_data_stream_V_blk_n : STD_LOGIC;
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal bound_y_min_blk_n : STD_LOGIC;
    signal bound_y_max_blk_n : STD_LOGIC;
    signal box_num_blk_n : STD_LOGIC;
    signal t_V_2_reg_254 : STD_LOGIC_VECTOR (31 downto 0);
    signal rows_V_reg_554 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_state1 : BOOLEAN;
    signal cols_V_reg_559 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_i_fu_266_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_i_reg_564 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_8_i_fu_270_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_8_i_reg_570 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_i_22_fu_278_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal tmp_i_22_reg_576 : STD_LOGIC_VECTOR (8 downto 0);
    signal exitcond2_i_fu_294_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal i_V_fu_299_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_V_reg_585 : STD_LOGIC_VECTOR (31 downto 0);
    signal brmerge1_i_fu_337_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal brmerge1_i_reg_590 : STD_LOGIC_VECTOR (0 downto 0);
    signal brmerge2_i_fu_343_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal brmerge2_i_reg_595 : STD_LOGIC_VECTOR (0 downto 0);
    signal exitcond_i_fu_349_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state3_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state5_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal j_V_fu_354_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal j_V_reg_604 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_3_i_fu_363_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_3_i_reg_609 : STD_LOGIC_VECTOR (0 downto 0);
    signal p_character_index_1_i_fu_369_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal p_character_index_1_i_reg_615 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_14_i_fu_387_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_14_i_reg_634 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_2_reg_639 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_block_state4_pp0_stage1_iter0 : BOOLEAN;
    signal ap_block_pp0_stage1_11001 : BOOLEAN;
    signal sel_tmp_fu_437_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal sel_tmp_reg_646 : STD_LOGIC_VECTOR (0 downto 0);
    signal sel_tmp3_fu_449_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal sel_tmp3_reg_651 : STD_LOGIC_VECTOR (0 downto 0);
    signal sel_tmp6_fu_466_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal sel_tmp6_reg_657 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_condition_pp0_exit_iter0_state3 : STD_LOGIC;
    signal ap_block_pp0_stage1_subdone : BOOLEAN;
    signal t_V_reg_243 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal ap_phi_mux_t_V_2_phi_fu_258_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_4_i_fu_377_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal inBlock_i_fu_166 : STD_LOGIC_VECTOR (0 downto 0);
    signal inBlock_6_i_fu_531_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal character_index_i_fu_170 : STD_LOGIC_VECTOR (7 downto 0);
    signal character_index_5_i_fu_486_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_9_cast_i_fu_274_p1 : STD_LOGIC_VECTOR (8 downto 0);
    signal ult_fu_315_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ult1_fu_326_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal rev_fu_320_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal rev1_fu_331_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_1_i_fu_305_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_2_i_fu_310_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_13_cast_i_fu_383_p1 : STD_LOGIC_VECTOR (8 downto 0);
    signal not_i_fu_395_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_6_i_fu_406_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_11_i_fu_416_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_15_i_fu_426_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal p_inBlock_1_i_fu_400_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_7_i_fu_410_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal sel_tmp2_fu_443_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal inBlock_1_i_not_fu_455_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal sel_tmp5_fu_461_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_12_i_fu_420_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal character_index_fu_431_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal sel_tmp9_fu_472_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal sel_tmp1_fu_479_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal d_val_0_1_fu_498_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal d_val_0_2_fu_504_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal d_val_0_3_fu_510_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal d_val_0_4_fu_516_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;


begin




    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state2) and (exitcond2_i_fu_294_p2 = ap_const_lv1_1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_logic_1 = ap_condition_pp0_exit_iter0_state3) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
                elsif (((exitcond2_i_fu_294_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_condition_pp0_exit_iter0_state3) and (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) or ((ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_const_boolean_0 = ap_block_pp0_stage1_subdone))))) then 
                    ap_enable_reg_pp0_iter1 <= (ap_const_logic_1 xor ap_condition_pp0_exit_iter0_state3);
                elsif ((((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) or ((ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_const_boolean_0 = ap_block_pp0_stage1_subdone)))) then 
                    ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                elsif (((exitcond2_i_fu_294_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    character_index_i_fu_170_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((exitcond_i_reg_600 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001))) then 
                character_index_i_fu_170 <= character_index_5_i_fu_486_p3;
            elsif ((not(((box_num_empty_n = ap_const_logic_0) or (bound_y_max_empty_n = ap_const_logic_0) or (bound_y_min_empty_n = ap_const_logic_0) or (dst_cols_V_empty_n = ap_const_logic_0) or (dst_rows_V_empty_n = ap_const_logic_0) or (ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                character_index_i_fu_170 <= ap_const_lv8_0;
            end if; 
        end if;
    end process;

    inBlock_i_fu_166_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((exitcond_i_reg_600 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
                inBlock_i_fu_166 <= inBlock_6_i_fu_531_p2;
            elsif ((not(((box_num_empty_n = ap_const_logic_0) or (bound_y_max_empty_n = ap_const_logic_0) or (bound_y_min_empty_n = ap_const_logic_0) or (dst_cols_V_empty_n = ap_const_logic_0) or (dst_rows_V_empty_n = ap_const_logic_0) or (ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                inBlock_i_fu_166 <= ap_const_lv1_0;
            end if; 
        end if;
    end process;

    t_V_2_reg_254_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((exitcond_i_reg_600 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
                t_V_2_reg_254 <= j_V_reg_604;
            elsif (((exitcond2_i_fu_294_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                t_V_2_reg_254 <= ap_const_lv32_0;
            end if; 
        end if;
    end process;

    t_V_reg_243_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
                t_V_reg_243 <= i_V_reg_585;
            elsif ((not(((box_num_empty_n = ap_const_logic_0) or (bound_y_max_empty_n = ap_const_logic_0) or (bound_y_min_empty_n = ap_const_logic_0) or (dst_cols_V_empty_n = ap_const_logic_0) or (dst_rows_V_empty_n = ap_const_logic_0) or (ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                t_V_reg_243 <= ap_const_lv32_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((exitcond2_i_fu_294_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                brmerge1_i_reg_590 <= brmerge1_i_fu_337_p2;
                brmerge2_i_reg_595 <= brmerge2_i_fu_343_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((box_num_empty_n = ap_const_logic_0) or (bound_y_max_empty_n = ap_const_logic_0) or (bound_y_min_empty_n = ap_const_logic_0) or (dst_cols_V_empty_n = ap_const_logic_0) or (dst_rows_V_empty_n = ap_const_logic_0) or (ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                cols_V_reg_559 <= dst_cols_V_dout;
                rows_V_reg_554 <= dst_rows_V_dout;
                    tmp_8_i_reg_570(15 downto 0) <= tmp_8_i_fu_270_p1(15 downto 0);
                tmp_i_22_reg_576 <= tmp_i_22_fu_278_p2;
                    tmp_i_reg_564(15 downto 0) <= tmp_i_fu_266_p1(15 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                exitcond_i_reg_600 <= exitcond_i_fu_349_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                i_V_reg_585 <= i_V_fu_299_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                j_V_reg_604 <= j_V_fu_354_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((exitcond_i_fu_349_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                p_character_index_1_i_reg_615 <= p_character_index_1_i_fu_369_p3;
                tmp_14_i_reg_634 <= tmp_14_i_fu_387_p2;
                tmp_3_i_reg_609 <= tmp_3_i_fu_363_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((exitcond_i_reg_600 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001))) then
                sel_tmp3_reg_651 <= sel_tmp3_fu_449_p2;
                sel_tmp6_reg_657 <= sel_tmp6_fu_466_p2;
                sel_tmp_reg_646 <= sel_tmp_fu_437_p2;
                tmp_2_reg_639 <= src_data_stream_V_dout;
            end if;
        end if;
    end process;
    tmp_i_reg_564(31 downto 16) <= "0000000000000000";
    tmp_8_i_reg_570(31 downto 16) <= "0000000000000000";

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, dst_rows_V_empty_n, dst_cols_V_empty_n, bound_y_min_empty_n, bound_y_max_empty_n, box_num_empty_n, ap_enable_reg_pp0_iter0, exitcond2_i_fu_294_p2, ap_CS_fsm_state2, exitcond_i_fu_349_p2, ap_block_pp0_stage0_subdone, ap_block_pp0_stage1_subdone)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((box_num_empty_n = ap_const_logic_0) or (bound_y_max_empty_n = ap_const_logic_0) or (bound_y_min_empty_n = ap_const_logic_0) or (dst_cols_V_empty_n = ap_const_logic_0) or (dst_rows_V_empty_n = ap_const_logic_0) or (ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and (exitcond2_i_fu_294_p2 = ap_const_lv1_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_pp0_stage0 => 
                if ((not(((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (exitcond_i_fu_349_p2 = ap_const_lv1_1))) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                elsif (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (exitcond_i_fu_349_p2 = ap_const_lv1_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state6;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_pp0_stage1 => 
                if ((ap_const_boolean_0 = ap_block_pp0_stage1_subdone)) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                end if;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state2;
            when others =>  
                ap_NS_fsm <= "XXXXX";
        end case;
    end process;
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(2);
    ap_CS_fsm_pp0_stage1 <= ap_CS_fsm(3);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state6 <= ap_CS_fsm(4);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(dst_data_stream_V_full_n, exitcond_i_reg_600, ap_enable_reg_pp0_iter1)
    begin
                ap_block_pp0_stage0_01001 <= ((exitcond_i_reg_600 = ap_const_lv1_0) and (dst_data_stream_V_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(dst_data_stream_V_full_n, exitcond_i_reg_600, ap_enable_reg_pp0_iter1)
    begin
                ap_block_pp0_stage0_11001 <= ((exitcond_i_reg_600 = ap_const_lv1_0) and (dst_data_stream_V_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(dst_data_stream_V_full_n, exitcond_i_reg_600, ap_enable_reg_pp0_iter1)
    begin
                ap_block_pp0_stage0_subdone <= ((exitcond_i_reg_600 = ap_const_lv1_0) and (dst_data_stream_V_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1));
    end process;

        ap_block_pp0_stage1 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage1_11001_assign_proc : process(src_data_stream_V_empty_n, ap_enable_reg_pp0_iter0, exitcond_i_reg_600)
    begin
                ap_block_pp0_stage1_11001 <= ((exitcond_i_reg_600 = ap_const_lv1_0) and (src_data_stream_V_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1));
    end process;


    ap_block_pp0_stage1_subdone_assign_proc : process(src_data_stream_V_empty_n, ap_enable_reg_pp0_iter0, exitcond_i_reg_600)
    begin
                ap_block_pp0_stage1_subdone <= ((exitcond_i_reg_600 = ap_const_lv1_0) and (src_data_stream_V_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1));
    end process;


    ap_block_state1_assign_proc : process(ap_start, ap_done_reg, dst_rows_V_empty_n, dst_cols_V_empty_n, bound_y_min_empty_n, bound_y_max_empty_n, box_num_empty_n)
    begin
                ap_block_state1 <= ((box_num_empty_n = ap_const_logic_0) or (bound_y_max_empty_n = ap_const_logic_0) or (bound_y_min_empty_n = ap_const_logic_0) or (dst_cols_V_empty_n = ap_const_logic_0) or (dst_rows_V_empty_n = ap_const_logic_0) or (ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;

        ap_block_state3_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state4_pp0_stage1_iter0_assign_proc : process(src_data_stream_V_empty_n, exitcond_i_reg_600)
    begin
                ap_block_state4_pp0_stage1_iter0 <= ((exitcond_i_reg_600 = ap_const_lv1_0) and (src_data_stream_V_empty_n = ap_const_logic_0));
    end process;


    ap_block_state5_pp0_stage0_iter1_assign_proc : process(dst_data_stream_V_full_n, exitcond_i_reg_600)
    begin
                ap_block_state5_pp0_stage0_iter1 <= ((exitcond_i_reg_600 = ap_const_lv1_0) and (dst_data_stream_V_full_n = ap_const_logic_0));
    end process;


    ap_condition_pp0_exit_iter0_state3_assign_proc : process(exitcond_i_fu_349_p2)
    begin
        if ((exitcond_i_fu_349_p2 = ap_const_lv1_1)) then 
            ap_condition_pp0_exit_iter0_state3 <= ap_const_logic_1;
        else 
            ap_condition_pp0_exit_iter0_state3 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_done_reg, exitcond2_i_fu_294_p2, ap_CS_fsm_state2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (exitcond2_i_fu_294_p2 = ap_const_lv1_1))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_phi_mux_t_V_2_phi_fu_258_p4_assign_proc : process(exitcond_i_reg_600, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0, t_V_2_reg_254, j_V_reg_604)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (exitcond_i_reg_600 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_phi_mux_t_V_2_phi_fu_258_p4 <= j_V_reg_604;
        else 
            ap_phi_mux_t_V_2_phi_fu_258_p4 <= t_V_2_reg_254;
        end if; 
    end process;


    ap_ready_assign_proc : process(exitcond2_i_fu_294_p2, ap_CS_fsm_state2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (exitcond2_i_fu_294_p2 = ap_const_lv1_1))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    bound_x_max_address0 <= tmp_4_i_fu_377_p1(3 - 1 downto 0);

    bound_x_max_ce0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            bound_x_max_ce0 <= ap_const_logic_1;
        else 
            bound_x_max_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    bound_x_min_address0 <= tmp_4_i_fu_377_p1(3 - 1 downto 0);

    bound_x_min_ce0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            bound_x_min_ce0 <= ap_const_logic_1;
        else 
            bound_x_min_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    bound_y_max_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, bound_y_max_empty_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            bound_y_max_blk_n <= bound_y_max_empty_n;
        else 
            bound_y_max_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    bound_y_max_read_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, dst_rows_V_empty_n, dst_cols_V_empty_n, bound_y_min_empty_n, bound_y_max_empty_n, box_num_empty_n)
    begin
        if ((not(((box_num_empty_n = ap_const_logic_0) or (bound_y_max_empty_n = ap_const_logic_0) or (bound_y_min_empty_n = ap_const_logic_0) or (dst_cols_V_empty_n = ap_const_logic_0) or (dst_rows_V_empty_n = ap_const_logic_0) or (ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            bound_y_max_read <= ap_const_logic_1;
        else 
            bound_y_max_read <= ap_const_logic_0;
        end if; 
    end process;


    bound_y_min_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, bound_y_min_empty_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            bound_y_min_blk_n <= bound_y_min_empty_n;
        else 
            bound_y_min_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    bound_y_min_read_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, dst_rows_V_empty_n, dst_cols_V_empty_n, bound_y_min_empty_n, bound_y_max_empty_n, box_num_empty_n)
    begin
        if ((not(((box_num_empty_n = ap_const_logic_0) or (bound_y_max_empty_n = ap_const_logic_0) or (bound_y_min_empty_n = ap_const_logic_0) or (dst_cols_V_empty_n = ap_const_logic_0) or (dst_rows_V_empty_n = ap_const_logic_0) or (ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            bound_y_min_read <= ap_const_logic_1;
        else 
            bound_y_min_read <= ap_const_logic_0;
        end if; 
    end process;


    box_num_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, box_num_empty_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            box_num_blk_n <= box_num_empty_n;
        else 
            box_num_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    box_num_read_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, dst_rows_V_empty_n, dst_cols_V_empty_n, bound_y_min_empty_n, bound_y_max_empty_n, box_num_empty_n)
    begin
        if ((not(((box_num_empty_n = ap_const_logic_0) or (bound_y_max_empty_n = ap_const_logic_0) or (bound_y_min_empty_n = ap_const_logic_0) or (dst_cols_V_empty_n = ap_const_logic_0) or (dst_rows_V_empty_n = ap_const_logic_0) or (ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            box_num_read <= ap_const_logic_1;
        else 
            box_num_read <= ap_const_logic_0;
        end if; 
    end process;

    brmerge1_i_fu_337_p2 <= (rev_fu_320_p2 or rev1_fu_331_p2);
    brmerge2_i_fu_343_p2 <= (tmp_2_i_fu_310_p2 or tmp_1_i_fu_305_p2);
    character_index_5_i_fu_486_p3 <= 
        p_character_index_1_i_reg_615 when (sel_tmp6_fu_466_p2(0) = '1') else 
        sel_tmp1_fu_479_p3;
    character_index_fu_431_p3 <= 
        tmp_15_i_fu_426_p2 when (tmp_14_i_reg_634(0) = '1') else 
        p_character_index_1_i_reg_615;
    d_val_0_1_fu_498_p3 <= 
        tmp_2_reg_639 when (brmerge1_i_reg_590(0) = '1') else 
        ap_const_lv8_C8;
    d_val_0_2_fu_504_p3 <= 
        ap_const_lv8_C8 when (brmerge2_i_reg_595(0) = '1') else 
        tmp_2_reg_639;
    d_val_0_3_fu_510_p3 <= 
        d_val_0_1_fu_498_p3 when (sel_tmp_reg_646(0) = '1') else 
        tmp_2_reg_639;
    d_val_0_4_fu_516_p3 <= 
        d_val_0_2_fu_504_p3 when (sel_tmp3_reg_651(0) = '1') else 
        d_val_0_3_fu_510_p3;

    dst_cols_V_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, dst_cols_V_empty_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            dst_cols_V_blk_n <= dst_cols_V_empty_n;
        else 
            dst_cols_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    dst_cols_V_read_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, dst_rows_V_empty_n, dst_cols_V_empty_n, bound_y_min_empty_n, bound_y_max_empty_n, box_num_empty_n)
    begin
        if ((not(((box_num_empty_n = ap_const_logic_0) or (bound_y_max_empty_n = ap_const_logic_0) or (bound_y_min_empty_n = ap_const_logic_0) or (dst_cols_V_empty_n = ap_const_logic_0) or (dst_rows_V_empty_n = ap_const_logic_0) or (ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            dst_cols_V_read <= ap_const_logic_1;
        else 
            dst_cols_V_read <= ap_const_logic_0;
        end if; 
    end process;


    dst_data_stream_V_blk_n_assign_proc : process(dst_data_stream_V_full_n, exitcond_i_reg_600, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (exitcond_i_reg_600 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            dst_data_stream_V_blk_n <= dst_data_stream_V_full_n;
        else 
            dst_data_stream_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    dst_data_stream_V_din <= 
        d_val_0_1_fu_498_p3 when (sel_tmp6_reg_657(0) = '1') else 
        d_val_0_4_fu_516_p3;

    dst_data_stream_V_write_assign_proc : process(exitcond_i_reg_600, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((exitcond_i_reg_600 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            dst_data_stream_V_write <= ap_const_logic_1;
        else 
            dst_data_stream_V_write <= ap_const_logic_0;
        end if; 
    end process;


    dst_rows_V_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, dst_rows_V_empty_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            dst_rows_V_blk_n <= dst_rows_V_empty_n;
        else 
            dst_rows_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    dst_rows_V_read_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, dst_rows_V_empty_n, dst_cols_V_empty_n, bound_y_min_empty_n, bound_y_max_empty_n, box_num_empty_n)
    begin
        if ((not(((box_num_empty_n = ap_const_logic_0) or (bound_y_max_empty_n = ap_const_logic_0) or (bound_y_min_empty_n = ap_const_logic_0) or (dst_cols_V_empty_n = ap_const_logic_0) or (dst_rows_V_empty_n = ap_const_logic_0) or (ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            dst_rows_V_read <= ap_const_logic_1;
        else 
            dst_rows_V_read <= ap_const_logic_0;
        end if; 
    end process;

    exitcond2_i_fu_294_p2 <= "1" when (t_V_reg_243 = rows_V_reg_554) else "0";
    exitcond_i_fu_349_p2 <= "1" when (ap_phi_mux_t_V_2_phi_fu_258_p4 = cols_V_reg_559) else "0";
    i_V_fu_299_p2 <= std_logic_vector(unsigned(t_V_reg_243) + unsigned(ap_const_lv32_1));
    inBlock_1_i_not_fu_455_p2 <= (inBlock_i_fu_166 xor ap_const_lv1_1);
    inBlock_6_i_fu_531_p2 <= (sel_tmp6_reg_657 or sel_tmp3_reg_651);
    j_V_fu_354_p2 <= std_logic_vector(unsigned(ap_phi_mux_t_V_2_phi_fu_258_p4) + unsigned(ap_const_lv32_1));
    not_i_fu_395_p2 <= (tmp_3_i_reg_609 xor ap_const_lv1_1);
    p_character_index_1_i_fu_369_p3 <= 
        ap_const_lv8_0 when (tmp_3_i_fu_363_p2(0) = '1') else 
        character_index_i_fu_170;
    p_inBlock_1_i_fu_400_p2 <= (not_i_fu_395_p2 and inBlock_i_fu_166);
    rev1_fu_331_p2 <= (ult1_fu_326_p2 xor ap_const_lv1_1);
    rev_fu_320_p2 <= (ult_fu_315_p2 xor ap_const_lv1_1);
    sel_tmp1_fu_479_p3 <= 
        p_character_index_1_i_reg_615 when (sel_tmp3_fu_449_p2(0) = '1') else 
        sel_tmp9_fu_472_p3;
    sel_tmp2_fu_443_p2 <= (tmp_7_i_fu_410_p2 xor ap_const_lv1_1);
    sel_tmp3_fu_449_p2 <= (sel_tmp2_fu_443_p2 and p_inBlock_1_i_fu_400_p2);
    sel_tmp5_fu_461_p2 <= (tmp_3_i_reg_609 or inBlock_1_i_not_fu_455_p2);
    sel_tmp6_fu_466_p2 <= (tmp_12_i_fu_420_p2 and sel_tmp5_fu_461_p2);
    sel_tmp9_fu_472_p3 <= 
        character_index_fu_431_p3 when (sel_tmp_fu_437_p2(0) = '1') else 
        p_character_index_1_i_reg_615;
    sel_tmp_fu_437_p2 <= (tmp_7_i_fu_410_p2 and p_inBlock_1_i_fu_400_p2);

    src_data_stream_V_blk_n_assign_proc : process(src_data_stream_V_empty_n, ap_CS_fsm_pp0_stage1, ap_enable_reg_pp0_iter0, ap_block_pp0_stage1, exitcond_i_reg_600)
    begin
        if (((exitcond_i_reg_600 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            src_data_stream_V_blk_n <= src_data_stream_V_empty_n;
        else 
            src_data_stream_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    src_data_stream_V_read_assign_proc : process(ap_CS_fsm_pp0_stage1, ap_enable_reg_pp0_iter0, exitcond_i_reg_600, ap_block_pp0_stage1_11001)
    begin
        if (((exitcond_i_reg_600 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001))) then 
            src_data_stream_V_read <= ap_const_logic_1;
        else 
            src_data_stream_V_read <= ap_const_logic_0;
        end if; 
    end process;

    tmp_11_i_fu_416_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(bound_x_min_q0),32));
    tmp_12_i_fu_420_p2 <= "1" when (t_V_2_reg_254 = tmp_11_i_fu_416_p1) else "0";
    tmp_13_cast_i_fu_383_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(p_character_index_1_i_fu_369_p3),9));
    tmp_14_i_fu_387_p2 <= "1" when (signed(tmp_13_cast_i_fu_383_p1) < signed(tmp_i_22_reg_576)) else "0";
    tmp_15_i_fu_426_p2 <= std_logic_vector(unsigned(p_character_index_1_i_reg_615) + unsigned(ap_const_lv8_1));
    tmp_1_i_fu_305_p2 <= "1" when (t_V_reg_243 = tmp_i_reg_564) else "0";
    tmp_2_i_fu_310_p2 <= "1" when (t_V_reg_243 = tmp_8_i_reg_570) else "0";
    tmp_3_i_fu_363_p2 <= "1" when (ap_phi_mux_t_V_2_phi_fu_258_p4 = ap_const_lv32_0) else "0";
    tmp_4_i_fu_377_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(p_character_index_1_i_fu_369_p3),64));
    tmp_6_i_fu_406_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(bound_x_max_q0),32));
    tmp_7_i_fu_410_p2 <= "1" when (t_V_2_reg_254 = tmp_6_i_fu_406_p1) else "0";
    tmp_8_i_fu_270_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(bound_y_max_dout),32));
    tmp_9_cast_i_fu_274_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(box_num_dout),9));
    tmp_i_22_fu_278_p2 <= std_logic_vector(unsigned(tmp_9_cast_i_fu_274_p1) + unsigned(ap_const_lv9_1FF));
    tmp_i_fu_266_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(bound_y_min_dout),32));
    ult1_fu_326_p2 <= "1" when (unsigned(t_V_reg_243) < unsigned(tmp_8_i_reg_570)) else "0";
    ult_fu_315_p2 <= "1" when (unsigned(tmp_i_reg_564) < unsigned(t_V_reg_243)) else "0";
end behav;
