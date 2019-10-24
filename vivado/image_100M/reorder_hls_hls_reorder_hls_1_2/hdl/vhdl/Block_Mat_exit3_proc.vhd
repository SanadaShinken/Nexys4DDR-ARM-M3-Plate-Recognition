-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.2
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Block_Mat_exit3_proc is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    bound_y_min : IN STD_LOGIC_VECTOR (15 downto 0);
    bound_y_min_ap_vld : IN STD_LOGIC;
    bound_y_max : IN STD_LOGIC_VECTOR (15 downto 0);
    bound_y_max_ap_vld : IN STD_LOGIC;
    rows : OUT STD_LOGIC_VECTOR (15 downto 0);
    rows_ap_vld : OUT STD_LOGIC;
    bound_x_max : IN STD_LOGIC_VECTOR (15 downto 0);
    bound_x_max_ap_vld : IN STD_LOGIC;
    bound_x_min : IN STD_LOGIC_VECTOR (15 downto 0);
    bound_x_min_ap_vld : IN STD_LOGIC;
    cols : OUT STD_LOGIC_VECTOR (15 downto 0);
    cols_ap_vld : OUT STD_LOGIC;
    bound_y_min_out_din : OUT STD_LOGIC_VECTOR (15 downto 0);
    bound_y_min_out_full_n : IN STD_LOGIC;
    bound_y_min_out_write : OUT STD_LOGIC;
    bound_x_min_out_din : OUT STD_LOGIC_VECTOR (15 downto 0);
    bound_x_min_out_full_n : IN STD_LOGIC;
    bound_x_min_out_write : OUT STD_LOGIC;
    img_0_rows_V_out_din : OUT STD_LOGIC_VECTOR (15 downto 0);
    img_0_rows_V_out_full_n : IN STD_LOGIC;
    img_0_rows_V_out_write : OUT STD_LOGIC;
    img_0_cols_V_out_din : OUT STD_LOGIC_VECTOR (15 downto 0);
    img_0_cols_V_out_full_n : IN STD_LOGIC;
    img_0_cols_V_out_write : OUT STD_LOGIC );
end;


architecture behav of Block_Mat_exit3_proc is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv16_0 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    constant ap_const_lv16_1 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000001";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal bound_y_min_blk_n : STD_LOGIC;
    signal bound_y_max_blk_n : STD_LOGIC;
    signal bound_x_max_blk_n : STD_LOGIC;
    signal bound_x_min_blk_n : STD_LOGIC;
    signal bound_y_min_out_blk_n : STD_LOGIC;
    signal bound_x_min_out_blk_n : STD_LOGIC;
    signal img_0_rows_V_out_blk_n : STD_LOGIC;
    signal img_0_cols_V_out_blk_n : STD_LOGIC;
    signal ap_block_state1 : BOOLEAN;
    signal img_0_rows_V_fu_160_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal img_0_cols_V_fu_174_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal rows_preg : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    signal cols_preg : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    signal tmp_6_i_fu_154_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_8_i_fu_168_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);


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
                elsif ((not(((ap_start = ap_const_logic_0) or (img_0_cols_V_out_full_n = ap_const_logic_0) or (img_0_rows_V_out_full_n = ap_const_logic_0) or (bound_x_min_out_full_n = ap_const_logic_0) or (bound_y_min_out_full_n = ap_const_logic_0) or (bound_x_min_ap_vld = ap_const_logic_0) or (bound_x_max_ap_vld = ap_const_logic_0) or (bound_y_max_ap_vld = ap_const_logic_0) or (bound_y_min_ap_vld = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    cols_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                cols_preg <= ap_const_lv16_0;
            else
                if ((not(((ap_start = ap_const_logic_0) or (img_0_cols_V_out_full_n = ap_const_logic_0) or (img_0_rows_V_out_full_n = ap_const_logic_0) or (bound_x_min_out_full_n = ap_const_logic_0) or (bound_y_min_out_full_n = ap_const_logic_0) or (bound_x_min_ap_vld = ap_const_logic_0) or (bound_x_max_ap_vld = ap_const_logic_0) or (bound_y_max_ap_vld = ap_const_logic_0) or (bound_y_min_ap_vld = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    cols_preg <= img_0_cols_V_fu_174_p2;
                end if; 
            end if;
        end if;
    end process;


    rows_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                rows_preg <= ap_const_lv16_0;
            else
                if ((not(((ap_start = ap_const_logic_0) or (img_0_cols_V_out_full_n = ap_const_logic_0) or (img_0_rows_V_out_full_n = ap_const_logic_0) or (bound_x_min_out_full_n = ap_const_logic_0) or (bound_y_min_out_full_n = ap_const_logic_0) or (bound_x_min_ap_vld = ap_const_logic_0) or (bound_x_max_ap_vld = ap_const_logic_0) or (bound_y_max_ap_vld = ap_const_logic_0) or (bound_y_min_ap_vld = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    rows_preg <= img_0_rows_V_fu_160_p2;
                end if; 
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, bound_y_min_ap_vld, bound_y_max_ap_vld, bound_x_max_ap_vld, bound_x_min_ap_vld, bound_y_min_out_full_n, bound_x_min_out_full_n, img_0_rows_V_out_full_n, img_0_cols_V_out_full_n)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);

    ap_block_state1_assign_proc : process(ap_start, ap_done_reg, bound_y_min_ap_vld, bound_y_max_ap_vld, bound_x_max_ap_vld, bound_x_min_ap_vld, bound_y_min_out_full_n, bound_x_min_out_full_n, img_0_rows_V_out_full_n, img_0_cols_V_out_full_n)
    begin
                ap_block_state1 <= ((ap_start = ap_const_logic_0) or (img_0_cols_V_out_full_n = ap_const_logic_0) or (img_0_rows_V_out_full_n = ap_const_logic_0) or (bound_x_min_out_full_n = ap_const_logic_0) or (bound_y_min_out_full_n = ap_const_logic_0) or (bound_x_min_ap_vld = ap_const_logic_0) or (bound_x_max_ap_vld = ap_const_logic_0) or (bound_y_max_ap_vld = ap_const_logic_0) or (bound_y_min_ap_vld = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_done_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, bound_y_min_ap_vld, bound_y_max_ap_vld, bound_x_max_ap_vld, bound_x_min_ap_vld, bound_y_min_out_full_n, bound_x_min_out_full_n, img_0_rows_V_out_full_n, img_0_cols_V_out_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (img_0_cols_V_out_full_n = ap_const_logic_0) or (img_0_rows_V_out_full_n = ap_const_logic_0) or (bound_x_min_out_full_n = ap_const_logic_0) or (bound_y_min_out_full_n = ap_const_logic_0) or (bound_x_min_ap_vld = ap_const_logic_0) or (bound_x_max_ap_vld = ap_const_logic_0) or (bound_y_max_ap_vld = ap_const_logic_0) or (bound_y_min_ap_vld = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, bound_y_min_ap_vld, bound_y_max_ap_vld, bound_x_max_ap_vld, bound_x_min_ap_vld, bound_y_min_out_full_n, bound_x_min_out_full_n, img_0_rows_V_out_full_n, img_0_cols_V_out_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (img_0_cols_V_out_full_n = ap_const_logic_0) or (img_0_rows_V_out_full_n = ap_const_logic_0) or (bound_x_min_out_full_n = ap_const_logic_0) or (bound_y_min_out_full_n = ap_const_logic_0) or (bound_x_min_ap_vld = ap_const_logic_0) or (bound_x_max_ap_vld = ap_const_logic_0) or (bound_y_max_ap_vld = ap_const_logic_0) or (bound_y_min_ap_vld = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    bound_x_max_blk_n_assign_proc : process(ap_CS_fsm_state1, bound_x_max_ap_vld)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            bound_x_max_blk_n <= bound_x_max_ap_vld;
        else 
            bound_x_max_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    bound_x_min_blk_n_assign_proc : process(ap_CS_fsm_state1, bound_x_min_ap_vld)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            bound_x_min_blk_n <= bound_x_min_ap_vld;
        else 
            bound_x_min_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    bound_x_min_out_blk_n_assign_proc : process(ap_CS_fsm_state1, bound_x_min_out_full_n)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            bound_x_min_out_blk_n <= bound_x_min_out_full_n;
        else 
            bound_x_min_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    bound_x_min_out_din <= bound_x_min;

    bound_x_min_out_write_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, bound_y_min_ap_vld, bound_y_max_ap_vld, bound_x_max_ap_vld, bound_x_min_ap_vld, bound_y_min_out_full_n, bound_x_min_out_full_n, img_0_rows_V_out_full_n, img_0_cols_V_out_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (img_0_cols_V_out_full_n = ap_const_logic_0) or (img_0_rows_V_out_full_n = ap_const_logic_0) or (bound_x_min_out_full_n = ap_const_logic_0) or (bound_y_min_out_full_n = ap_const_logic_0) or (bound_x_min_ap_vld = ap_const_logic_0) or (bound_x_max_ap_vld = ap_const_logic_0) or (bound_y_max_ap_vld = ap_const_logic_0) or (bound_y_min_ap_vld = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            bound_x_min_out_write <= ap_const_logic_1;
        else 
            bound_x_min_out_write <= ap_const_logic_0;
        end if; 
    end process;


    bound_y_max_blk_n_assign_proc : process(ap_CS_fsm_state1, bound_y_max_ap_vld)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            bound_y_max_blk_n <= bound_y_max_ap_vld;
        else 
            bound_y_max_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    bound_y_min_blk_n_assign_proc : process(ap_CS_fsm_state1, bound_y_min_ap_vld)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            bound_y_min_blk_n <= bound_y_min_ap_vld;
        else 
            bound_y_min_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    bound_y_min_out_blk_n_assign_proc : process(ap_CS_fsm_state1, bound_y_min_out_full_n)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            bound_y_min_out_blk_n <= bound_y_min_out_full_n;
        else 
            bound_y_min_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    bound_y_min_out_din <= bound_y_min;

    bound_y_min_out_write_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, bound_y_min_ap_vld, bound_y_max_ap_vld, bound_x_max_ap_vld, bound_x_min_ap_vld, bound_y_min_out_full_n, bound_x_min_out_full_n, img_0_rows_V_out_full_n, img_0_cols_V_out_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (img_0_cols_V_out_full_n = ap_const_logic_0) or (img_0_rows_V_out_full_n = ap_const_logic_0) or (bound_x_min_out_full_n = ap_const_logic_0) or (bound_y_min_out_full_n = ap_const_logic_0) or (bound_x_min_ap_vld = ap_const_logic_0) or (bound_x_max_ap_vld = ap_const_logic_0) or (bound_y_max_ap_vld = ap_const_logic_0) or (bound_y_min_ap_vld = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            bound_y_min_out_write <= ap_const_logic_1;
        else 
            bound_y_min_out_write <= ap_const_logic_0;
        end if; 
    end process;


    cols_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, bound_y_min_ap_vld, bound_y_max_ap_vld, bound_x_max_ap_vld, bound_x_min_ap_vld, bound_y_min_out_full_n, bound_x_min_out_full_n, img_0_rows_V_out_full_n, img_0_cols_V_out_full_n, img_0_cols_V_fu_174_p2, cols_preg)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (img_0_cols_V_out_full_n = ap_const_logic_0) or (img_0_rows_V_out_full_n = ap_const_logic_0) or (bound_x_min_out_full_n = ap_const_logic_0) or (bound_y_min_out_full_n = ap_const_logic_0) or (bound_x_min_ap_vld = ap_const_logic_0) or (bound_x_max_ap_vld = ap_const_logic_0) or (bound_y_max_ap_vld = ap_const_logic_0) or (bound_y_min_ap_vld = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            cols <= img_0_cols_V_fu_174_p2;
        else 
            cols <= cols_preg;
        end if; 
    end process;


    cols_ap_vld_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, bound_y_min_ap_vld, bound_y_max_ap_vld, bound_x_max_ap_vld, bound_x_min_ap_vld, bound_y_min_out_full_n, bound_x_min_out_full_n, img_0_rows_V_out_full_n, img_0_cols_V_out_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (img_0_cols_V_out_full_n = ap_const_logic_0) or (img_0_rows_V_out_full_n = ap_const_logic_0) or (bound_x_min_out_full_n = ap_const_logic_0) or (bound_y_min_out_full_n = ap_const_logic_0) or (bound_x_min_ap_vld = ap_const_logic_0) or (bound_x_max_ap_vld = ap_const_logic_0) or (bound_y_max_ap_vld = ap_const_logic_0) or (bound_y_min_ap_vld = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            cols_ap_vld <= ap_const_logic_1;
        else 
            cols_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    img_0_cols_V_fu_174_p2 <= std_logic_vector(unsigned(tmp_8_i_fu_168_p2) + unsigned(ap_const_lv16_1));

    img_0_cols_V_out_blk_n_assign_proc : process(ap_CS_fsm_state1, img_0_cols_V_out_full_n)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            img_0_cols_V_out_blk_n <= img_0_cols_V_out_full_n;
        else 
            img_0_cols_V_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    img_0_cols_V_out_din <= std_logic_vector(unsigned(tmp_8_i_fu_168_p2) + unsigned(ap_const_lv16_1));

    img_0_cols_V_out_write_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, bound_y_min_ap_vld, bound_y_max_ap_vld, bound_x_max_ap_vld, bound_x_min_ap_vld, bound_y_min_out_full_n, bound_x_min_out_full_n, img_0_rows_V_out_full_n, img_0_cols_V_out_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (img_0_cols_V_out_full_n = ap_const_logic_0) or (img_0_rows_V_out_full_n = ap_const_logic_0) or (bound_x_min_out_full_n = ap_const_logic_0) or (bound_y_min_out_full_n = ap_const_logic_0) or (bound_x_min_ap_vld = ap_const_logic_0) or (bound_x_max_ap_vld = ap_const_logic_0) or (bound_y_max_ap_vld = ap_const_logic_0) or (bound_y_min_ap_vld = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            img_0_cols_V_out_write <= ap_const_logic_1;
        else 
            img_0_cols_V_out_write <= ap_const_logic_0;
        end if; 
    end process;

    img_0_rows_V_fu_160_p2 <= std_logic_vector(unsigned(tmp_6_i_fu_154_p2) + unsigned(bound_y_max));

    img_0_rows_V_out_blk_n_assign_proc : process(ap_CS_fsm_state1, img_0_rows_V_out_full_n)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            img_0_rows_V_out_blk_n <= img_0_rows_V_out_full_n;
        else 
            img_0_rows_V_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    img_0_rows_V_out_din <= std_logic_vector(unsigned(tmp_6_i_fu_154_p2) + unsigned(bound_y_max));

    img_0_rows_V_out_write_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, bound_y_min_ap_vld, bound_y_max_ap_vld, bound_x_max_ap_vld, bound_x_min_ap_vld, bound_y_min_out_full_n, bound_x_min_out_full_n, img_0_rows_V_out_full_n, img_0_cols_V_out_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (img_0_cols_V_out_full_n = ap_const_logic_0) or (img_0_rows_V_out_full_n = ap_const_logic_0) or (bound_x_min_out_full_n = ap_const_logic_0) or (bound_y_min_out_full_n = ap_const_logic_0) or (bound_x_min_ap_vld = ap_const_logic_0) or (bound_x_max_ap_vld = ap_const_logic_0) or (bound_y_max_ap_vld = ap_const_logic_0) or (bound_y_min_ap_vld = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            img_0_rows_V_out_write <= ap_const_logic_1;
        else 
            img_0_rows_V_out_write <= ap_const_logic_0;
        end if; 
    end process;


    rows_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, bound_y_min_ap_vld, bound_y_max_ap_vld, bound_x_max_ap_vld, bound_x_min_ap_vld, bound_y_min_out_full_n, bound_x_min_out_full_n, img_0_rows_V_out_full_n, img_0_cols_V_out_full_n, img_0_rows_V_fu_160_p2, rows_preg)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (img_0_cols_V_out_full_n = ap_const_logic_0) or (img_0_rows_V_out_full_n = ap_const_logic_0) or (bound_x_min_out_full_n = ap_const_logic_0) or (bound_y_min_out_full_n = ap_const_logic_0) or (bound_x_min_ap_vld = ap_const_logic_0) or (bound_x_max_ap_vld = ap_const_logic_0) or (bound_y_max_ap_vld = ap_const_logic_0) or (bound_y_min_ap_vld = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            rows <= img_0_rows_V_fu_160_p2;
        else 
            rows <= rows_preg;
        end if; 
    end process;


    rows_ap_vld_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, bound_y_min_ap_vld, bound_y_max_ap_vld, bound_x_max_ap_vld, bound_x_min_ap_vld, bound_y_min_out_full_n, bound_x_min_out_full_n, img_0_rows_V_out_full_n, img_0_cols_V_out_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (img_0_cols_V_out_full_n = ap_const_logic_0) or (img_0_rows_V_out_full_n = ap_const_logic_0) or (bound_x_min_out_full_n = ap_const_logic_0) or (bound_y_min_out_full_n = ap_const_logic_0) or (bound_x_min_ap_vld = ap_const_logic_0) or (bound_x_max_ap_vld = ap_const_logic_0) or (bound_y_max_ap_vld = ap_const_logic_0) or (bound_y_min_ap_vld = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            rows_ap_vld <= ap_const_logic_1;
        else 
            rows_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    tmp_6_i_fu_154_p2 <= std_logic_vector(unsigned(ap_const_lv16_1) - unsigned(bound_y_min));
    tmp_8_i_fu_168_p2 <= std_logic_vector(unsigned(bound_x_max) - unsigned(bound_x_min));
end behav;
