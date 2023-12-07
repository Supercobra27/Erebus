library ieee;
use ieee.std_logic_1164.all;

entity S7P5 is
  port (
    clock, reset, w : in std_logic;
    z : out std_logic
  ) ;
end S7P5;

architecture arch of S7P5 is
        type state_type is (A,B,C,D,E,F);
        signal Y : state_type;
    begin
        process(reset, clock)
            begin
                if reset = '0' then
                    Y <= A;
                elsif(clock'EVENT and clock = '1') then -- state assignment
                    case Y is
                        when A =>
                            if w = '1' then
                                Y <= B;
                            else
                                Y <= A;
                            end if;
                        when B =>
                            if w = '1' then
                                Y <= C;
                            else
                                Y <= E;
                            end if;
                        when C =>
                            if w = '1' then
                                Y <= D;
                            else
                                Y <= E;
                            end if;
                        when D =>
                            if w = '1' then
                                Y <= D;
                            else
                                Y <= E;
                            end if;
                        when E =>
                            if w = '1' then
                                Y <= B;
                            else
                                Y <= E;
                            end if;
                        when F =>
                            if w = '1' then
                                Y <= B;
                            else
                                Y <= A;
                            end if;
                        end case;
                    end if;
                end process;

        process(Y,w)
            begin
                if(clock'EVENT and clock = '1') then -- do not need
                    if(w = '0') then
                        z <= '0';
                    elsif w = '1' and (Y = D or Y = F) then
                        z <= '1';
                    else
                        z <= '0';
                    end if;
                end if;
            end process;
end arch ; -- arch