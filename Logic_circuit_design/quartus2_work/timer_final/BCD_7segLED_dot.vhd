 --BCD_7segLED
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity BCD_7segLED_dot is port(
	BCD_in : in std_logic_vector(3 downto 0);
	seg : out std_logic_vector(7 downto 0));
end BCD_7segLED_dot;
architecture RTL of BCD_7segLED_dot is
begin
process(BCD_in) begin
	case BCD_in is
		when "0000" => seg <= "00000010"; -- 0
		when "0001" => seg <= "10011110"; -- 1
		when "0010" => seg <= "00100100"; -- 2
		when "0011" => seg <= "00001100"; -- 3
		when "0100" => seg <= "10011000"; -- 4
		when "0101" => seg <= "01001000"; -- 5
		when "0110" => seg <= "01000000"; -- 6
		when "0111" => seg <= "00011110"; -- 7
		when "1000" => seg <= "00000000"; -- 8
		when "1001" => seg <= "00001000"; -- 9
		--when "1111" => seg <= "11111110"; -- .(dot)
		when others => seg <= "11111111";
	end case;
end process;
end RTL;