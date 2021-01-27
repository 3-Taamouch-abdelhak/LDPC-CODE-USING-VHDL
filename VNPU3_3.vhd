LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY VNPU3_3 IS
  PORT( start_vn_3,clk,rst                  : std_logic;
        Lc_3                                :   IN    std_logic_vector(8 DOWNTO 0);  -- sfix8_En5
        L1_3                                :   IN    std_logic_vector(8 DOWNTO 0);  -- sfix8_En5
        L2_3                                :   IN    std_logic_vector(8 DOWNTO 0);  -- sfix8_En5
        L3_3                                :   IN    std_logic_vector(8 DOWNTO 0);  -- sfix8_En5
        Z1_3                                :   OUT   std_logic_vector(8 DOWNTO 0);  -- sfix8_En5
        Z2_3                                :   OUT   std_logic_vector(8 DOWNTO 0);  -- sfix8_En5
        Z3_3                                :   OUT   std_logic_vector(8 DOWNTO 0);  -- sfix8_En5
		  SI_3                                :   OUT   std_logic;
		  end_vn_3                            :   OUT   std_logic
        ); 
END VNPU3_3;

ARCHITECTURE rtl OF VNPU3_3 IS

  -- Signals
  SIGNAL L1_signed                        : signed(8 DOWNTO 0);  -- sfix8_En5
  SIGNAL L2_signed                        : signed(8 DOWNTO 0);  -- sfix8_En5
  SIGNAL L3_signed                        : signed(8 DOWNTO 0);  -- sfix8_En5
  SIGNAL Lc_signed                        : signed(8 DOWNTO 0);  -- sfix8_En5
  SIGNAL add_add_cast                     : signed(10 DOWNTO 0);  -- sfix10_En5
  SIGNAL add_add_cast_1                   : signed(10 DOWNTO 0);  -- sfix10_En5
  SIGNAL add_add_temp                     : signed(10 DOWNTO 0);  -- sfix10_En5
  SIGNAL add_add_cast_2                   : signed(10 DOWNTO 0);  -- sfix10_En5
  SIGNAL add_add_temp_1                   : signed(10 DOWNTO 0);  -- sfix10_En5
  SIGNAL add_add_cast_3                   : signed(10 DOWNTO 0);  -- sfix10_En5
  SIGNAL add_add_temp_2,add1,add2,add3    : signed(10 DOWNTO 0);  -- sfix10_En5
  SIGNAL add_out1,add11,add22,add33       : signed(8 DOWNTO 0);  -- sfix8_En5
  SIGNAL op_out1                          : std_logic;
  signal c1                               :signed(10 downto 0):="11100000000";
  signal count                            :unsigned(2 downto 0);
BEGIN

 process(clk,rst,start_vn_3) 
 begin
 if(rst='1')then
  L1_signed <="000000000";
  L2_signed <= "000000000";
  L3_signed <= "000000000";
  Lc_signed <= "000000000";
 elsif(rising_edge(clk) and start_vn_3='1')then
  L1_signed <= signed(L1_3);
  L2_signed <= signed(L2_3);
  L3_signed <= signed(L3_3);
  Lc_signed <= signed(Lc_3);
end if;
end process;
--------------------------------------------------------------------------------
 process(clk,rst,start_vn_3) 
 begin
 if(rst='1' or start_vn_3='0')then
   count<="000";
 elsif(rising_edge(clk) and start_vn_3='1')then
   count<=count+"001";
 end if;
 end process;
--------------------------------------------------------------------------------
end_vn_3<='1' when count="001" else '0';
 
--------------------------------------------------------------------------------
  add_add_cast <= resize(L1_signed, 11);
  add_add_cast_1 <= resize(L2_signed, 11);
  add_add_temp <= add_add_cast + add_add_cast_1;--L1&L2
  add_add_cast_2 <= resize(L3_signed, 11);
  add_add_temp_1 <= add_add_temp + add_add_cast_2;
  add_add_cast_3 <= resize(Lc_signed, 11);
  add_add_temp_2 <= add_add_temp_1 + add_add_cast_3;
  add3<=add_add_temp+add_add_cast_3; ------------Z3
  add2<=add_add_cast+add_add_cast_3+add_add_cast_2; --Z2
  add1<=add_add_cast_1+add_add_cast_2+add_add_cast_3; --Z1
----------------------------------------------------------------------
    add_out1<=add_add_temp_2(8 downto 0) when (add_add_temp_2>=c1 and add_add_temp_2<"00011111111") 
    else "100000000" when (add_add_temp_2<c1)
    else"011111111";
----------------------------------------------------------------------
    add11<=add1(8 downto 0) when (add1>=c1 and add1<"00011111111") 
    else "100000000" when (add1<c1)
    else"011111111";
-----------------------------------------------------------------------------
    add22<=add2(8 downto 0) when (add2>=c1 and add2<"00011111111") 
    else "100000000" when (add2<c1)
    else"011111111";
-----------------------------------------------------------------------------
    add33<=add3(8 downto 0) when (add3>=c1 and add3<"00011111111") 
    else "100000000" when (add3<c1)
    else"011111111";
-----------------------------------------------------------------------------
  op_out1 <= '1' WHEN add_out1 < to_signed(16#00#, 9) ELSE  '0';
-----------------------------------------------------------------------------
 process(clk,rst,start_vn_3) 
 begin
 if(rst='1')then
  Z1_3 <="000000000";
  Z2_3 <= "000000000";
  Z3_3 <= "000000000";
 elsif(rising_edge(clk) and start_vn_3='1')then
  Z1_3 <= std_logic_vector(add11);
  Z2_3 <= std_logic_vector(add22);
  Z3_3 <= std_logic_vector(add33);
END IF;
end process;

SI_3 <= op_out1;

END rtl;