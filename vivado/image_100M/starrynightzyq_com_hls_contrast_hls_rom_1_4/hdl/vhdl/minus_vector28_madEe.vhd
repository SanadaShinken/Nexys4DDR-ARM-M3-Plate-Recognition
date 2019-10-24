-- ==============================================================
-- File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.2
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ==============================================================

library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity minus_vector28_madEe_rom is 
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


architecture rtl of minus_vector28_madEe_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 33=> "0", 34 to 48=> "1", 49 to 58=> "0", 59 to 79=> "1", 80 to 84=> "0", 85 to 108=> "1", 109 to 111=> "0", 
    112 to 123=> "1", 124 to 126=> "0", 127 to 137=> "1", 138 to 139=> "0", 140 to 148=> "1", 149 to 158=> "0", 159 to 166=> "1", 
    167 => "0", 168 to 175=> "1", 176 to 186=> "0", 187 to 195=> "1", 196 to 199=> "0", 200 => "1", 201 to 215=> "0", 
    216 to 223=> "1", 224 to 241=> "0", 242 to 251=> "1", 252 to 268=> "0", 269 to 279=> "1", 280 to 295=> "0", 296 to 306=> "1", 
    307 to 322=> "0", 323 to 333=> "1", 334 to 349=> "0", 350 to 360=> "1", 361 to 375=> "0", 376 to 386=> "1", 387 to 402=> "0", 
    403 to 413=> "1", 414 to 428=> "0", 429 to 439=> "1", 440 to 455=> "0", 456 to 466=> "1", 467 to 481=> "0", 482 to 492=> "1", 
    493 to 508=> "0", 509 to 518=> "1", 519 to 535=> "0", 536 to 545=> "1", 546 to 561=> "0", 562 to 572=> "1", 573 to 588=> "0", 
    589 to 599=> "1", 600 to 615=> "0", 616 to 626=> "1", 627 to 643=> "0", 644 to 669=> "1", 670 to 671=> "0", 672 to 727=> "1", 
    728 => "0", 729 to 755=> "1", 756 to 783=> "0" );

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

entity minus_vector28_madEe is
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

architecture arch of minus_vector28_madEe is
    component minus_vector28_madEe_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    minus_vector28_madEe_rom_U :  component minus_vector28_madEe_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


