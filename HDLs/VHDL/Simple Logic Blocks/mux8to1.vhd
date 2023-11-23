-- Author: Ryan Silverberg

library ieee;
use ieee.std_logic_1154.all;
use ieee.numeric_std.all;

entity mux8to1 is
    port (inputs : in std_logic_vector (7 downto 0);
    select_signal : in std_logic_vector (2 downto 0);
    outputValue : out std_logic;
    );
end entity;

architecture arch of mux8to1 is 

begin
    with select_signal select
        outputValue <= inputs(0) when "000",
        inputs(1) when "001",
        inputs(2) when "010",
        inputs(3) when "011",
        inputs(4) when "100",
        inputs(5) when "101",
        inputs(6) when "110",
        inputs(7) when "111",
        '0' when others;
end arch;
