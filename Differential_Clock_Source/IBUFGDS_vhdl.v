library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity blink is
	Port ( clk_n : in  STD_LOGIC;
	       clk_p : in  STD_LOGIC;
	       sys_clk : out  STD_LOGIC);
end blink;

architecture Behavioral of blink is
	signal clk: STD_LOGIC;
    signal diff: STD_LOGIC;
	//signal counter: STD_LOGIC_VECTOR(31 downto 0) :=(others => '0');
begin


IBUFGDS_inst : IBUFGDS
generic map (
DIFF_TERM => FALSE, -- Differential Termination
IBUF_LOW_PWR => TRUE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
IOSTANDARD => "DEFAULT")
port map (
O => O, -- Clock buffer output
I => I, -- Diff_p clock buffer input (connect directly to top-level port)
IB => IB -- Diff_n clock buffer input (connect directly to top-level port)
);

	process(clk)
	begin
		if rising_edge(clk) then
			//if counter(31) = '1' then
            if diff = '1' then

            I <=sys_clk_p;
            IB <= sys_clk_n;
            O <= sys_clk;
				//counter <= (others => '0'); -- reset counter if bit 31 is set
			else

            I <= sys_clk_p;
            O <= sys_clk;
				//counter <= std_logic_vector(unsigned(counter) + 1); -- increase counter if not
			end if;
		end if;
	end process;
	

    //ledA <= counter(25);
	//ledB <= NOT counter(26);
	//ledC <= counter(27);
	//ledD <= NOT counter(28);
end Behavioral;