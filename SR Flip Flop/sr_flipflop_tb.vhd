library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_sr_flipflop is
end tb_sr_flipflop;

architecture Behavioral of tb_sr_flipflop is

    -- Component Declaration for the SR Flip-Flop
    component sr_flipflop is
        Port (
            s, r, clk : in  STD_LOGIC;
            Q, Qn    : inout STD_LOGIC
        );
    end component;

    -- Signals for Testbench
    signal s_tb    : STD_LOGIC := '0';  -- Input s
    signal r_tb    : STD_LOGIC := '0';  -- Input r
    signal clk_tb  : STD_LOGIC := '0';  -- Clock signal
    signal Q_tb    : STD_LOGIC;          -- Bidirectional Q
    signal Qn_tb   : STD_LOGIC;          -- Output Qn

begin

    -- Instantiate the SR Flip-Flop
    uut: sr_flipflop port map (
        s   => s_tb,
        r   => r_tb,
        clk => clk_tb,
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
        loop
            -- Apply inputs
            s_tb <= '0';
            r_tb <= '0';
            wait for 10 ns;
            
            s_tb <= '0';
            r_tb <= '1';  -- Reset
            wait for 10 ns;
            
            s_tb <= '1';  -- Set
            r_tb <= '0';
            wait for 10 ns;
            
            s_tb <= '1';  -- Invalid state
            r_tb <= '1';  -- Invalid state
            wait for 10 ns;
        end loop;
    end process stimulus_process;

end Behavioral;
