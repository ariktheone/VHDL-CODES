library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flipflop_tb is
end flipflop_tb;

architecture tb_arch of flipflop_tb is
    -- Signals for testbench
    signal j, k, clk : std_logic := '0';
    signal Q, Qn : std_logic;

    -- Component declaration
    component flipflop
        Port (
            j, k, clk : in STD_LOGIC;
            Q, Qn : inout STD_LOGIC
        );
    end component;

begin
    -- Instantiate the flip-flop
    FF_inst : flipflop
        port map (
            j => j,
            k => k,
            clk => clk,
            Q => Q,
            Qn => Qn
        );

    -- Stimulus process
    stimulus: process
    begin
        -- Apply reset
        j <= '0';
        k <= '1';
        clk <= '0';
        wait for 50 ns;

        -- Release reset
        j <= '0';
        k <= '0';
        wait for 50 ns;

        -- Set Q to '1' on the rising edge of the clock
        j <= '1';
        k <= '0';
        clk <= '0';
        wait for 50 ns;
        clk <= '1';
        wait for 50 ns;

        -- Reset Q to '0' on the rising edge of the clock
        j <= '0';
        k <= '1';
        clk <= '0';
        wait for 50 ns;
        clk <= '1';
        wait for 50 ns;

        -- Toggle Q on the rising edge of the clock
        j <= '1';
        k <= '1';
        clk <= '0';
        wait for 50 ns;
        clk <= '1';
        wait for 50 ns;

        -- Repeat or add additional test cases as needed

        -- End simulation
        wait;
    end process;

end tb_arch;
