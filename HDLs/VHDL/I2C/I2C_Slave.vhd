-- Author: Ryan Silverberg
-- Desc: An attempt at building an I2C Protocol inside of VHDL
-- Note: Slave VHDL

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity I2C_Slave is
  port (
    clk, rst, start, stopSlave: in std_logic;
    ack : out std_logic;
    data_in : in std_logic_vector(7 downto 0);
    data_out : in std_logic_vector(7 downto 0)
);
end I2C_Slave;

architecture Behavioral of I2C_Slave is

    signal 

begin

end Behavioral; -- arch