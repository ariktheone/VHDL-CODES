library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_d_flipflop is
end tb_d_flipflop;

architecture Behavioral of tb_d_flipflop is

    -- Component Declaration for the D Flip-Flop
    component d_flipflop is
        Port (
            Din, clk : in  STD_LOGIC;
            Q        : inout STD_LOGIC;
            Qn       : out STD_LOGIC
        );
    end component;

    -- Signals for Testbench
    signal Din_tb      : STD_LOGIC := '0';  -- Input Din
    signal clk_tb      : STD_LOGIC := '0';  -- Clock signal
    signal Q_tb        : STD_LOGIC;          -- Bidirectional Q
    signal Qn_tb       : STD_LOGIC;          -- Output Qn
    signal memory_tb   : STD_LOGIC := '0';   -- Memory signal

begin

    -- Instantiate the D Flip-Flop
    uut: d_flipflop port map (
        Din => Din_tb,
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
            Din_tb <= '0';
            wait for 10 ns;
            
            Din_tb <= '1';  -- Set input Din
            wait for 10 ns;
            
            Din_tb <= '0';  -- Reset input Din
            wait for 10 ns;
            
            Din_tb <= '1';  -- Set input Din again
            wait for 10 ns;
        end loop;
    end process stimulus_process;

    -- Monitor process to capture memory values
    monitor_process: process
    begin
        wait for 10 ns;  -- Wait for initialization
        loop
            memory_tb <= Q_tb;  -- Capture Q_tb into memory_tb
            wait for 10 ns;      -- Sampling interval
        end loop;
    end process monitor_process;

end Behavioral;
