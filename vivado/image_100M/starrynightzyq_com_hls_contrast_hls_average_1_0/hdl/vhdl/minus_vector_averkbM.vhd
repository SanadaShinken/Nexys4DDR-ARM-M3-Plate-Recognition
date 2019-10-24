-- ==============================================================
-- File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.2
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ==============================================================

library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity minus_vector_averkbM_rom is 
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


architecture rtl of minus_vector_averkbM_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 10=> "0", 11 to 17=> "1", 18 to 33=> "0", 34 to 49=> "1", 50 to 59=> "0", 60 to 79=> "1", 80 to 86=> "0", 
    87 to 95=> "1", 96 to 99=> "0", 100 to 109=> "1", 110 to 113=> "0", 114 to 121=> "1", 122 to 130=> "0", 131 to 138=> "1", 
    139 to 140=> "0", 141 to 147=> "1", 148 to 159=> "0", 160 to 166=> "1", 167 to 168=> "0", 169 to 175=> "1", 176 to 189=> "0", 
    190 to 195=> "1", 196 => "0", 197 to 202=> "1", 203 to 217=> "0", 218 to 223=> "1", 224 => "0", 225 to 231=> "1", 
    232 to 244=> "0", 245 to 251=> "1", 252 => "0", 253 to 259=> "1", 260 to 271=> "0", 272 to 278=> "1", 279 to 281=> "0", 
    282 to 288=> "1", 289 to 298=> "0", 299 to 306=> "1", 307 to 310=> "0", 311 to 319=> "1", 320 to 324=> "0", 325 to 333=> "1", 
    334 to 339=> "0", 340 to 359=> "1", 360 to 368=> "0", 369 to 387=> "1", 388 to 394=> "0", 395 to 416=> "1", 417 to 421=> "0", 
    422 to 429=> "1", 430 to 437=> "0", 438 to 445=> "1", 446 to 448=> "0", 449 to 455=> "1", 456 to 467=> "0", 468 to 474=> "1", 
    475 => "0", 476 to 482=> "1", 483 to 496=> "0", 497 to 509=> "1", 510 to 525=> "0", 526 to 537=> "1", 538 to 553=> "0", 
    554 to 565=> "1", 566 to 581=> "0", 582 to 593=> "1", 594 to 609=> "0", 610 to 622=> "1", 623 to 635=> "0", 636 to 642=> "1", 
    643 to 644=> "0", 645 to 651=> "1", 652 to 662=> "0", 663 to 670=> "1", 671 to 672=> "0", 673 to 682=> "1", 683 to 687=> "0", 
    688 to 697=> "1", 698 to 702=> "0", 703 to 723=> "1", 724 to 732=> "0", 733 to 749=> "1", 750 to 764=> "0", 765 to 773=> "1", 
    774 to 783=> "0" );

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

entity minus_vector_averkbM is
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

architecture arch of minus_vector_averkbM is
    component minus_vector_averkbM_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    minus_vector_averkbM_rom_U :  component minus_vector_averkbM_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


