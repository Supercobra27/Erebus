-- Author: Ryan Silverberg
-- modulo-8 Down/Up Counter

library ieee;
use ieee.std_logic_1164.all;

entity mod_8 is
  port (
    clk, r, u : std_logic;
    q : buffer (8 downto 0)
  );
end mod_8;

architecture Behavior of ent is
    signal 

begin
    process(clk, r)
        begin
            if r = '1' then
                q <= 0;
            end if;
            if (clk'EVENT and clk = '1') then
                if u = '1' then
                    q <= q + 1;
                elsif u = '0' then
                    q <= q - 1;
                end if;
            end if;
        end process;

end Behavior;