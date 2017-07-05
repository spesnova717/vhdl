--one_min_clock_top
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity one_min_clock_top is
	port(CLK,RESET: in std_logic;
		LED0, LED1, LED2, LED3 : out std_logic_vector(7 downto 0));
end one_min_clock_top;

architecture RTL of one_min_clock_top is
	component div_10ms
		port(CLK : in std_logic;
				CLK_DIV : out std_logic);
	end component;

	component cnt10_test
		port(clk, reset : in std_logic;
				up_sig : out std_logic;
				bcd		: out std_logic_vector(3 downto 0));
	end component;

	component cnt6
		port(clk_sig, reset : in std_logic;
				--up_sig : out std_logic;
				bcd		: out std_logic_vector(3 downto 0));
	end component;

	component chattering
		port ( clk, SW_in : in std_logic;
         SW_out     : out std_logic );
	end component;
	
	component BCD_7segLED
		port(	BCD_in : in std_logic_vector(3 downto 0);
			seg : out std_logic_vector(7 downto 0));
	end component;
	
	component BCD_7segLED_dot
		port( BCD_in : in std_logic_vector(3 downto 0);
			seg : out std_logic_vector(7 downto 0));
	end component;
	
	
	signal clk_10ms : std_logic;
	signal chat_rst : std_logic;
	signal bcd0_sig : std_logic_vector(3 downto 0);
	signal bcd1_sig : std_logic_vector(3 downto 0);
	signal bcd2_sig : std_logic_vector(3 downto 0);
	signal bcd3_sig : std_logic_vector(3 downto 0);
	signal clk_100ms : std_logic;
	signal clk_1s : std_logic;
	signal clk_10s : std_logic;
	
	
	begin
	
	A1 : div_10ms port map(CLK, clk_10ms);
	A2 : chattering port map(CLK, RESET, chat_rst);
	A3 : cnt10_test port map(clk_10ms, chat_rst, clk_100ms, bcd0_sig);
	A4 : cnt10_test port map(clk_100ms, chat_rst, clk_1s, bcd1_sig);
	A5 : cnt10_test port map(clk_1s, chat_rst, clk_10s, bcd2_sig);
	A6 : cnt6 port map(clk_10s, chat_rst, bcd3_sig);
	A7 : BCD_7segLED port map(bcd0_sig, LED0);
	A8 : BCD_7segLED port map(bcd1_sig, LED1);
	A9 : BCD_7segLED_dot port map(bcd2_sig, LED2);
	A10 : BCD_7segLED port map(bcd3_sig, LED3);
	
	
	end RTL;