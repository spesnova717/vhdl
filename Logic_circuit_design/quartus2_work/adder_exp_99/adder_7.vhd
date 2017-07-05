--half_adder
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity adder_7 is
	port(A,B:in std_logic_vector(6 downto 0);
			S: out std_logic_vector(7 downto 0));
			--CO: out std_logic);
end adder_7;

architecture RTL of adder_7 is
	component half_adder
		port(A,B :in std_logic;
				S,CO: out std_logic);
	end component;

	component full_adder
		port(A,B,CIN :in std_logic;
				S,CO: out std_logic);
	end component;

signal C1,C2,C3,C4,C5,C6:std_logic;
begin

	H1: half_adder port map (A(0),B(0),S(0),C1);
	F1: full_adder port map (A(1),B(1),C1,S(1),C2);
	F2: full_adder port map (A(2),B(2),C2,S(2),C3);
	--F3: full_adder port map (A(3),B(3),C3,S(3),S(4));
	F3: full_adder port map (A(3),B(3),C3,S(3),C4);
	F4: full_adder port map (A(4),B(4),C4,S(4),C5);
	F5: full_adder port map (A(5),B(5),C5,S(5),C6);
	F6: full_adder port map (A(6),B(6),C6,S(6),S(7));
end RTL;