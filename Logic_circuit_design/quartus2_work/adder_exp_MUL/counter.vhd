--4bit Counter
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
entity counter is
	port(
		CLK_in, RST: in std_logic;
		count_out: out std_logic_vector(6 downto 0));
end counter;

architecture RTL of counter is
	signal counter: std_logic_vector(6 downto 0);
	begin
	process ( CLK_in, RST ) begin
		if ( RST = '0' ) then counter <= "0000000";
		elsif ( CLK_in'event and CLK_in = '0') then
			if(counter = "1100011") then
				counter <= "0000000";
			else
				counter <= counter + "0000001";
			end if;
		end if;
	end process;
count_out <= counter(6 downto 0);
end RTL; 