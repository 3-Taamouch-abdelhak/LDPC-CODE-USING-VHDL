LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
ENTITY CNPU6_6 IS
  PORT( start_cn_6,clk,rst:in std_logic;
        Z1_6                                :   IN    std_logic_vector(8 DOWNTO 0);
        Z2_6                                :   IN    std_logic_vector(8 DOWNTO 0);
        Z3_6                                :   IN    std_logic_vector(8 DOWNTO 0);   
        Z4_6                                :   IN    std_logic_vector(8 DOWNTO 0);   
        Z5_6                                :   IN    std_logic_vector(8 DOWNTO 0);   
        Z6_6                                :   IN    std_logic_vector(8 DOWNTO 0);   
        L1_6                                :   OUT   std_logic_vector(8 DOWNTO 0);   
        L2_6                                :   OUT   std_logic_vector(8 DOWNTO 0);   
        L3_6                                :   OUT   std_logic_vector(8 DOWNTO 0);   
        L4_6                                :   OUT   std_logic_vector(8 DOWNTO 0);   
        L5_6                                :   OUT   std_logic_vector(8 DOWNTO 0);   
        L6_6                                :   OUT   std_logic_vector(8 DOWNTO 0);    
		  end_cn_6                            : out std_logic
        );
END CNPU6_6;


ARCHITECTURE rtl OF CNPU6_6 IS

  -- Component Declarations
  COMPONENT Min1
    PORT( --clk,rst:std_logic;
	       in0                             :   IN    std_logic_vector(8 DOWNTO 0);  -- ufix9_En5
          in1                             :   IN    std_logic_vector(8 DOWNTO 0);  -- ufix9_En5
          out0                            :   OUT   std_logic_vector(8 DOWNTO 0)  -- ufix9_En5
          );
  END COMPONENT;

  COMPONENT absp
    PORT(
	       a                             :   IN    std_logic_vector(8 DOWNTO 0);  -- ufix9_En5
          b                            :   OUT   std_logic_vector(8 DOWNTO 0)  -- ufix9_En5
          );
  END COMPONENT;

------------------------------------------------------------------------------------------------

  FOR ALL : Min1
    USE ENTITY work.Min1(rtl);

  FOR ALL : absp
    USE ENTITY work.absp(arch_absp);
-------------------------------------------------------------------------------------------------

  SIGNAL inf1_out1                        : std_logic;
  SIGNAL inf2_out1                        : std_logic;
  SIGNAL inf3_out1                        : std_logic;
  SIGNAL inf4_out1                        : std_logic;
  SIGNAL inf5_out1                        : std_logic;
  SIGNAL inf6_out1                        : std_logic;
  SIGNAL XOR_out1                         : std_logic;
  SIGNAL XOR1_out1                        : std_logic;
  SIGNAL XOR2_out1                        : std_logic;
  SIGNAL XOR3_out1                        : std_logic;
  SIGNAL XOR4_out1                        : std_logic;
  SIGNAL XOR5_out1                        : std_logic;
  SIGNAL XOR6_out1                        : std_logic;
  SIGNAL val1                             : std_logic_vector(8 DOWNTO 0);  -- ufix8_En5
  SIGNAL val3                             : std_logic_vector(8 DOWNTO 0);  -- ufix8_En5
  SIGNAL val2                             : std_logic_vector(8 DOWNTO 0);  -- ufix8_En5
  SIGNAL val4                             : std_logic_vector(8 DOWNTO 0);  -- ufix8_En5 
  SIGNAL val5                             : std_logic_vector(8 DOWNTO 0); -- ufix8_En5
  SIGNAL val6                             : std_logic_vector(8 DOWNTO 0);  -- ufix8_En5
  SIGNAL M1                               : std_logic_vector(8 DOWNTO 0);  -- ufix8_En5
  SIGNAL M2                               : std_logic_vector(8 DOWNTO 0);  -- ufix8_En5
  SIGNAL M3                               : std_logic_vector(8 DOWNTO 0);  -- ufix8_En5
  SIGNAL M4                               : std_logic_vector(8 DOWNTO 0);  -- ufix8_En5
  SIGNAL M5                               : std_logic_vector(8 DOWNTO 0);  -- ufix8_En5
  SIGNAL M6                               : std_logic_vector(8 DOWNTO 0);  -- ufix8_En5
  SIGNAL S1                               : std_logic_vector(8 DOWNTO 0);  -- ufix8_En5
  SIGNAL S2                               : std_logic_vector(8 DOWNTO 0);  -- ufix8_En5
  SIGNAL S3                               : std_logic_vector(8 DOWNTO 0);  -- ufix8_En5
  SIGNAL S4                               : std_logic_vector(8 DOWNTO 0);  -- ufix8_En5
  SIGNAL S5                               : std_logic_vector(8 DOWNTO 0);  -- ufix8_En5
  SIGNAL S6                               : std_logic_vector(8 DOWNTO 0);  -- ufix8_En5
  SIGNAL Y1                               : signed(8 DOWNTO 0);  -- ufix8_En5
  SIGNAL Y2                               : signed(8 DOWNTO 0);  -- ufix8_En5
  SIGNAL Y3                               : signed(8 DOWNTO 0);  -- ufix8_En5
  SIGNAL Y4                               : signed(8 DOWNTO 0);  -- ufix8_En5
  SIGNAL Y5                               : signed(8 DOWNTO 0);  -- ufix8_En5
  SIGNAL Y6                               : signed(8 DOWNTO 0);  -- ufix8_En5 
  SIGNAL X1                               : signed(8 DOWNTO 0);  -- sfix9_En5
  SIGNAL X2                               : signed(8 DOWNTO 0);  -- sfix9_En5
  SIGNAL X3                               : signed(8 DOWNTO 0); -- sfix9_En5
  SIGNAL X4                               : signed(8 DOWNTO 0);  -- sfix9_En5
  SIGNAL X5                               : signed(8 DOWNTO 0);-- sfix9_En5
  SIGNAL X6                               : signed(8 DOWNTO 0);  -- sfix9_En5
  SIGNAL Z11                               : signed(8 DOWNTO 0);  -- ufix8_En5
  SIGNAL Z22                               : signed(8 DOWNTO 0);  -- ufix8_En5
  SIGNAL Z33                               : signed(8 DOWNTO 0);  -- ufix8_En5
  SIGNAL Z44                               : signed(8 DOWNTO 0);  -- ufix8_En5
  SIGNAL Z55                               : signed(8 DOWNTO 0);  -- ufix8_En5
  SIGNAL Z66                               : signed(8 DOWNTO 0);  -- ufix8_En5
  signal  y                                : unsigned(2 DOWNTO 0):="000";
---------------------------]]]]]]]]]]]]]]]]]]]]]-----------------------------------
BEGIN
 u_min1 : Min1
    PORT MAP(-- clk=>clk,
              --rst=>rst,
              in0 =>val1,  -- ufix8_En5
              in1 => val2,  -- ufix8_En5
              out0 => M1  -- ufix8_En5
              );
 u_min2 : Min1
    PORT MAP( --clk=>clk,
              --rst=>rst,
	           in0 => val3,  -- ufix8_En5
              in1 => val4,  -- ufix8_En5
              out0 => M2  -- ufix8_En5
              );
 u_min3 : Min1
    PORT MAP( --clk=>clk,
              --rst=>rst,
	           in0 => val5,  -- ufix8_En5
              in1 => val6,  -- ufix8_En5
              out0 => M3  -- ufix8_En5
              );
 u_min4 : Min1
    PORT MAP( --clk=>clk,
              --rst=>rst,
	           in0 => M1,  -- ufix8_En5
              in1 => M2,  -- ufix8_En5
              out0 => M4  -- ufix8_En5
              );
 u_min5 : Min1
    PORT MAP( --clk=>clk,
              --rst=>rst,
				  in0 => M1,  -- ufix8_En5
              in1 => M3,  -- ufix8_En5
              out0 => M5  -- ufix8_En5
              );
-----------------------------------------------------------------------------

 u_min6 : Min1
    PORT MAP( --clk=>clk,
              --rst=>rst,
				  in0 => M2,  -- ufix8_En5
              in1 => M3,  -- ufix8_En5
              out0 => M6  -- ufix8_En5
              );
u_min7 : Min1
    PORT MAP( --clk=>clk,
              --rst=>rst,
				  in0 => M6,  -- ufix8_En5
              in1 => val2,  -- ufix8_En5
              out0 => S1  -- ufix8_En5
              );
u_min8 : Min1
    PORT MAP( --clk=>clk,
              --rst=>rst,
				  in0 => M6,  -- ufix8_En5
              in1 => val1,  -- ufix8_En5
              out0 => S2  -- ufix8_En5
              );
u_min9 : Min1
    PORT MAP( --clk=>clk,
              --rst=>rst,
				  in0 => M5,  -- ufix8_En5
              in1 => val4,  -- ufix8_En5
              out0 => S3  -- ufix8_En5
              );
u_min10 : Min1
    PORT MAP( --clk=>clk,
              --rst=>rst,
				  in0 => M5,  -- ufix8_En5
              in1 => val3,  -- ufix8_En5
              out0 => S4 -- ufix8_En5
              );
u_min11 : Min1
    PORT MAP( --clk=>clk,
              --rst=>rst,
				  in0 => M4,  -- ufix8_En5
              in1 => val6,  -- ufix8_En5
              out0 => S5  -- ufix8_En5
              );
u_min12 : Min1
    PORT MAP( --clk=>clk,
              --rst=>rst,
				  in0 => M4,  -- ufix8_En5
              in1 => val5,  -- ufix8_En5
              out0 => S6  -- ufix8_En5
              );
-----------------------------------------------------------------------------------------------------
process(clk,rst,start_cn_6)
begin
if(rst='1') then
  Z11 <= "000000000";
  Z22 <= "000000000";
  Z33 <= "000000000";
  Z44 <= "000000000";
  Z55 <= "000000000";
  Z66 <= "000000000";
elsif(rising_edge(clk) and start_cn_6='1')then
  Z11 <= signed(Z1_6);
  Z22 <= signed(Z2_6);
  Z33 <= signed(Z3_6);
  Z44 <= signed(Z4_6);
  Z55 <= signed(Z5_6);
  Z66 <= signed(Z6_6);
  end if;
  end process;
--------------------------------------------------------------------------------------------------
process(clk,rst,start_cn_6)
begin
if(rst='1' or start_cn_6='0') then
y<="000";
elsif(rising_edge(clk) and start_cn_6='1')then
y<=y+"001";
end if;
end process;

end_cn_6<='1' when y="001" else '0';
----------------------------------------------------------------------------------------------------
  absp1 : absp
    PORT MAP(
				  a => std_logic_vector(Z11),  -- ufix9_En5
              b => val1  -- ufix9_En5
              );
  absp2 : absp
    PORT MAP(
				  a => std_logic_vector(Z22),  -- ufix9_En5
              b => val2  -- ufix9_En5
              );
  absp3 : absp
    PORT MAP( 
				  a => std_logic_vector(Z33),  -- ufix9_En5
              b => val3  -- ufix9_En5
              );
  absp4 : absp
    PORT MAP(
				  a => std_logic_vector(Z44),  -- ufix9_En5
              b => val4  -- ufix9_En5
              );
  absp5 : absp
    PORT MAP(
				  a => std_logic_vector(Z55),  -- ufix9_En5
              b => val5  -- ufix9_En5
              );
  absp6 : absp
    PORT MAP(
				  a => std_logic_vector(Z66),  -- ufix9_En5
              b => val6  -- ufix9_En5
              );

---------------------------------------------------
Y1<=signed(S1);
Y2<=signed(S2);
Y3<=signed(S3);
Y4<=signed(S4);
Y5<=signed(S5);
Y6<=signed(S6);

---------------------------------------------
  inf1_out1 <= '1' WHEN Z11 < to_signed(16#000#, 9) ELSE '0';
  inf2_out1 <= '1' WHEN Z22 < to_signed(16#000#, 9) ELSE '0';
  inf3_out1 <= '1' WHEN Z33 < to_signed(16#000#, 9) ELSE '0';
  inf4_out1 <= '1' WHEN Z44 < to_signed(16#000#, 9) ELSE '0';  
  inf5_out1 <= '1' WHEN Z55 < to_signed(16#000#, 9) ELSE '0';
  inf6_out1 <= '1' WHEN Z66 < to_signed(16#000#, 9) ELSE '0';
---------------------------------------------------------------------------------------------------------
  XOR_out1 <= inf6_out1 XOR (inf5_out1 XOR (inf4_out1 XOR (inf3_out1 XOR (inf1_out1 XOR inf2_out1))));

  XOR1_out1 <= XOR_out1 XOR inf1_out1;
  XOR2_out1 <= XOR_out1 XOR inf2_out1;
  XOR3_out1 <= XOR_out1 XOR inf3_out1;
  XOR4_out1 <= XOR_out1 XOR inf4_out1;
  XOR5_out1 <= XOR_out1 XOR inf5_out1;
  XOR6_out1 <= XOR_out1 XOR inf6_out1;
  ------------------------------------------------------------------------------------------------------
X1<=-(Y1) when XOR1_out1='1' else 
Y1;
X2<=-(Y2) when XOR2_out1='1' else 
Y2;
X3<=-(Y3) when XOR3_out1='1' else 
Y3;
X4<=-(Y4) when XOR4_out1='1' else 
Y4;
X5<=-(Y5) when XOR5_out1='1' else 
Y5;
X6<=-(Y6) when XOR6_out1='1' else 
Y6;
--------------------------------------------
process(clk,rst,start_cn_6)
begin
if(rst='1') then
  L1_6 <= "000000000";
  L2_6 <= "000000000";
  L3_6 <= "000000000";
  L4_6 <= "000000000";
  L5_6 <= "000000000";
  L6_6 <= "000000000";
elsif(rising_edge(clk) and start_cn_6='1') then
  L1_6 <= std_logic_vector(X1);
  L2_6 <= std_logic_vector(X2);
  L3_6 <= std_logic_vector(X3);
  L4_6 <= std_logic_vector(X4);
  L5_6 <= std_logic_vector(X5);
  L6_6 <= std_logic_vector(X6);
end if;
end process;
 
END rtl;