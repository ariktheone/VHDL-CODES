library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity d_flipflop is
    Port ( Din,clk : in STD_LOGIC;
           Q: inout STD_LOGIC;
           Qn : out STD_LOGIC);
end d_flipflop;

architecture Behavioral of d_flipflop is

signal memory : std_logic := '0'; -- Initialize memory signal
begin
    process (clk, Din)
    begin
        if rising_edge(clk) then
            if Din = '0'  then
                Q <= '0';
                Qn <= '1';
            elsif Din = '1'  then
                Q <= '1';
                Qn <= '0';
            end if;
        end if;
    end process;

    memory <= Q; 


end Behavioral;
