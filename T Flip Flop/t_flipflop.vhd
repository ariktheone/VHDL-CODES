library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity t_flipflop is
    Port (
        t   : in  STD_LOGIC;
        Q   : inout STD_LOGIC := '0';
        Qn  : out STD_LOGIC := '1'
    );
end t_flipflop;

architecture Behavioral of t_flipflop is
begin
    process (t)
    begin
        if t = '1' then
            if Q = '0' then
                Q  <= '1';
                Qn <= '0';
            elsif Q = '1' then
                Q  <= '0';
                Qn <= '1';
            end if;
        end if;
    end process;
end Behavioral;
