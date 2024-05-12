library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity sr_flipflop is
    Port ( s, r,clk : in STD_LOGIC;
           Q,Qn : inout STD_LOGIC);
end sr_flipflop;

architecture Behavioral of sr_flipflop is
    signal memory : std_logic := '0'; -- Initialize memory signal
begin
    process (clk, s, r)
    begin
        if rising_edge(clk) then
            if s = '0' and r = '0' then
                if memory = '1' then
                    Q <= '1';  -- Set
                    Qn <= '0';
                else
                    Q <= '0';  -- Reset
                    Qn <= '1';
                end if;
            elsif s = '0' and r = '1' then
                Q <= '0';
                Qn <= '1';
            elsif s = '1' and r = '0' then
                Q <= '1';
                Qn <= '0';
            elsif s = '1' and r = '1' then
                Q <= 'Z';
                Qn <= 'Z';
            end if;
        end if;
    end process;

    memory <= Q; -- Update memory after determining Q
end Behavioral;
