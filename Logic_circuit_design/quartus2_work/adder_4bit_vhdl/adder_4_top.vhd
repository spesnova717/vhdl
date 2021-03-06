--half_adder
library IEEE;
use IEEE.std_logic_1164.all;

entity adder_4_top is
	port(clk,RESET,A,B,EQUAL : in std_logic;
			LED0,LED1,LED2,LED3 : out std_logic_vector(7 downto 0));
end adder_4_top;

architecture RTL of adder_4_top is
	component peripheral_DE0
		port(add_result: in std_logic_vector(4 downto 0);
				clk,reset,a,b,equal : in std_logic;
				a_count,b_count : out std_logic_vector(3 downto 0);
				led0,led1,led2,led3 : out std_logic_vector(7 downto 0));
	end component;
	
	component adder_4
		port(A,B : in std_logic_vector(3 downto 0);
				S : out std_logic_vector(3 downto 0);
				CO : out std_logic);
	end component;
	
	signal a_count_sig: std_logic_vector(3 downto 0);
	signal b_count_sig: std_logic_vector(3 downto 0);
	signal ADD: std_logic_vector(4 downto 0);
	
	begin
	I1: peripheral_DE0
		port map(add_result => ADD, clk => clk, reset => RESET,
					a => A, b => B, equal => EQUAL,
					a_count => a_count_sig, b_count => b_count_sig,
					led0 => LED0, led1 => LED1, led2 => LED2, led3 => LED3);
					
	I2: adder_4 
		port map(A => a_count_sig, B => b_count_sig,
					S => ADD(3 downto 0), CO => ADD(4));
end RTL;