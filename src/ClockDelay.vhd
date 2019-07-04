--ClockDelay module
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity ClockDelay is 
port(clk:in std_logic;
	clk_de:out std_logic);
end ClockDelay;
architecture behav of ClockDelay is
signal c,d:std_logic:='0';
begin
clk_de<=clk and d;
process(clk)
begin
if(clk'event and clk='1') then
	if(c='0') then 
		c<='1';
	end if;
elsif(clk'event and clk='0') then
	if(c='1') then 
		d<='1';
	end if;
end if; 
end process;
end behav;
