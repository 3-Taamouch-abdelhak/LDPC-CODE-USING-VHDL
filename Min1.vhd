
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Min1 IS
  PORT(
        in0                               :   IN    std_logic_vector(8 DOWNTO 0);  -- ufix9_En5
        in1                               :   IN    std_logic_vector(8 DOWNTO 0);  -- ufix9_En5
        out0                              :   OUT   std_logic_vector(8 DOWNTO 0)  -- ufix9_En5
        );
END Min1;
ARCHITECTURE rtl OF Min1 IS

  -- Signals
  SIGNAL a,b                      : unsigned(8 DOWNTO 0);  -- ufix9_En5 [2]
  SIGNAL c                        : unsigned(8 DOWNTO 0);  -- ufix9_En5

BEGIN
  a<= unsigned(in0);
  b<= unsigned(in1);

  ----Tree min implementation ----
  ----Tree min stage 1 ----
 
  c <= a WHEN a <= b ELSE b;
  out0 <= std_logic_vector(c);


END rtl;