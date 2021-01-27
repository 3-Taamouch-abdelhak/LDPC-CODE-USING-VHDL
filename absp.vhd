library ieee;
use ieee.std_logic_1164.ALL;
ENTITY absp IS
  PORT(
        a        :   IN    std_logic_vector(8 DOWNTO 0);  
        b        :   OUT   std_logic_vector(8 DOWNTO 0));
END absp;
architecture arch_absp of absp is 
signal x: std_logic_vector(8 DOWNTO 0);
begin
x<=a;
process(x)
begin
if( x(8)='1') then
b<=not(x);
if(x(0)='1') then
b(0)<='1';
elsif( x(1)='1') then
b(0)<='0';
b(1)<='1';
elsif( x(2)='1') then
b(0)<='0';
b(1)<='0';
b(2)<='1';
elsif( x(3)='1') then
b(0)<='0';
b(1)<='0';
b(2)<='0';
b(3)<='1';
elsif( x(4)='1') then
b(0)<='0';
b(1)<='0';
b(2)<='0';
b(3)<='0';
b(4)<='1';
elsif( x(5)='1') then
b(0)<='0';
b(1)<='0';
b(2)<='0';
b(3)<='0';
b(4)<='0';
b(5)<='1';
elsif( x(6)='1') then
b(0)<='0';
b(1)<='0';
b(2)<='0';
b(3)<='0';
b(4)<='0';
b(5)<='0';
b(6)<='1';
elsif( x(7)='1') then
b(0)<='0';
b(1)<='0';
b(2)<='0';
b(3)<='0';
b(4)<='0';
b(5)<='0';
b(6)<='0';
b(7)<='1';
else b<="100000000";
end if;
else
b<=x;
end if;
end process;

end;