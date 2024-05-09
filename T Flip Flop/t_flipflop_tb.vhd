library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_t_flipflop is
end tb_t_flipflop;

architecture Behavioral of tb_t_flipflop is

    -- Component Declaration for the T Flip-Flop
    component t_flipflop is
        Port (
            clk : in  STD_LOGIC;
            t   : in  STD_LOGIC;
            Q   : inout STD_LOGIC := '0';
            Qn  : out   STD_LOGIC := '1'
        );
    end component;

    -- Signals for Testbench
    signal clk_tb   : STD_LOGIC := '0';  -- Clock signal
    signal t_tb     : STD_LOGIC := '0';  -- Input T
    signal Q_tb     : STD_LOGIC;          -- Bidirectional Q
    signal Qn_tb    : STD_LOGIC;          -- Output Qn

begin

    -- Instantiate the T Flip-Flop
    uut: t_flipflop port map (
        clk => clk_tb,
        t   => t_tb,
        Q   => Q_tb,
        Qn  => Qn_tb
    );

    -- Clock process
    clk_process: process
    begin
        while now < 1000 ns loop  -- Simulate for 1000 ns
            clk_tb <= not clk_tb;  -- Toggle the clock signal
            wait for 5 ns;         -- Wait for half clock period
        end loop;
        wait;
    end process;

    -- Stimulus process
    stimulus_process: process
    begin
        -- Apply inputs
        t_tb <= '0';
        wait for 20 ns;
        t_tb <= '1';
        wait for 20 ns;
        t_tb <= '0';
        wait for 20 ns;
        t_tb <= '1';
        wait for 20 ns;
        t_tb <= '0';
        wait for 20 ns;
        t_tb <= '1';
        wait for 20 ns;
        t_tb <= '0';
        wait for 20 ns;
        t_tb <= '1';
        wait for 20 ns;
        t_tb <= '0';
        wait for 20 ns;
        wait;
    end process stimulus_process;

end Behavioral;
