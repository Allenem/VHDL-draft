--read & write control module
library ieee;
use ieee.std_logic_1164.all;
entity WRCon is
port(clk:in std_logic;
	WE,RE:out std_logic);
end entity;
architecture behav of WRcon is
begin
    WE<=not clk;
	RE<=clk;
end behav;
