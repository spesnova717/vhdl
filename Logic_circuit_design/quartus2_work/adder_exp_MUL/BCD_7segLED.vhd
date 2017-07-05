 --BCD_7segLED
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity BCD_7segLED is port(
	BCD_in : in std_logic_vector(3 downto 0);
	seg : out std_logic_vector(7 downto 0));
end BCD_7segLED;
architecture RTL of BCD_7segLED is
begin
process(BCD_in) begin
	case BCD_in is
		when "0000" => seg <= "00000011"; -- 0
		when "0001" => seg <= "10011111"; -- 1
		when "0010" => seg <= "00100101"; -- 2
		when "0011" => seg <= "00001101"; -- 3
		when "0100" => seg <= "10011001"; -- 4
		when "0101" => seg <= "01001001"; -- 5
		when "0110" => seg <= "01000001"; -- 6
		when "0111" => seg <= "00011111"; -- 7
		when "1000" => seg <= "00000001"; -- 8
		when "1001" => seg <= "00001001"; -- 9
		when "1010" => seg <= "11111110"; -- .(dot)
		when "1011" => seg <= "11101101"; -- ==
		when others => seg <= "11111111";
	end case;
end process;
end RTL;