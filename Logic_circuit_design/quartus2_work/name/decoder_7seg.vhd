-- Decoder "ascii code" to "7segLED code (anode common)"
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity decoder_7seg is
port (ascii : in std_logic_vector(6 downto 0);
		seg : out std_logic_vector(7 downto 0));

end decoder_7seg;

architecture RTL of decoder_7seg is
begin
	process(ascii)
		begin case ascii is
	when "0110000" => seg <="00000011";--0
	when "0110001" => seg <="10011111";--1
	when "0110010" => seg <="00100101";--2
	when "0110011" => seg <="00001101";--3
	when "0110100" => seg <="10011001";--4
	when "0110101" => seg <="01001001";--5
	when "0110110" => seg <="01000001";--6
	when "0110111" => seg <="00011111";--7
	when "0111000" => seg <="00000001";--8
	when "0111001" => seg <="00001001";--9
	
	when "1000001" => seg <="00010001";--A
	when "1000010" => seg <="11000001";--b
	when "1000011" => seg <="01100011";--c
	when "1000100" => seg <="10000101";--d
	when "1000101" => seg <="01100001";--e
	when "1000110" => seg <="01110001";--f
	when "1000111" => seg <="01000011";--g
	when "1001000" => seg <="10010001";--h
	when "1001001" => seg <="11110011";--i
	when "1001010" => seg <="10000111";--j
	when "1001011" => seg <="01010001";--k
	when "1001100" => seg <="11100011";--l
	when "1001101" => seg <="01010101";--m
	when "1001110" => seg <="11010101";--n
	when "1001111" => seg <="11000101";--o
	when "1010000" => seg <="00110001";--p
	when "1010001" => seg <="00011001";--q
	when "1010010" => seg <="11110101";--r
	when "1010011" => seg <="01001001";--s
	when "1010100" => seg <="11100001";--t
	when "1010101" => seg <="10000011";--u
	when "1010110" => seg <="10110001";--v
	when "1010111" => seg <="10000001";--w
	when "1011000" => seg <="10010011";--x
	when "1011001" => seg <="10011001";--y
	when "1011010" => seg <="01101101";--z
	when "1011111" => seg <="11101111";--_
	when "0100000" => seg <="11111111";
	when others => seg <="11111111";--others
	
	end case;















end process;
end RTL;