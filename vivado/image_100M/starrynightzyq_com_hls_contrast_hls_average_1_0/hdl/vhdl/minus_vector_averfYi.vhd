-- ==============================================================
-- File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.2
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ==============================================================

library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity minus_vector_averfYi_rom is 
    generic(
             DWIDTH     : integer := 1; 
             AWIDTH     : integer := 10; 
             MEM_SIZE    : integer := 784
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of minus_vector_averfYi_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 28=> "0", 29 to 52=> "1", 53 to 55=> "0", 56 to 82=> "1", 83 => "0", 84 to 110=> "1", 111 to 114=> "0", 
    115 to 138=> "1", 139 to 153=> "0", 154 to 165=> "1", 166 to 180=> "0", 181 to 192=> "1", 193 to 205=> "0", 206 to 218=> "1", 
    219 to 232=> "0", 233 to 244=> "1", 245 to 259=> "0", 260 to 271=> "1", 272 to 285=> "0", 286 to 299=> "1", 300 to 313=> "0", 
    314 to 329=> "1", 330 to 341=> "0", 342 to 358=> "1", 359 to 372=> "0", 373 to 388=> "1", 389 to 408=> "0", 409 to 417=> "1", 
    418 to 437=> "0", 438 to 447=> "1", 448 to 465=> "0", 466 to 475=> "1", 476 to 494=> "0", 495 to 503=> "1", 504 to 521=> "0", 
    522 to 537=> "1", 538 to 549=> "0", 550 to 566=> "1", 567 to 577=> "0", 578 to 586=> "1", 587 => "0", 588 to 595=> "1", 
    596 to 604=> "0", 605 to 613=> "1", 614 to 615=> "0", 616 to 627=> "1", 628 => "0", 629 to 641=> "1", 642 to 644=> "0", 
    645 to 668=> "1", 669 to 675=> "0", 676 to 695=> "1", 696 to 704=> "0", 705 to 721=> "1", 722 to 734=> "0", 735 to 737=> "1", 
    738 to 741=> "0", 742 to 745=> "1", 746 to 783=> "0" );

attribute syn_rom_style : string;
attribute syn_rom_style of mem : signal is "block_rom";
attribute ROM_STYLE : string;
attribute ROM_STYLE of mem : signal is "block";

begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;


Library IEEE;
use IEEE.std_logic_1164.all;

entity minus_vector_averfYi is
    generic (
        DataWidth : INTEGER := 1;
        AddressRange : INTEGER := 784;
        AddressWidth : INTEGER := 10);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of minus_vector_averfYi is
    component minus_vector_averfYi_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    minus_vector_averfYi_rom_U :  component minus_vector_averfYi_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


