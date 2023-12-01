-- Author: Ryan Silverberg

library ieee;
use ieee.std_logic_1164.all;

entity fsm is
  port (
    clock, r, w : in std_logic;
    z : out std_logic
  );
end fsm;

architecture arch of fsm is
    type state_type is (A,B,C);
    signal Y : state_type;
begin
    process(r,clock)
    begin
        if r = '0' then
            y <= A;
        elsif (clock'EVENT and clock = '1') then
          case y is
            when A =>
              if w = '0' then
                y <= A;
              else
                y <= B;
              end if;
            when B =>
              if w = '0' then
                y <= A;
              else
                y  <= C;
              end if;
            when C =>
              if w = '0' then
                y <= A;
              else
                y <= C;
              end if;
            end case;
          end if;
        end process;
    z <= '1' when y = C else '0';
end arch ; -- arch