library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity DeInterLeaver is
port(clk:in std_logic;
	DataIn:in std_logic_vector(7 downto 0);
	DataOut:out std_logic_vector(7 downto 0));
end entity;
architecture stru of DeInterLeaver is
	--read & write address of deinterleaver module
	component DeAddrGen is
	port(clk:in std_logic;   
		AddrR:out integer range 0 to 2047;
		AddrW:out integer range 0 to 2047
		);
	end component;
	--ram module
	component RAM is
	port(AddrR:in integer range 0 to 2047;  
		AddrW:in integer range 0 to 2047;     
		DataIn:in std_logic_vector(7 downto 0);   
		DataOut:out std_logic_vector(7 downto 0);
		CS,RE,WE:in std_logic);  
	end component;
	--read & write control module
	component WRcon is
		port(clk:in std_logic;
		WE,RE:out std_logic);
	end component;
	--data lock module
	component DataLock is
		port(Data:in std_logic_vector(7 downto 0);
		DataLock:out std_logic_vector(7 downto 0);
		RE:in std_logic);
	end component;
signal adr,adw:integer range 0 to 2047;
signal we,re:std_logic;
signal d:std_logic_vector(7 downto 0);
begin
  u0:DeAddrGen port map(clk,adr,adw);
  u1:WRcon port map(clk,we,re);
  u2:RAM port map(adr,adw,DataIn,d,'0',re,we);
  u3:DataLock port map(d,DataOut,re);
end stru;
