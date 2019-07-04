library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity In_DeModel_tb is
end entity;
architecture simu of In_DeModel_tb is
  component In_DeIn
  port(clk:in std_logic;
       DataIn:in std_logic_vector(7 downto 0);
       DataOut:Out std_logic_vector(7 downto 0));
  end component;
constant t:time:=5us;
constant t2:time:=10us;
signal clk:std_logic:='0';
signal DataOut:std_logic_vector(7 downto 0);
signal DataIn:std_logic_vector(7 downto 0):="00000000";
begin
  u0:
  In_DeIn port map
 (clk=>clk,DataIn=>DataIn,DataOut=>DataOut);
 process
 begin
   wait for t;
   clk<=not clk; 
 end process;
 process
 begin
   wait for t2;
   DataIn<=DataIn+'1';
end process;
end simu;
