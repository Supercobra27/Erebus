-- Credit to Ryan Grant from ELEC 271

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux2to1 is
    PORT(w0, w1, s: IN STD_LOGIC;
         f: OUT STD_LOGIC);
END mux2to1;

ARCHITECTURE Behavior OF mux2to1 IS
BEGIN 
WITH s SELECT
    f <= w0 WHEN '0',
    w1 WHEN OTHERS;
END Behavior;