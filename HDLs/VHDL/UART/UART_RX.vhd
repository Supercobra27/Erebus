-- UART Protocol
-- Author: Ryan Silverberg

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--

entity UART_RX is
    generic(
        g_clks_per_bit : integer := 115
    );
    port(
        clk : in std_logic;
        rx_serial : in std_logic;
        rx_dv : out std_logic;
        rx_byte : out std_logic_vector(7 downto 0)
    );
end UART_RX;

architecture rtl of UART_RX is

    signal 

begin

end rtl; 