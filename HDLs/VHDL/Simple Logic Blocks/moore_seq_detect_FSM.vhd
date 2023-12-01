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
        elsif

end arch ; -- arch