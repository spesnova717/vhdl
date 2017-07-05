--100Hz
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity div_10ms is
	port(CLK : in std_logic;
		CLK_DIV : out std_logic);
end div_10ms;

architecture RTL of div_10ms is
	signal counter : integer range 0 to 500000 :=1;
	signal clk_sig : std_logic :='1';
	
	begin
		process(clk) 
			begin
				if (clk'event and clk='1') then
					if (counter >= 250000) then
						clk_sig <= not clk_sig;
						counter <= 1;
					else counter <= counter + 1;
				end if;
			end if;
 end process;
	clk_div <= clk_sig;
end RTL;