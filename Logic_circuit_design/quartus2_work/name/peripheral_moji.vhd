-- Peripheral module for Moji_Deco by T.Fujioka  (May 3,2017)
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity peripheral_moji is
  port(CLK,RESET,STOP : in std_logic;
	     deco0,deco1,deco2,deco3: out std_logic_vector(4 downto 0));
end peripheral_moji;

architecture RTL of peripheral_moji is
  component counter is
   	port(clk_c, clk, reset, stop : in std_logic;
	       de_out0 : out std_logic_vector(4 downto 0);
	       de_out1 : out std_logic_vector(4 downto 0);
	       de_out2 : out std_logic_vector(4 downto 0);
	       de_out3 : out std_logic_vector(4 downto 0));
  end component;

  signal clk_sig: std_logic :='0';
  signal   count: integer :=0;
  constant CYCLE: integer :=25000000;
  
begin
  process(clk) begin
  if  rising_edge (clk) then
    if  (count = (CYCLE-1)) then
         clk_sig <= NOT(clk_sig);
         count <= 0;
    else count <= count + 1;
    end if; 
  end if;
  end process;

  CNTR: counter port map ( 
          clk_c   => clk_sig, clk     => CLK,
          reset   => RESET,   stop    => STOP,
	        de_out0 => deco0,   de_out1 => deco1,
	        de_out2 => deco2,   de_out3 => deco3 );	
end RTL;		

-- counter module: generation of decode signal
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter is
  port(	clk_c, clk, reset, stop : in std_logic;
        de_out0 : out std_logic_vector(4 downto 0);
        de_out1 : out std_logic_vector(4 downto 0);
        de_out2 : out std_logic_vector(4 downto 0);
        de_out3 : out std_logic_vector(4 downto 0));
end counter;

architecture RTL of counter is
  signal counter0 : std_logic_vector(4 downto 0) :="11111";
  signal STP : std_logic :='1';

begin 
process (stop) begin
  if (stop'event and stop='0') then
    STP <= NOT STP;
  end if;
end process;

process (clk_c,reset,STP) begin
	if (reset='0') then  counter0 <= "00011";
    elsif (clk_c'event and clk_c = '1') then
	    if  (STP = '0') then
	         counter0 <= counter0;
      else counter0 <= counter0+'1';
	    end if;
	end if;
	de_out0 <= counter0(4 downto 0);
  de_out1 <= counter0(4 downto 0)-"00001";
  de_out2 <= counter0(4 downto 0)-"00010";
  de_out3 <= counter0(4 downto 0)-"00011";
end process;
end RTL;
