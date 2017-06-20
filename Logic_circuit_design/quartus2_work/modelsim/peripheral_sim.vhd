library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity peripheral_sim is
	port(add_result: in std_logic_vector(4 downto 0);
	     clk, reset, a, b, equal: in  std_logic;
	     a_count, b_count:        out std_logic_vector(3 downto 0);
	     led0, led1, led2, led3:  out std_logic_vector(7 downto 0));
end peripheral_sim;

architecture RTL of peripheral_sim is
component counter
  port(clk, reset: in  std_logic;
       count_in:   in  std_logic;
	     count_out : out std_logic_vector(3 downto 0));
end component;

component selector
	port(clk, reset, equal: in std_logic;
	     a_count, b_count:  in std_logic_vector(3 downto 0);
		   add_result:        in std_logic_vector(4 downto 0);
		   led0_en, led1_en: out std_logic_vector(4 downto 0);
		   led2_en, led3_en: out std_logic_vector(4 downto 0));
end component;

component decoder
  port(led:  in std_logic_vector(4 downto 0);
	     seg: out std_logic_vector(7 downto 0));
end component;

signal a_count_out, b_count_out: std_logic_vector(3 downto 0):="0000";
signal led0_en_sig, led1_en_sig: std_logic_vector(4 downto 0):="00000";
signal led2_en_sig, led3_en_sig: std_logic_vector(4 downto 0):="00000";

begin
 a_count <= a_count_out;
 b_count <= b_count_out;

CNT_A: counter
  port map (clk => clk, reset => reset, 
            count_in  => a, count_out => a_count_out	);

CNT_B: counter
  port map (clk => clk, reset => reset,
            count_in  => b, count_out => b_count_out	);

SLCT:  selector
  port map (clk => clk, reset => reset, equal => equal,
	          a_count => a_count_out, b_count => b_count_out,
	          add_result  => add_result,
	         	led0_en => led0_en_sig, led1_en => led1_en_sig,
	         	led2_en => led2_en_sig, led3_en => led3_en_sig );	

DCD0:  decoder port map (led => led0_en_sig, seg => led0 );                         
DCD1:  decoder port map (led => led1_en_sig, seg => led1 );
DCD2:  decoder port map (led => led2_en_sig, seg => led2 );
DCD3:  decoder port map (led => led3_en_sig, seg => led3 );

end RTL;

-- counter -----
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter is
  port(clk, reset: in  std_logic;
       count_in:   in  std_logic;
	     count_out : out std_logic_vector(3 downto 0));
end counter;

architecture RTL of counter is
signal count : std_logic_vector(3 downto 0):="0000";
begin

process(clk)
begin
	if reset='0' then 
		   count <= "0000";
	elsif (count_in'event and count_in='0') then
	     count <= count + 1;	
	end if;
  count_out <= count(3 downto 0);
end process;
end RTL;

--selecter
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity selector is
	port(clk, reset, equal: in std_logic;
	     a_count, b_count:  in std_logic_vector(3 downto 0);
		   add_result:        in std_logic_vector(4 downto 0);
		   led0_en, led1_en: out std_logic_vector(4 downto 0);
		   led2_en, led3_en: out std_logic_vector(4 downto 0));
end selector;

architecture RTL of selector is
begin
process(clk)
  begin case equal is			
	  when '0' =>    led0_en <= '0'&b_count;
		               led1_en <= "11111";
		               led2_en <= "11111";
		               led3_en <= "0"&a_count;
		when '1' =>    led0_en <= '0'&add_result(3 downto 0);
		               led1_en <= "0000"&add_result(4);
		               led2_en <= "11101";
		               led3_en <= "11101";
    when others => led0_en <= "11111";
		               led1_en <= "11111";
		               led2_en <= "11111";
		               led3_en <= "11111";
    end case;
end process;
end RTL;

--decoder
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
