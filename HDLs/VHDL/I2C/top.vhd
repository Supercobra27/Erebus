-- Author: Ryan Silverberg
-- Desc: An attempt at building an I2C Protocol inside of VHDL

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Master and Slave Required

entity top is
  port (
    SCL, clk, rst: in std_logic; -- Serial Clock Line
    SDA: inout std_logic; -- Serial Data Line
    IO_8 : out std_logic_vector (7 downto 0)
  ) ;
end top;

architecture Behavioral of top is

    signal i2c_add : std_logic_vector (6 downto 0) := x"27"; -- I2C address
    signal master_data_out, master_data_in, slave_data_out, slave_data_in : std_logic_vector(7 downto 0);
    signal master_ack, slave_ack : std_logic;

    component I2C_Master
    port (
      clk, rst, start, stopMaster : in std_logic;
      ack : out std_logic;
      data_in : in std_logic_vector(7 downto 0);
      data_out : in std_logic_vector(7 downto 0);
    );
  end component;
  component I2C_Slave
    port (
      clk, rst, start, stopSlave : in std_logic;
      ack : out std_logic;
      data_in : in std_logic_vector(7 downto 0);
      data_out : in std_logic_vector(7 downto 0);
    );
  end component;
begin
  master_instance : I2C_Master(Behaviorial)
  port map (
    clk => clk,
    rst => rst,
    start => start,
    stopMaster => stopMaster,
    ack => master_ack,
    data_in => slave_data_out,
    data_out => master_data_out
  );

  slave_instance : I2C_Slave(Behaviorial)
  port map (
    clk => clk,
    rst => rst,
    start => start,
    stopSlave => stopSlave,
    ack => slave_ack,
    data_in => master_data_out,
    data_out => slave_data_out
  );

end architecture Behavioral;