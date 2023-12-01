-- Shift Register 4 bits
-- Done by Ryan Silverberg

library ieee;
use ieee.std_logic_1164.all;

entity sr_4b is
  port (
    clock, shift : in std_logic;
    Q, R: in std_logic_vector(4 downto 0);
  ) ;
end sr_4b;

architecture arch of sr_4b is

begin

    process(shift)
    begin
        if(Clock'EVENT and Clock = '1') then
            Q(0) <= Q(1);
            Q(1) <= Q(2);
            Q(2) <= Q(3);
            Q(3) <= shift;
        end if;
    end process;

end arch ; -- arch