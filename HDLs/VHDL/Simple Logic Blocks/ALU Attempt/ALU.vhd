-- Author: Ryan Silverberg
-- Guided By: https://www.fpga4student.com/2017/06/vhdl-code-for-arithmetic-logic-unit-alu.html

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

-- Has to do all basic math, logic gates, and bitwise

entity ALU is
    generic(
        constant N: natural := 1 -- number of rotated/shifted bits
    );
  port (
    A, B : in std_logic_vector (7 downto 0);
    ALU_out : out std_logic_vector (7 downto 0);
    ALU_sel : in std_logic_vector (3 downto 0);
    CARRY_flag : out std_logic
  );
end ALU;

architecture arch of ALU is

    signal ALU_result : std_logic_vector (7 downto 0);
    signal tmp : std_logic_vector (8 downto 0);

begin
    process(A,B,ALU_sel)
        begin
            case ALU_sel is
                when "0000" =>
                    ALU_result <= A + B;
                when "0001" =>
                    ALU_result <= A - B;
                when "0010" =>
                    ALU_result <= A * B; --need to fix
                when "0011" =>
                    ALU_result <= A / B; -- need to fix
                when "0100" =>
                    ALU_result <= std_logic_vector(unsigned(A) sll N);
                when "0101" =>
                    ALU_result <= std_logic_vector(unsigned(A) srl N);
                when "0110" =>
                    ALU_result <= std_logic_vector(unsigned(A) rol N);
                when "0111" =>
                    ALU_result <= std_logic_vector(unsigned(A) ror N);
                when "1000" =>
                    ALU_result <= A and B;
                when "1001" =>
                    ALU_result <= A or B;
                when "1010" =>
                    ALU_result <= A xor B;
                when "1011" =>
                    ALU_result <= A nor B;
                when "1100" =>
                    ALU_result <= A nand B;
                when "1101" =>
                    ALU_result <= A xnor B;
                when "1110" =>
                    if(A > B) then
                        ALU_result <= x"01";
                    else
                        ALU_result <= x"00";
                    end if;
                when "1111" =>
                    if(A = B) then
                        ALU_result <= x"01";
                    else
                        ALU_result <= x"00";
                    end if;
                when others => ALU_result <= A + B;
            end case;
    end process;
    ALU_out <= ALU_result;
    tmp <= ('0' & A) + ('0' & B);
    CARRY_flag <= tmp(8); 
end arch;