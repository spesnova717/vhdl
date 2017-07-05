library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity selector is
	port(
		clk, equal: in std_logic;
		A_bcd1 : in std_logic_vector(3 downto 0);
		A_bcd2 : in std_logic_vector(3 downto 0);
		B_bcd1 : in std_logic_vector(3 downto 0);
		B_bcd2 : in std_logic_vector(3 downto 0);
		ADD_bcd1 : in std_logic_vector(3 downto 0);
		ADD_bcd2 : in std_logic_vector(3 downto 0);
		bcd0 : out std_logic_vector(3 downto 0);
		bcd1 : out std_logic_vector(3 downto 0);
		bcd2 : out std_logic_vector(3 downto 0);
		bcd3 : out std_logic_vector(3 downto 0));
	end selector;

architecture RTL of selector is
begin
process(clk)
  begin case equal is			
	  when '0' =>    	bcd0 <= A_bcd1(3 downto 0);
							bcd1 <= A_bcd2(3 downto 0);
							bcd2 <= B_bcd1(3 downto 0);
							bcd3 <= B_bcd2(3 downto 0);
		when '1' =>    bcd0 <= ADD_bcd1(3 downto 0);
		               bcd1 <= ADD_bcd2(3 downto 0);
		               bcd2 <= "1011";
		               bcd3 <= "1011";
    when others => 	bcd0 <= "1111";
		               bcd1 <= "1111";
		               bcd2 <= "1111";
		               bcd3 <= "1111";
    end case;
end process;
end RTL;