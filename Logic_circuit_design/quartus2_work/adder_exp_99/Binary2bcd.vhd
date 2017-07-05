library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity Binary2bcd is
 port( bin_in : in std_logic_vector(7 downto 0);
 bcd1 : out std_logic_vector(3 downto 0);
 bcd2 : out std_logic_vector(3 downto 0);
 bcd3 : out std_logic_vector(3 downto 0));
end Binary2bcd ;
architecture RTL of Binary2bcd is
 signal N_in,N1,N2,N3: integer range 0 to 1000;
begin
 N_in <= CONV_INTEGER(bin_in);
 N3 <= N_in / 100 - ((N_in / 100) / 10) * 10;
 N2 <= N_in / 10 - ((N_in / 10) / 10)*10;
 N1 <= N_in - (N_in / 10) * 10;
 
 bcd1 <= CONV_std_logic_vector( N1, 4);
 bcd2 <= CONV_std_logic_vector( N2, 4);
 bcd3 <= CONV_std_logic_vector( N3, 4);
end RTL;