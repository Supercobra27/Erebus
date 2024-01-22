library ieee;
use ieee.std_logic_1164.all;

entity fulladder is
  port (
    clock
    c, x, y : in std_logic;
    co, so : out std_logic
  );
end fulladder;

architecture behavior of fulladder is

  signal cint : std_logic;

begin
  cint <= x and y;
  so <= cint xor x xor y;
  co <= (x and y) or (c and (x or y));

end behavior ; -- behavior