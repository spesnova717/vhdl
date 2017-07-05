library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity decoder is
port( led : in  std_logic_vector(4 downto 0);
	   seg : out std_logic_vector(7 downto 0));
end decoder;

architecture RTL of decoder is
begin  
process(led)
  begin case led is
		when "00000" => seg <="00000011"; -- 0
		when "00001" => seg <="10011111"; -- 1
		when "00010" => seg <="00100101"; -- 2
		when "00011" => seg <="00001101"; -- 3
		when "00100" => seg <="10011001"; -- 4
		when "00101" => seg <="01001001"; -- 5
		when "00110" => seg <="01000001"; -- 6
		when "00111" => seg <="00011011"; -- 7
		when "01000" => seg <="00000001"; -- 8
		when "01001" => seg <="00001001"; -- 9
		when "01010" => seg <="00010001"; -- A
		when "01011" => seg <="11000001"; -- B
		when "01100" => seg <="01100011"; -- C
		when "01101" => seg <="10000101"; -- D
		when "01110" => seg <="01100001"; -- E  
		when "01111" => seg <="01110001"; -- F
		when "11101" => seg <="11101101"; -- =(equal)
		when others  => seg <="11111111";
	end case;		
end process;
end RTL;
