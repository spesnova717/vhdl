library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

 

-- Uncomment the following library declaration if using

-- arithmetic functions with Signed or Unsigned values

--use IEEE.NUMERIC_STD.ALL;

 

-- Uncomment the following library declaration if instantiating

-- any Xilinx primitives in this code.

--library UNISIM;

--use UNISIM.VComponents.all;

 

entity ledchika is

    Port ( xtalclk_ip : in  STD_LOGIC;

           pushsw_ip : in  STD_LOGIC;

           led_op : out  STD_LOGIC_VECTOR (7 downto 0));

end ledchika;

 

architecture Behavioral of ledchika is

 

begin

 

 

end Behavioral;
