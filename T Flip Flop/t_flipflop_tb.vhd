library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_t_flipflop is
end tb_t_flipflop;

architecture Behavioral of tb_t_flipflop is

    -- Component Declaration for the T Flip-Flop
    component t_flipflop is
        Port (
            t   : in  STD_LOGIC;
            Q   : inout STD_LOGIC;
            Qn  : out STD_LOGIC
        );
    end component;

    -- Signals for Testbench
    signal t_tb   : STD_LOGIC := '0';  -- Input T
    signal Q_tb   : STD_LOGIC;          -- Bidirectional Q
    signal Qn_tb  : STD_LOGIC;          -- Output Qn

begin

    -- Instantiate the T Flip-Flop
    uut: t_flipflop port map (
        t   => t_tb,
        Q   => Q_tb,
        Qn  => Qn_tb
    );

    -- Stimulus process
    stimulus_process: process
    begin
        
        -- Apply inputs
        t_tb <= '0';
        wait for 10 ns;
        t_tb <= '1';
        wait for 10 ns;
        t_tb <= '0';
        wait for 10 ns;
        t_tb <= '1';
        wait for 10 ns;
        t_tb <= '0';
        wait for 10 ns;
        t_tb <= '1';
        wait for 10 ns;
        t_tb <= '0';
        wait for 10 ns;
        t_tb <= '1';
        wait for 10 ns;
        t_tb <= '0';
        wait for 10 ns;
        wait;
    end process stimulus_process;

end Behavioral;
