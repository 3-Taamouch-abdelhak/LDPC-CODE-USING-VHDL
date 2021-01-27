LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY VNPU6_6 IS
  PORT( start_vn_6,clk,rst: std_logic;
        Lc_6                                :   IN    std_logic_vector(8 DOWNTO 0);  -- sfix8_En5
        L1_6                                :   IN    std_logic_vector(8 DOWNTO 0);  -- sfix8_En5
        L2_6                                :   IN    std_logic_vector(8 DOWNTO 0);  -- sfix8_En5
        L3_6                                :   IN    std_logic_vector(8 DOWNTO 0);  -- sfix8_En5
		  L4_6                                :   IN    std_logic_vector(8 DOWNTO 0);  -- sfix8_En5
		  L5_6                                :   IN    std_logic_vector(8 DOWNTO 0);  -- sfix8_En5
		  L6_6                                :   IN    std_logic_vector(8 DOWNTO 0);  -- sfix8_En5
        Z1_6                                :   OUT   std_logic_vector(8 DOWNTO 0);  -- sfix8_En5
        Z2_6                                :   OUT   std_logic_vector(8 DOWNTO 0);  -- sfix8_En5
		  Z3_6                                :   OUT   std_logic_vector(8 DOWNTO 0);  -- sfix8_En5
		  Z4_6                                :   OUT   std_logic_vector(8 DOWNTO 0);  -- sfix8_En5
		  Z5_6                                :   OUT   std_logic_vector(8 DOWNTO 0);  -- sfix8_En5
        Z6_6                                :   OUT   std_logic_vector(8 DOWNTO 0);  -- sfix8_En5
		  SI_6                                :   OUT   std_logic;
		  end_vn_6                            :   OUT   std_logic
        );
END VNPU6_6;

ARCHITECTURE rtl OF VNPU6_6 IS

  -- Signals
  SIGNAL L1_signed                        : signed(8 DOWNTO 0);  -- sfix8_En5
  SIGNAL L2_signed                        : signed(8 DOWNTO 0);  -- sfix8_En5
  SIGNAL L3_signed                        : signed(8 DOWNTO 0);  -- sfix8_En5
  SIGNAL L4_signed                        : signed(8 DOWNTO 0);  -- sfix8_En5
  SIGNAL L5_signed                        : signed(8 DOWNTO 0);  -- sfix8_En5
  SIGNAL L6_signed                        : signed(8 DOWNTO 0);  -- sfix8_En5
  SIGNAL Lc_signed                        : signed(8 DOWNTO 0);  -- sfix8_En5
  SIGNAL add_add_cast_1                   : signed(11 DOWNTO 0);  -- sfix10_En5
  SIGNAL add_add_cast_2                   : signed(11 DOWNTO 0);  -- sfix10_En5
  SIGNAL add_add_cast_3                   : signed(11 DOWNTO 0);  -- sfix10_En5
  SIGNAL add_add_cast_4                   : signed(11 DOWNTO 0);  -- sfix10_En5
  SIGNAL add_add_cast_5                   : signed(11 DOWNTO 0);  -- sfix10_En5
  SIGNAL add_add_cast_6                   : signed(11 DOWNTO 0);  -- sfix10_En5
  SIGNAL add_add_cast_7                   : signed(11 DOWNTO 0);  -- sfix10_En5
  SIGNAL add_add_temp_1                   : signed(11 DOWNTO 0);  -- sfix10_En5
  SIGNAL add_add_temp_2                   : signed(11 DOWNTO 0);  -- sfix10_En5
  SIGNAL add_add_temp_3                   : signed(11 DOWNTO 0);  -- sfix10_En5
  SIGNAL add_add_temp_4                   : signed(11 DOWNTO 0);  -- sfix10_E
  SIGNAL add_add_temp_5                   : signed(11 DOWNTO 0);  -- sfix10_En5
  SIGNAL add_add_temp_6                   : signed(11 DOWNTO 0);  -- sfix10_En5
  SIGNAL add1                             : signed(11 DOWNTO 0);  -- sfix10_En5
  SIGNAL add2                             : signed(11 DOWNTO 0);  -- sfix10_En5
  SIGNAL add3                             : signed(11 DOWNTO 0);  -- sfix10_En5
  SIGNAL add4                             : signed(11 DOWNTO 0);  -- sfix10_En5
  SIGNAL add5                             : signed(11 DOWNTO 0);  -- sfix10_En5
  SIGNAL add6                             : signed(11 DOWNTO 0);  -- sfix10_En5
  SIGNAL add_out1                         : signed(8 DOWNTO 0);  -- sfix8_En5
  SIGNAL add11                            : signed(8 DOWNTO 0);  -- sfix8_En5
  SIGNAL add22                            : signed(8 DOWNTO 0);  -- sfix8_En5
  SIGNAL add33                            : signed(8 DOWNTO 0);  -- sfix8_En5
  SIGNAL add44                            : signed(8 DOWNTO 0);  -- sfix8_En5
  SIGNAL add55                            : signed(8 DOWNTO 0);  -- sfix8_En5
  SIGNAL add66                            : signed(8 DOWNTO 0);  -- sfix8_En5
  SIGNAL op_out1                          : std_logic;
  signal c1                               :signed(11 downto 0):="111100000000";
  signal count                            :unsigned(2 downto 0);
BEGIN

 process(clk,rst,start_vn_6) 
 begin
 if(rst='1')then
  L1_signed <= "000000000";
  L2_signed <= "000000000";
  L3_signed <= "000000000";
  L4_signed <= "000000000";
  L5_signed <= "000000000";
  L6_signed <= "000000000";
  Lc_signed <= "000000000";
 elsif(rising_edge(clk) and start_vn_6='1')then
  L1_signed <= signed(L1_6);
  L2_signed <= signed(L2_6);
  L3_signed <= signed(L3_6);
  L4_signed <= signed(L4_6);
  L5_signed <= signed(L5_6);
  L6_signed <= signed(L6_6);
  Lc_signed <= signed(Lc_6);
end if;
end process;
-----------------------------------------------------------------------------------
 process(clk,rst,start_vn_6) 
 begin
 if(rst='1' or start_vn_6='0')then
   count<="000";
 elsif(rising_edge(clk) and start_vn_6='1')then
   count<=count+"001";
 end if;
 end process;
-----------------------------------------------------------------------------------
end_vn_6<='1' when count="001" else '0';
--------------------------------------------------------------------------------
  add_add_cast_1 <= resize(L1_signed, 12);
  add_add_cast_2 <= resize(L2_signed, 12);
  add_add_cast_3 <= resize(L3_signed, 12);
  add_add_cast_4 <= resize(L4_signed, 12);
  add_add_cast_5 <= resize(L5_signed, 12);
  add_add_cast_6 <= resize(L6_signed, 12);
  add_add_cast_7 <= resize(Lc_signed, 12);
  
  add_add_temp_1<= add_add_cast_1 + add_add_cast_2;----L1&L2
  add_add_temp_2 <= add_add_cast_4 + add_add_cast_3;
  add_add_temp_3 <= add_add_cast_6 + add_add_cast_5;
  add_add_temp_4 <= add_add_temp_1 + add_add_temp_2;
  add_add_temp_5 <= add_add_temp_3 + add_add_cast_7;
  add_add_temp_6 <= add_add_temp_4 + add_add_temp_5; -- Somme totale 
--------------------------------------------------------------------------------------------
  add1<=add_add_temp_2+add_add_temp_3+add_add_cast_7+add_add_cast_2;
  add2<=add_add_temp_2+add_add_temp_3+add_add_cast_7+add_add_cast_1;
  add3<=add_add_temp_1+add_add_temp_3+add_add_cast_7+add_add_cast_4; ------------Z3
  add4<=add_add_temp_1+add_add_temp_3+add_add_cast_7+add_add_cast_3;
  add5<=add_add_temp_1+add_add_temp_2+add_add_cast_7+add_add_cast_6;
  add6<=add_add_temp_1+add_add_temp_2+add_add_cast_7+add_add_cast_5;
----------------------------------------------------------------------
    add_out1<=add_add_temp_6(8 downto 0) when (add_add_temp_6>=c1 and add_add_temp_6<"000011111111") 
    else "100000000" when (add_add_temp_6<c1)
    else"011111111";
----------------------------------------------------------------------
    add11<=add1(8 downto 0) when (add1>=c1 and add1<"000011111111") 
    else "100000000" when (add1<c1)
    else"011111111";
-----------------------------------------------------------------------------
    add22<=add2(8 downto 0) when (add2>=c1 and add2<"000011111111") 
    else "100000000" when (add2<c1)
    else"011111111";
-----------------------------------------------------------------------------
    add33<=add3(8 downto 0) when (add3>=c1 and add3<"000011111111") 
    else "100000000" when (add3<c1)
    else"011111111";
-----------------------------------------------------------------------------
    add44<=add4(8 downto 0) when (add4>=c1 and add4<"000011111111") 
    else "100000000" when (add4<c1)
    else"011111111";
-----------------------------------------------------------------------------
    add55<=add5(8 downto 0) when (add5>=c1 and add5<"000011111111") 
    else "100000000" when (add5<c1)
    else"011111111";
-----------------------------------------------------------------------------
    add66<=add6(8 downto 0) when (add6>=c1 and add6<"000011111111") 
    else "100000000" when (add6<c1)
    else"011111111";
-----------------------------------------------------------------------------
  op_out1 <= '1' WHEN add_out1 < to_signed(16#00#, 9) ELSE  '0';
----------------------------------------------------------------------
 process(clk,rst,start_vn_6) 
 begin
 if(rst='1')then
  Z1_6 <= "000000000";
  Z2_6 <= "000000000";
  Z3_6 <= "000000000";
  Z4_6 <= "000000000";
  Z5_6 <= "000000000";
  Z6_6 <= "000000000";
 elsif(rising_edge(clk) and start_vn_6='1')then
  Z1_6 <= std_logic_vector(add11);
  Z2_6 <= std_logic_vector(add22);
  Z3_6 <= std_logic_vector(add33);
  Z4_6 <= std_logic_vector(add44);
  Z5_6 <= std_logic_vector(add55);
  Z6_6 <= std_logic_vector(add66);
END IF;
end process;
  SI_6 <= op_out1;

END rtl;