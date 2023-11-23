-- credit to Jacob Chisholm's Debouncer
-- GitHub: Jchisholm204

-- Done By: Ryan Silverberg

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity debounce is
    generic( clk : integer := 50e6)
    port(inputClk, inputButton : IN std_logic;
        outButton : OUT std_logic);
    end entity;

architecture Behavior of debounce is
    signal counter : integer := 0;
    signal counter_set : std_logic;
    signal flipflops : std_logic_vector(1 downto 0);

    begin
        counter_set <= flipflops(0) xor flipflops(1);

        process(inputClk) is
            begin
                if(rising_edge(inputClk)) then
                    flipflops(1) <= flipflops(0);
                    flipflops(0) <= inputButton;
                    if(counter_set = '1') then
                        counter <= 0;
                    elsif(counter < clk/10e2) then
                        counter <= counter + 1;
                    else
                        outButton <= flipflops(1);
                    end if;
                end if;
        end process;
    end architecture;