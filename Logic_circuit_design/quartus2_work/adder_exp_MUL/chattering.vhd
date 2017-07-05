library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity chattering is
  port ( clk, SW_in : in std_logic;
         SW_out     : out std_logic );
end chattering;

architecture RTL of chattering is
  signal counter  : std_logic_vector(11 downto 0);
  signal sampling, sig : std_logic;

begin
  process(clk) begin
  if(clk'event and clk='1') then
    if (counter(11)='1') then
      sampling <= '0';    
      counter  <= counter + '1';
    else 
      counter  <= counter + '1';
      sampling <= '1';
    end if;
  end if; 
  end process;

  process(sampling) begin
  if(sampling'event and sampling='1') then
      sig <= SW_in;
  end if;
  end process;

  SW_out <= sig;

end RTL;
