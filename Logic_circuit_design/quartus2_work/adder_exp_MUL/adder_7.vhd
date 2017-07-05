--MUL
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity adder_7 is
	port(A,B:in std_logic_vector(6 downto 0);
			S: out std_logic_vector(13 downto 0));
end adder_7;
--10011001001001
architecture RTL of adder_7 is

signal MUL : std_logic_vector(13 downto 0);
begin
	
	MUL <= A * B;
	S <= MUL;

end RTL;