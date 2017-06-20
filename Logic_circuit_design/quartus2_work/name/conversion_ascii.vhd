-- Module: conversion_ascii for moji_deco
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity conversion_ascii is port(
 order :	in std_logic_vector(4 downto 0);
 ascii : out std_logic_vector(6 downto 0));
end conversion_ascii;

architecture RTL of conversion_ascii is
begin
 process (order) begin
 case order is
 
 when "00000" => ascii <= "0110000"; -- 0
 when "00001" => ascii <= "0110001"; -- 1
 when "00010" => ascii <= "0110010"; -- 2
 when "00011" => ascii <= "0110011"; -- 3
 when "00100" => ascii <= "0110100"; -- 4
 when "00101" => ascii <= "0110101"; -- 5
 when "00110" => ascii <= "0110110"; -- 6
 when "00111" => ascii <= "0110111"; -- 7
 when "01000" => ascii <= "0111000"; -- 8
 when "01001" => ascii <= "0111001"; -- 9
 when "01111" => ascii <= "0101110"; -- .(dot)
 when others => ascii <= "1111111";
 end case;
 end process;
end RTL; 