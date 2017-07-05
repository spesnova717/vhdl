--half_adder
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity adder_4 is
	port(A,B:in std_logic_vector(3 downto 0);
			S: out std_logic_vector(4 downto 0));
			--CO: out std_logic);
end adder_4;

architecture RTL of adder_4 is
	component half_adder
		port(A,B :in std_logic;
				S,CO: out std_logic);
	end component;

	component full_adder
		port(A,B,CIN :in std_logic;
				S,CO: out std_logic);
	end component;

signal C1,C2,C3:std_logic;
begin

	H1: half_adder port map (A(0),B(0),S(0),C1);
	F1: full_adder port map (A(1),B(1),C1,S(1),C2);
	F2: full_adder port map (A(2),B(2),C2,S(2),C3);
	F3: full_adder port map (A(3),B(3),C3,S(3),S(4));
end RTL;