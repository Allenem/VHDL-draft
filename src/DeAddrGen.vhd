--read & write address of deinterleaver module
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity DeAddrGen is
port(clk:in std_logic;   
	AddrR:out integer range 0 to 2047;
	AddrW:out integer range 0 to 2047
	);
end DeAddrGen;
architecture behav of DeAddrGen is
	signal count:integer range 0 to 11:=0;
begin

--count process  
C:process(clk)
variable c:integer range 0 to 11:=0;
begin
	if(rising_edge(clk)) then
		c:=(c+1)mod 12;
	end if;
	count<=c;
end process;

addr:process(clk)
	constant a11:integer:=0;
	constant a10:integer:=1;
	constant c10:integer:=18;
	constant a9:integer:=19;
	constant c9:integer:=53;
	constant a8:integer:=54;
	constant c8:integer:=105;
	constant a7:integer:=106;
	constant c7:integer:=174;
	constant a6:integer:=175;
	constant c6:integer:=260;
	constant a5:integer:=261;
	constant c5:integer:=363;
	constant a4:integer:=364;
	constant c4:integer:=483;
	constant a3:integer:=484;
	constant c3:integer:=620;
	constant a2:integer:=621;
	constant c2:integer:=774;
	constant a1:integer:=775;
	constant c1:integer:=945;
	constant a0:integer:=946;
	constant c0:integer:=1133;
	variable b10:integer range 0 to 17:=0;
	variable b9:integer range 0 to 34:=0;
	variable b8:integer range 0 to 51:=0;
	variable b7:integer range 0 to 68:=0;
	variable b6:integer range 0 to 85:=0;
	variable b5:integer range 0 to 102:=0;
	variable b4:integer range 0 to 119:=0;
	variable b3:integer range 0 to 136:=0;
	variable b2:integer range 0 to 153:=0;
	variable b1:integer range 0 to 170:=0;
	variable b0:integer range 0 to 187:=0;
begin
if(rising_edge(clk)) then
	case count is
	when 0=> 
		b0:=(b0+1)mod 188;
		if(b0=0) then
		AddrW<=c0;
		AddrR<=a0;
		else
		AddrR<=a0+b0;
		AddrW<=a0+b0-1;
		end if;
	when 1=> 
		b1:=(b1+1)mod 171;
		if(b1=0) then
		AddrW<=c1;
		AddrR<=a1;
		else
		AddrR<=a1+b1;
		AddrW<=a1+b1-1;
		end if;
	when 2=>
		b2:=(b2+1)mod 154;
		if(b2=0) then
		AddrW<=c2;
		AddrR<=a2;
		else
		AddrR<=a2+b2;
		AddrW<=a2+b2-1;
		end if;
	when 3=>
		b3:=(b3+1)mod 137;
		if(b3=0) then
		AddrW<=c3;
		AddrR<=a3;
		else
		AddrR<=a3+b3;
		AddrW<=a3+b3-1;
		end if;
	when 4=>
		b4:=(b4+1)mod 120;
		if(b4=0) then
		AddrW<=c4;
		AddrR<=a4;
		else
		AddrR<=a4+b4;
		AddrW<=a4+b4-1;
		end if;
	when 5=>
		b5:=(b5+1)mod 103;
		if(b5=0) then
		AddrW<=c5;
		AddrR<=a5;
		else
		AddrR<=a5+b5;
		AddrW<=a5+b5-1;
		end if;
	when 6=>
		b6:=(b6+1)mod 86;
		if(b6=0) then
		AddrW<=c6;
		AddrR<=a6;
		else
		AddrR<=a6+b6;
		AddrW<=a6+b6-1;
		end if;
	when 7=>
		b7:=(b7+1)mod 69;
		if(b7=0) then
		AddrW<=c7;
		AddrR<=a7;
		else
		AddrR<=a7+b7;
		AddrW<=a7+b7-1;
		end if;
	when 8=>
		b8:=(b8+1)mod 52;
		if(b8=0) then
		AddrW<=c8;
		AddrR<=a8;
		else
		AddrR<=a8+b8;
		AddrW<=a8+b8-1;
		end if;
	when 9=>
		b9:=(b9+1)mod 35;
		if(b9=0) then
		AddrW<=c9;
		AddrR<=a9;
		else
		AddrR<=a9+b9;
		AddrW<=a9+b9-1;
		end if;
	when 10=>
		b10:=(b10+1)mod 18;
		if(b10=0) then
		AddrW<=c10;
		AddrR<=a10;
		else
		AddrR<=a10+b10;
		AddrW<=a10+b10-1;
		end if;
	when 11=>  
		AddrW<=a11;AddrR<=a11;
	end case;
end if;
end process;
end behav;