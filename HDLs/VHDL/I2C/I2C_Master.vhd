entity I2C_Master is
  port (
    clk, rst, start, stopMaster : in std_logic;
    ack : out std_logic;
    data_in : in std_logic_vector(7 downto 0);
    data_out : in std_logic_vector(7 downto 0)
  ) ;
end I2C_Master;

architecture Behavioral of I2C_Master is

    signal 

begin

end Behavioral; -- arch