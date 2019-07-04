--data lock module
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity DataLock is
port(Data:in std_logic_vector(7 downto 0);
	DataLock:out std_logic_vector(7 downto 0);
	RE:in std_logic);
end entity;
architecture behav of DataLock is
begin
process(Data,RE)
begin
if(RE='0') then DataLock<=Data;
end if;
end process;
end behav; 
