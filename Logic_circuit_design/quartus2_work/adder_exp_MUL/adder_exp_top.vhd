library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity adder_exp_top is
	port(
		CLK, RESET, A, B, EQUAL : in std_logic;
		LED0,LED1,LED2,LED3 : out std_logic_vector(7 downto 0));
end adder_exp_top;
architecture RTL of adder_exp_top is
	component chattering
	port(
		clk, SW_in : in std_logic;
		SW_out     : out std_logic);
	end component;
	
	component counter
	port(
		CLK_in, RST: in std_logic;
		count_out: out std_logic_vector(6 downto 0));
	end component;	
	
	component adder_7
	port(
		A,B : in std_logic_vector(6 downto 0);
			S: out std_logic_vector(13 downto 0));
	end component;
	
	component Binary2bcd
	port(
		bin_in : in std_logic_vector(13 downto 0);
		bcd1 : out std_logic_vector(3 downto 0);
		bcd2 : out std_logic_vector(3 downto 0);
		bcd3 : out std_logic_vector(3 downto 0);
		bcd4 : out std_logic_vector(3 downto 0));
	end component;
	
	component selector
	port(
		clk, equal: in std_logic;
		A_bcd1 : in std_logic_vector(3 downto 0);
		A_bcd2 : in std_logic_vector(3 downto 0);
		B_bcd1 : in std_logic_vector(3 downto 0);
		B_bcd2 : in std_logic_vector(3 downto 0);
		ADD_bcd1 : in std_logic_vector(3 downto 0);
		ADD_bcd2 : in std_logic_vector(3 downto 0);
		ADD_bcd3 : in std_logic_vector(3 downto 0);
		ADD_bcd4 : in std_logic_vector(3 downto 0);
		bcd0 : out std_logic_vector(3 downto 0);
		bcd1 : out std_logic_vector(3 downto 0);
		bcd2 : out std_logic_vector(3 downto 0);
		bcd3 : out std_logic_vector(3 downto 0));
	end component;
	
	component BCD_7segLED
	port(
		BCD_in : in std_logic_vector(3 downto 0);
		seg : out std_logic_vector(7 downto 0));
	end  component;
	
	signal chat_RST, chat_A, chat_B, chat_EQUAL : std_logic;
	signal A_4bit, B_4bit : std_logic_vector(6 downto 0);
	signal S_sig : std_logic_vector(13 downto 0);
	signal abcd1, abcd2, bbcd1, bbcd2, cbcd1, cbcd2, cbcd3, cbcd4 : std_logic_vector(3 downto 0);
	signal bcd0_sig, bcd1_sig, bcd2_sig, bcd3_sig : std_logic_vector(3 downto 0); 
begin

	CHATTER_RST : chattering port map(
						clk => CLK,
						SW_in => RESET,
						SW_out => chat_RST);
		
	CHATTER_A : chattering port map(
						clk => CLK,
						SW_in => A,
						SW_out => chat_A);

	CHATTER_B : chattering port map(
						clk => CLK,
						SW_in => B,
						SW_out => chat_B);
						
	CHATTER_EQUAL : chattering port map(
						clk => CLK,
						SW_in => EQUAL,
						SW_out => chat_EQUAL);						
			
	COUNTER_A : counter port map(
						CLK_in => chat_A,
						RST => chat_RST,
						count_out => A_4bit);
						
	COUNTER_B : counter port map(
						CLK_in => chat_B,
						RST => chat_RST,
						count_out => B_4bit);
						
	ADDER1 : adder_7 port map(
						A => A_4bit,
						B => B_4bit,
						S => S_sig);
						
	BCD_1 : Binary2bcd port map(
						bin_in(0) => A_4bit(0),
						bin_in(1) => A_4bit(1),
						bin_in(2) => A_4bit(2),
						bin_in(3) => A_4bit(3),
						bin_in(4) => A_4bit(4),
						bin_in(5) => A_4bit(5),
						bin_in(6) => A_4bit(6),
						bcd1 => abcd1,
						bcd2 => abcd2);

	BCD_2 : Binary2bcd port map(
						bin_in(0) => B_4bit(0),
						bin_in(1) => B_4bit(1),
						bin_in(2) => B_4bit(2),
						bin_in(3) => B_4bit(3),
						bin_in(4) => B_4bit(4),
						bin_in(5) => B_4bit(5),
						bin_in(6) => B_4bit(6),
						bcd1 => bbcd1,
						bcd2 => bbcd2);

	BCD_3 : Binary2bcd port map(
						bin_in => S_sig,
						bcd1 => cbcd1,
						bcd2 => cbcd2,
						bcd3 => cbcd3,
						bcd4 => cbcd4);			
			
	SELECTOR_1 : selector port map(
						clk => CLK,
						equal => chat_EQUAL,
						A_bcd1 => abcd1,
						A_bcd2 => abcd2,
						B_bcd1 => bbcd1,
						B_bcd2 => bbcd2,
						ADD_bcd1 => cbcd1,
						ADD_bcd2 => cbcd2,
						ADD_bcd3 => cbcd3,
						ADD_bcd4 => cbcd4,
						bcd0 => bcd0_sig,
						bcd1 => bcd1_sig,
						bcd2 => bcd2_sig,
						bcd3 => bcd3_sig);
	
	BCD_7segLED1 : bcd_7segLED port map(
						BCD_in => bcd0_sig,
						seg => LED0);
						
	BCD_7segLED2 : bcd_7segLED port map(
						BCD_in => bcd1_sig,
						seg => LED1);		
						
	BCD_7segLED3 : bcd_7segLED port map(
						BCD_in => bcd2_sig,
						seg => LED2);		
						
	BCD_7segLED4 : bcd_7segLED port map(
						BCD_in => bcd3_sig,
						seg => LED3);			
end RTL;