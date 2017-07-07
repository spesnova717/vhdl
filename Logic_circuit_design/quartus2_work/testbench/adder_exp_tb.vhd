--Testbench for module: adder_exp
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
entity adder_exp_tb is
end adder_exp_tb;
architecture SIM of adder_exp_tb is
    component adder_exp_top
        port(
            CLK, RESET, A, B, EQUAL : in std_logic;
		    LED0,LED1,LED2,LED3 : out std_logic_vector(7 downto 0));
    end component;
 
signal CLK, RESET  : std_logic:= '0';
signal A, B, EQUAL : std_logic:= '0';
signal LED0,LED1,LED2,LED3 : std_logic_vector(7 downto 0);
constant STEP : time := 20 us;
 
begin
U0: adder_exp_top port map(CLK, RESET, A, B, EQUAL, LED0, LED1, LED2, LED3);
process begin
    CLK <= '0'; wait for STEP/2; CLK <= '1'; wait for STEP/2;
end process;

process begin
    B <= '1'; wait for STEP/2;
    B <= '0'; wait for STEP/2;
end process;

process begin
    A <= '1'; wait for STEP*8;
    A <= '0'; wait for STEP*8;
end process;

process begin
    wait for 100 us;
    RESET <= '1'; EQUAL <= '0';
    wait for 550 us; RESET <= '0';
    wait for  50 us; RESET <= '1';
    wait for 900 us; EQUAL <= '1';
    wait for 600 us; EQUAL <= '0';       
    wait for 1060 us;
    assert false severity failure;
    wait;
end process; 

end SIM;
configuration cfg_adder_exp_top_tb of adder_exp_tb is
 for SIM
 end for;
end cfg_adder_exp_top_tb;
