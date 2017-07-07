--Testbench for module: moji_deco_top
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
entity div_tb is
end div_tb;
architecture SIM of div_tb is
 component BCD_7segLED port(
	BCD_in : in std_logic_vector(3 downto 0);
	seg : out std_logic_vector(7 downto 0)); 
 end component;
 
 signal BCD_in: std_logic_vector(3 downto 0) := "0000";
 signal seg: std_logic_vector(7 downto 0);
 constant STEP : time := 20 us;
 
begin
 U0: BCD_7segLED port map(BCD_in, seg);
 process begin
   
   for I in 0 to 15 loop
     BCD_in <= BCD_in + '1'; wait for STEP*16;
  end loop;
  assert false severity failure;
	wait;

 end process;
end SIM;
configuration cfg_div_tb of div_tb is
 for SIM
 end for;
end cfg_div_tb;