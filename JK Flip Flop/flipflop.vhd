library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flipflop is
    Port (
        j, k,clk : in STD_LOGIC;
        Q, Qn : inout STD_LOGIC
    );
end flipflop;

architecture Behavioral of flipflop is
    signal memory : std_logic := '0'; -- Initialize memory signal
begin
    process (clk, j, k)
    begin
        if rising_edge(clk) then
            if j = '0' and k = '0' then
                if memory = '1' then
                    Q <= '1';  -- Set
                    Qn <= '0';
                else
                    Q <= '0';  -- Reset
                    Qn <= '1';
                end if;
            elsif j = '0' and k = '1' then
                Q <= '0';
                Qn <= '1';
            elsif j = '1' and k = '0' then
                Q <= '1';
                Qn <= '0';
            elsif j = '1' and k = '1' then
                if memory = '0' then
                    Q <= '1';  -- Set
                    Qn <= '0';
                else
                    Q <= '0';  -- Reset
                    Qn <= '1';
                end if;
            end if;
        end if;
    end process;

    memory <= Q; -- Update memory after determining Q
end Behavioral;
