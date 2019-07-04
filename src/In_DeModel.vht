LIBRARY ieee;                                               
USE ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;                             

ENTITY In_DeModel_vhd_tst IS
END In_DeModel_vhd_tst;
ARCHITECTURE In_DeModel_arch OF In_DeModel_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL DataIn : STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
SIGNAL DataOut : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL DataOut1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
COMPONENT In_DeModel
	PORT (
	clk : IN STD_LOGIC;
	DataIn : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	DataOut : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

component InterLeaver
port(clk:in std_logic;
	DataIn:in std_logic_vector(7 downto 0);
	DataOut:out std_logic_vector(7 downto 0));
end component;

BEGIN
	i1 : In_DeModel
	PORT MAP (
	clk => clk,
	DataIn => DataIn,
	DataOut => DataOut
	);
	i2 : InterLeaver
	port map(
	clk => clk,
	DataIn => DataIn,
	DataOut => DataOut1
    );                                      
clk_gen: PROCESS                                                                                  
constant period:time:=20 ns;
BEGIN                                                         
	clk<='0';
	wait for period/2;
	clk<='1';
	wait for period/2;	                                                       
END PROCESS clk_gen; 

DataIn_gen:process(clk)
begin
if(rising_edge(clk))then
	DataIn<=DataIn+'1';
end if;
end process DataIn_gen;

END In_DeModel_arch;
