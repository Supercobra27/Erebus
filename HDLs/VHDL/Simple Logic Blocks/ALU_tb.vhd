-- Author: Ryan Silverberg
-- Guided By: https://www.fpga4student.com/2017/06/vhdl-code-for-arithmetic-logic-unit-alu.html

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ALU_tb is -- do not declare ports because it is a testbench
end ALU_tb;

architecture arch of ALU_tb is

    --Component for UUT (unit under test)
    component ALU port(
        A : in  std_logic_vector(7 downto 0);
        B : in std_logic_vector(7 downto 0);
        ALU_Sel : in  std_logic_vector(3 downto 0);
        ALU_Out : out  std_logic_vector(7 downto 0);
        Carryout : out  std_logic
       );
    end component;

    -- Inputs
    signal A : std_logic_vector(7 downto 0) := (others => '0');
    signal B : std_logic_vector(7 downto 0) := (others => '0');
    signal ALU_Sel : std_logic_vector(3 downto 0) := (others => '0');

    -- Outputs
    signal ALU_Out : std_logic_vector(7 downto 0);
    signal CARRY : std_logic;

    signal i:integer;
    begin

        UUT: ALU port map( --bring in component
            A <= A,
            B <= B,
            ALU_Sel <= ALU_Sel,
            AlU_Out <=ALU_Out
        );

    test_proc: process
        begin
      A <= x"0A";
      B <= x"02";
      ALU_Sel <= x"0";
      
      for i in 0 to 15 loop 
       ALU_Sel <= ALU_Sel + x"1";
       wait for 100 ns;
      end loop;
          A <= x"F6";
      B <= x"0A";
          wait;
    end process;
end arch ;