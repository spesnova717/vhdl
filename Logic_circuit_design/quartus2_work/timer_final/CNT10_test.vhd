--CNT10
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity cnt10_test is
		port(clk, reset : in std_logic;
				up_sig : out std_logic;
				bcd		: out std_logic_vector(3 downto 0));
end cnt10_test;

architecture RTL of cnt10_test is
signal bcd_signal : std_logic_vector(3 downto 0);
signal up_signal : std_logic :='0';
begin
	process(clk, reset) begin
		if(reset = '0') then
			bcd_signal <= "0000";
			up_signal <= '0';
		elsif(clk' event and clk = '1') then
			if(bcd_signal = "1001") then
				up_signal <= '1';
				bcd_signal <= "0000";
			else
				bcd_signal <= bcd_signal + '1';
				up_signal <= '0';
			end if;
		end if;
	end process;
	
	bcd <= bcd_signal;
	up_sig <= up_signal;
end RTL;
