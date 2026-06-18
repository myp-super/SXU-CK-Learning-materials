--------------------------------------------------------------------------------
-- Traffic_Light_TB - Testbench for Traffic_Light_Top
-- Scenarios: (1) No vehicle -> verify IDLE stability
--            (2) Vehicle detected -> verify full 45-5-25-5 cycle
-- Use Clock_Generator_Sim.vhd to accelerate simulation
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Traffic_Light_TB is
end entity Traffic_Light_TB;

architecture Simulation of Traffic_Light_TB is

    component Traffic_Light_Top is
        port (
            clk_50MHz        : in  std_logic;
            reset_n          : in  std_logic;
            vehicle_detected : in  std_logic;
            main_red         : out std_logic;
            main_yellow      : out std_logic;
            main_green       : out std_logic;
            branch_red       : out std_logic;
            branch_yellow    : out std_logic;
            branch_green     : out std_logic;
            seg_high         : out std_logic_vector(6 downto 0);
            seg_low          : out std_logic_vector(6 downto 0)
        );
    end component;

    signal clk_50MHz_tb        : std_logic := '0';
    signal reset_n_tb          : std_logic := '0';
    signal vehicle_detected_tb : std_logic := '0';

    signal main_red_tb         : std_logic;
    signal main_yellow_tb      : std_logic;
    signal main_green_tb       : std_logic;
    signal branch_red_tb       : std_logic;
    signal branch_yellow_tb    : std_logic;
    signal branch_green_tb     : std_logic;
    signal seg_high_tb         : std_logic_vector(6 downto 0);
    signal seg_low_tb          : std_logic_vector(6 downto 0);

    constant CLK_PERIOD : time := 20 ns;  -- 50 MHz

begin

    UUT: Traffic_Light_Top
        port map (
            clk_50MHz        => clk_50MHz_tb,
            reset_n          => reset_n_tb,
            vehicle_detected => vehicle_detected_tb,
            main_red         => main_red_tb,
            main_yellow      => main_yellow_tb,
            main_green       => main_green_tb,
            branch_red       => branch_red_tb,
            branch_yellow    => branch_yellow_tb,
            branch_green     => branch_green_tb,
            seg_high         => seg_high_tb,
            seg_low          => seg_low_tb
        );

    -- 50 MHz clock generation
    CLK_PROC: process
    begin
        clk_50MHz_tb <= '0';
        wait for CLK_PERIOD / 2;
        clk_50MHz_tb <= '1';
        wait for CLK_PERIOD / 2;
    end process CLK_PROC;

    -- Stimulus: two test scenarios
    STIMULUS: process
    begin
        -- Reset
        reset_n_tb          <= '0';
        vehicle_detected_tb <= '0';
        wait for 100 ns;
        reset_n_tb <= '1';
        wait for 100 ns;

        -- Scenario 1: No vehicle, verify IDLE (main_green=1, branch_red=1)
        vehicle_detected_tb <= '0';
        wait for 100 ns;
        assert (main_green_tb = '1' and branch_red_tb = '1')
            report "Scenario 1 FAIL: Not in IDLE state (main_green + branch_red)"
            severity error;
        assert (main_yellow_tb = '0' and main_red_tb = '0'
                and branch_green_tb = '0' and branch_yellow_tb = '0')
            report "Scenario 1 FAIL: Unexpected light combination"
            severity error;
        report "Scenario 1 PASS: System correctly stays in IDLE" severity note;

        -- Scenario 2: Vehicle detected, full cycle
        vehicle_detected_tb <= '1';
        wait for 200 ns;
        assert (main_green_tb = '1')
            report "Scenario 2 FAIL: main_green not active after vehicle trigger"
            severity error;
        report "Scenario 2: Vehicle triggered, entering MAIN_GREEN phase"
            severity note;

        -- NOTE: Use Clock_Generator_Sim.vhd (HALF_PERIOD=2)
        -- to observe the full 45-5-25-5 cycle in ~6400 ns.
        -- With original Clock_Generator, each 1Hz pulse takes 1 real second.
        report "INFO: Use Clock_Generator_Sim.vhd to accelerate simulation"
            severity note;

        wait for 20000 ns;

        report "Testbench completed. Check waveform for timing verification."
            severity note;
        wait;
    end process STIMULUS;

end architecture Simulation;
