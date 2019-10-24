-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.2
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity minus_vector30 is
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
    diff_sum : OUT STD_LOGIC_VECTOR (15 downto 0);
    diff_sum_ap_vld : OUT STD_LOGIC );
end;


architecture behav of minus_vector30 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (3 downto 0) := "0010";
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (3 downto 0) := "0100";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (3 downto 0) := "1000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv5_0 : STD_LOGIC_VECTOR (4 downto 0) := "00000";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv16_0 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    constant ap_const_lv5_1C : STD_LOGIC_VECTOR (4 downto 0) := "11100";
    constant ap_const_lv5_1 : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    constant ap_const_lv5_1B : STD_LOGIC_VECTOR (4 downto 0) := "11011";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv16_1 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000001";

    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal mask_4_address0 : STD_LOGIC_VECTOR (9 downto 0);
    signal mask_4_ce0 : STD_LOGIC;
    signal mask_4_q0 : STD_LOGIC_VECTOR (0 downto 0);
    signal src_data_stream_V_blk_n : STD_LOGIC;
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal t_V_1_reg_126 : STD_LOGIC_VECTOR (4 downto 0);
    signal exitcond1_fu_142_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal i_V_fu_148_p2 : STD_LOGIC_VECTOR (4 downto 0);
    signal i_V_reg_292 : STD_LOGIC_VECTOR (4 downto 0);
    signal tmp_6_fu_154_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_6_reg_297 : STD_LOGIC_VECTOR (0 downto 0);
    signal r_V_fu_184_p2 : STD_LOGIC_VECTOR (10 downto 0);
    signal r_V_reg_302 : STD_LOGIC_VECTOR (10 downto 0);
    signal exitcond_fu_190_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal exitcond_reg_307 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state3_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal j_V_fu_196_p2 : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC := '0';
    signal tmp_s_fu_208_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_s_reg_316 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_cond_fu_234_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_cond_reg_326 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_condition_pp0_exit_iter0_state3 : STD_LOGIC;
    signal t_V_reg_114 : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_block_state1 : BOOLEAN;
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal sum_cast_fu_223_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal diff_sum_t_fu_84 : STD_LOGIC_VECTOR (15 downto 0);
    signal diff_sum_t_2_fu_268_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal diff_sum_preg : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal p_shl_fu_160_p3 : STD_LOGIC_VECTOR (9 downto 0);
    signal p_shl2_fu_172_p3 : STD_LOGIC_VECTOR (6 downto 0);
    signal p_shl_cast_fu_168_p1 : STD_LOGIC_VECTOR (10 downto 0);
    signal p_shl2_cast_fu_180_p1 : STD_LOGIC_VECTOR (10 downto 0);
    signal tmp_9_fu_202_p2 : STD_LOGIC_VECTOR (4 downto 0);
    signal tmp_3_cast_fu_214_p1 : STD_LOGIC_VECTOR (10 downto 0);
    signal sum_fu_218_p2 : STD_LOGIC_VECTOR (10 downto 0);
    signal tmp_10_fu_228_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_2_fu_242_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_fu_248_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_7_fu_254_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal diff_sum_t_3_fu_260_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;

    component minus_vector30_mafYi IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (9 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (0 downto 0) );
    end component;



begin
    mask_4_U : component minus_vector30_mafYi
    generic map (
        DataWidth => 1,
        AddressRange => 784,
        AddressWidth => 10)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => mask_4_address0,
        ce0 => mask_4_ce0,
        q0 => mask_4_q0);





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
                elsif (((exitcond1_fu_142_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
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
                if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_logic_1 = ap_condition_pp0_exit_iter0_state3))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
                elsif (((exitcond1_fu_142_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
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
                if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_condition_pp0_exit_iter0_state3))) then 
                    ap_enable_reg_pp0_iter1 <= (ap_const_logic_1 xor ap_condition_pp0_exit_iter0_state3);
                elsif ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                elsif (((exitcond1_fu_142_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    diff_sum_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                diff_sum_preg <= ap_const_lv16_0;
            else
                if (((or_cond_reg_326 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_01001))) then 
                    diff_sum_preg <= diff_sum_t_2_fu_268_p3;
                end if; 
            end if;
        end if;
    end process;


    diff_sum_t_fu_84_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (exitcond_reg_307 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                diff_sum_t_fu_84 <= diff_sum_t_2_fu_268_p3;
            elsif ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                diff_sum_t_fu_84 <= ap_const_lv16_0;
            end if; 
        end if;
    end process;

    t_V_1_reg_126_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (exitcond_fu_190_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                t_V_1_reg_126 <= j_V_fu_196_p2;
            elsif (((exitcond1_fu_142_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                t_V_1_reg_126 <= ap_const_lv5_0;
            end if; 
        end if;
    end process;

    t_V_reg_114_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
                t_V_reg_114 <= i_V_reg_292;
            elsif ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                t_V_reg_114 <= ap_const_lv5_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                exitcond_reg_307 <= exitcond_fu_190_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                i_V_reg_292 <= i_V_fu_148_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (exitcond_fu_190_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                or_cond_reg_326 <= or_cond_fu_234_p2;
                tmp_s_reg_316 <= tmp_s_fu_208_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((exitcond1_fu_142_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    r_V_reg_302(10 downto 2) <= r_V_fu_184_p2(10 downto 2);
                tmp_6_reg_297 <= tmp_6_fu_154_p2;
            end if;
        end if;
    end process;
    r_V_reg_302(1 downto 0) <= "00";

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, exitcond1_fu_142_p2, ap_CS_fsm_state2, exitcond_fu_190_p2, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((exitcond1_fu_142_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_pp0_stage0 => 
                if (not(((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (exitcond_fu_190_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1)))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (exitcond_fu_190_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state5;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state2;
            when others =>  
                ap_NS_fsm <= "XXXX";
        end case;
    end process;
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(2);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state5 <= ap_CS_fsm(3);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(src_data_stream_V_empty_n, ap_enable_reg_pp0_iter1)
    begin
                ap_block_pp0_stage0_01001 <= ((src_data_stream_V_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(src_data_stream_V_empty_n, ap_enable_reg_pp0_iter1)
    begin
                ap_block_pp0_stage0_11001 <= ((src_data_stream_V_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(src_data_stream_V_empty_n, ap_enable_reg_pp0_iter1)
    begin
                ap_block_pp0_stage0_subdone <= ((src_data_stream_V_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1));
    end process;


    ap_block_state1_assign_proc : process(ap_start, ap_done_reg)
    begin
                ap_block_state1 <= ((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;

        ap_block_state3_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state4_pp0_stage0_iter1_assign_proc : process(src_data_stream_V_empty_n)
    begin
                ap_block_state4_pp0_stage0_iter1 <= (src_data_stream_V_empty_n = ap_const_logic_0);
    end process;


    ap_condition_pp0_exit_iter0_state3_assign_proc : process(exitcond_fu_190_p2)
    begin
        if ((exitcond_fu_190_p2 = ap_const_lv1_1)) then 
            ap_condition_pp0_exit_iter0_state3 <= ap_const_logic_1;
        else 
            ap_condition_pp0_exit_iter0_state3 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_done_reg, exitcond1_fu_142_p2, ap_CS_fsm_state2)
    begin
        if (((exitcond1_fu_142_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
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


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter0)
    begin
        if (((ap_enable_reg_pp0_iter0 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(exitcond1_fu_142_p2, ap_CS_fsm_state2)
    begin
        if (((exitcond1_fu_142_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    diff_sum_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, or_cond_reg_326, diff_sum_t_2_fu_268_p3, diff_sum_preg, ap_block_pp0_stage0_01001)
    begin
        if (((or_cond_reg_326 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_01001))) then 
            diff_sum <= diff_sum_t_2_fu_268_p3;
        else 
            diff_sum <= diff_sum_preg;
        end if; 
    end process;


    diff_sum_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, or_cond_reg_326, ap_block_pp0_stage0_01001)
    begin
        if (((or_cond_reg_326 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_01001))) then 
            diff_sum_ap_vld <= ap_const_logic_1;
        else 
            diff_sum_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    diff_sum_t_2_fu_268_p3 <= 
        ap_const_lv16_0 when (tmp_s_reg_316(0) = '1') else 
        diff_sum_t_3_fu_260_p3;
    diff_sum_t_3_fu_260_p3 <= 
        tmp_7_fu_254_p2 when (tmp_fu_248_p2(0) = '1') else 
        diff_sum_t_fu_84;
    exitcond1_fu_142_p2 <= "1" when (t_V_reg_114 = ap_const_lv5_1C) else "0";
    exitcond_fu_190_p2 <= "1" when (t_V_1_reg_126 = ap_const_lv5_1C) else "0";
    i_V_fu_148_p2 <= std_logic_vector(unsigned(t_V_reg_114) + unsigned(ap_const_lv5_1));
    j_V_fu_196_p2 <= std_logic_vector(unsigned(t_V_1_reg_126) + unsigned(ap_const_lv5_1));
    mask_4_address0 <= sum_cast_fu_223_p1(10 - 1 downto 0);

    mask_4_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001, ap_enable_reg_pp0_iter0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            mask_4_ce0 <= ap_const_logic_1;
        else 
            mask_4_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    or_cond_fu_234_p2 <= (tmp_6_reg_297 and tmp_10_fu_228_p2);
    p_shl2_cast_fu_180_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(p_shl2_fu_172_p3),11));
    p_shl2_fu_172_p3 <= (t_V_reg_114 & ap_const_lv2_0);
    p_shl_cast_fu_168_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(p_shl_fu_160_p3),11));
    p_shl_fu_160_p3 <= (t_V_reg_114 & ap_const_lv5_0);
    r_V_fu_184_p2 <= std_logic_vector(unsigned(p_shl_cast_fu_168_p1) - unsigned(p_shl2_cast_fu_180_p1));

    src_data_stream_V_blk_n_assign_proc : process(src_data_stream_V_empty_n, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            src_data_stream_V_blk_n <= src_data_stream_V_empty_n;
        else 
            src_data_stream_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    src_data_stream_V_read_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            src_data_stream_V_read <= ap_const_logic_1;
        else 
            src_data_stream_V_read <= ap_const_logic_0;
        end if; 
    end process;

        sum_cast_fu_223_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(sum_fu_218_p2),64));

    sum_fu_218_p2 <= std_logic_vector(unsigned(r_V_reg_302) + unsigned(tmp_3_cast_fu_214_p1));
    tmp_10_fu_228_p2 <= "1" when (t_V_1_reg_126 = ap_const_lv5_1B) else "0";
    tmp_2_fu_242_p2 <= "0" when (src_data_stream_V_dout = ap_const_lv8_0) else "1";
    tmp_3_cast_fu_214_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(t_V_1_reg_126),11));
    tmp_6_fu_154_p2 <= "1" when (t_V_reg_114 = ap_const_lv5_1B) else "0";
    tmp_7_fu_254_p2 <= std_logic_vector(unsigned(diff_sum_t_fu_84) + unsigned(ap_const_lv16_1));
    tmp_9_fu_202_p2 <= (t_V_reg_114 or t_V_1_reg_126);
    tmp_fu_248_p2 <= (tmp_2_fu_242_p2 xor mask_4_q0);
    tmp_s_fu_208_p2 <= "1" when (tmp_9_fu_202_p2 = ap_const_lv5_0) else "0";
end behav;
