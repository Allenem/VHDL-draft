--ram module
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity RAM is 
port(AddrR:in integer range 0 to 2047; 
	AddrW:in integer range 0 to 2047; 
	DataIn:in std_logic_vector(7 downto 0); 
	DataOut:out std_logic_vector(7 downto 0);
	CS,RE,WE:in std_logic); 
end RAM;
architecture behav of RAM is 
begin  
process(AddrW,RE,WE)
type ram_array is array(0 to 2047) of std_logic_vector(7 downto 0);
variable mem:ram_array;
begin
if(CS='0') then
	if(RE='0') then DataOut<=mem(AddrR);
	elsif(WE='0') then mem(AddrW):=DataIn;
	end if;
end if;
end process;
end behav;
