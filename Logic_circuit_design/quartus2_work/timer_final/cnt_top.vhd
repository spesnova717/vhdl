--div_top
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity cnt_top is
	port(clk, reset : in std_logic;
		  bcd		: out std_logic_vector(3 downto 0);
		  clk_100hz : out std_logic);
end cnt_top;

architecture RTL of cnt_top is
	component div_10ms
		port(CLK : in std_logic;
				CLK_DIV : out std_logic);
	end component;

	component cnt10_test
		port(clk, reset : in std_logic;
				up_sig : out std_logic;
				bcd		: out std_logic_vector(3 downto 0));
	end component;
	
	signal clk_10mss : std_logic;
	
	begin
	A1: div_10ms port map (clk, clk_10mss);
	A2: cnt10_test port map (clk_10mss, reset, clk_100hz, bcd);
	
end RTL;