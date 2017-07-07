--Testbench for module: moji_deco_top
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
entity moji_deco_top_tb is
end moji_deco_top_tb;
architecture SIM of moji_deco_top_tb is
 component moji_deco_top port( CLK, RESET, STOP: in std_logic;
 LED0,LED1,LED2,LED3 : out std_logic_vector (7 downto 0));
 end component;
 signal CLK: std_logic := '0' ;
 signal STOP, RESET: std_logic := '1' ;
 signal LED0, LED1, LED2, LED3 : std_logic_vector (7 downto 0);
 constant STEP: time := 20 ns ;
begin
 U0: moji_deco_top port map(clk, reset, stop, LED0, LED1, LED2, LED3 );
 process begin
 clk <= '0'; wait for STEP/2; clk <= '1'; wait for STEP/2;
 end process;
 process begin
 wait for 10.3 us ; RESET <= '0'; wait for 4.5 us ; RESET <= '1';
 wait for 30.7 us ; STOP <= '0'; wait for 2.0 us ; STOP <= '1';
wait for 8.2 us ; STOP <= '0'; wait for 3.8 us ; STOP <= '1';
 wait for 20.5 us ;
 assert false severity failure;
 end process;
end SIM;
configuration cfg_moji_deco_top_tb of moji_deco_top_tb is
 for SIM
 end for;
end cfg_moji_deco_top_tb;