--CNT10
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity cnt6 is
	port(clk_sig, reset : in std_logic;
		  --up_sig : out std_logic;
		  bcd		: out std_logic_vector(3 downto 0));
end cnt6;

architecture RTL of cnt6 is
signal bcd_signal : std_logic_vector(3 downto 0);
--signal up_signal : std_logic :='1';
begin
	process(clk_sig, reset) begin
		if(reset = '0') then
			bcd_signal <= "0000";
		elsif(clk_sig' event and clk_sig = '1') then
			if(bcd_signal = "0101") then
				--up_signal <= not up_signal;
				bcd_signal <= "0000";
			else
				bcd_signal <= bcd_signal + '1';
			end if;
		end if;
	end process;
	
	bcd <= bcd_signal;
	--up_sig <= up_signal;
end RTL;
