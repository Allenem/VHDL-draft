library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity In_DeModel is
port(clk:in std_logic;
	DataIn:in std_logic_vector(7 downto 0);
	DataOut:Out std_logic_vector(7 downto 0));
end entity;
architecture stru of In_DeModel is
	--InterLeaver module
	component InterLeaver is
	port(clk:in std_logic;
		DataIn:in std_logic_vector(7 downto 0);
		DataOut:out std_logic_vector(7 downto 0));
	end component;
	component DeInterLeaver is
	port(clk:in std_logic;
		DataIn:in std_logic_vector(7 downto 0);
		DataOut:out std_logic_vector(7 downto 0));
	end component;
	component ClockDelay is
	port(clk:in std_logic;
		clk_de:out std_logic);
	end component;
	signal d:std_logic_vector(7 downto 0);
	signal clk_de:std_logic;
begin
	u0:InterLeaver port map(clk,DataIn,d);
	u1:ClockDelay port map(clk,clk_de);
	u2:DeInterLeaver port map(clk_de,d,DataOut);
end stru;