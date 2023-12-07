-- WIP

library ieee;
use ieee.std_logic_1164.all;

entity ent is
  port (
    clock, reset, w : in std_logic;
    z : out std_logic
  ) ;
end ent;

architecture arch of ent is
    type state_type ();
    signal Y : state_type;
begin

end arch ; -- arch