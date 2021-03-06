library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity adder_4_top_tb is
end adder_4_top_tb;

architecture SIM of adder_4_top_tb is
    component adder_4_top
      port (clk,reset,A,B,EQUAL : in std_logic;
            LED0,LED1,LED2,LED3 : out std_logic_vector(7 downto 0);
            a_count_sig,b_count_sig : out std_logic_vector(3 downto 0);
            ADD : out std_logic_vector(4 downto 0));
  end component;
 
  signal clk,reset,A,B,EQUAL : std_logic:='0';
  signal LED0,LED1,LED2,LED3 : std_logic_vector(7 downto 0);
  signal a_count_sig,b_count_sig : std_logic_vector(3 downto 0);
  signal ADD : std_logic_vector(4 downto 0);
  constant STEP: time := 20 us;
  
  begin
    DUT: adder_4_top
      port map(clk,reset,A,B,EQUAL,LED0,LED1,LED2,LED3,ADD,a_count_sig,b_count_sig);
        
      process begin
        clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
      end process;
    
      process begin
        B <= '1'; wait for STEP/2;
        B <= '0'; wait for STEP/2;
      end process;
    
      process begin
        A <= '1'; wait for STEP*8;
        A <= '0'; wait for STEP*8;
      end process;
      
      process begin
        reset <= '1'; EQUAL <= '0';
        wait for 550 us; reset <= '0';
        wait for  50 us; reset <= '1';
        wait for 900 us; EQUAL <= '1';
        wait for 600 us; EQUAL <= '0';       
        wait for 460 us;

    assert false severity failure;
    wait;
  end process;
  
end SIM;

configuration cfg_adder_4_top_tb of adder_4_top_tb is
  for SIM
end for;
end cfg_adder_4_top_tb;


