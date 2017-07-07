--Testbench for module: moji_deco_top
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
entity cnt_top_tb is
end cnt_top_tb;
architecture SIM of cnt_top_tb is
 component cnt_top port(clk, reset : in std_logic;
								        bcd : out std_logic_vector(3 downto 0);
								        clk_100hz : out std_logic);
 end component;
 signal clk : std_logic := '1';
 signal reset : std_logic:='1';
 signal bcd : std_logic_vector(3 downto 0);
 signal clk_100hz : std_logic;
 constant STEP: time :=20 ns;

begin
 U0: cnt_top port map(clk, reset, bcd, clk_100hz);
 process begin
   clk <= '0'; wait for STEP/2; clk <= '1'; wait for STEP/2;
 end process;
  
 process begin
   
	wait for 3215 ns; reset <= '0';
	wait for 2.0 us; 	reset <= '1';
	wait for 500 us;
	assert false severity failure;
	wait;

 end process;
end SIM;
configuration cfg_cnt_top_tb of cnt_top_tb is
 for SIM
 end for;
end cfg_cnt_top_tb;