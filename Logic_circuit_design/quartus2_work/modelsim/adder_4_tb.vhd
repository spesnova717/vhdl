library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity adder_4_tb is
end adder_4_tb;

architecture SIM of adder_4_tb is
    component adder_4
      port (A,B : in std_logic_vector(3 downto 0);
            S :   out std_logic_vector(3 downto 0);
            CO :  out std_logic);
  end component;
  
  signal A,B : std_logic_vector(3 downto 0):="1111";
  signal S   : std_logic_vector(3 downto 0);
  signal CO  : std_logic;
  constant STEP: time := 20 us;
  
  begin
    DUT: adder_4 port map(A,B,S,CO);
    
    process begin
      B <= B + '1'; wait for STEP;
    end process;
    
    process begin
      for I in 0 to 15 loop
        A <= A + '1'; wait for STEP*16;
    end loop;
    assert false severity failure;
    wait;
  end process;
  
end SIM;

configuration cfg_adder_4_tb of adder_4_tb is
  for SIM
end for;
end cfg_adder_4_tb;