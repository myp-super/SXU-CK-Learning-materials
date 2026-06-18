--------------------------------------------------------------------------------
-- 模块名称 : Clock_Generator_Sim (仿真加速版)
-- 功能描述 : 将 50 MHz 分频为 ~1 Hz, 但计数器阈值大幅缩小以加速仿真
--            HALF_PERIOD = 2 → 每 4 个 50MHz 周期(80 ns)输出一个 1Hz 脉冲
-- 警告     : 此文件仅供仿真使用, 不可综合为实际硬件比特流
-- 使用方式 : 在 ModelSim 或 Quartus II 仿真工程中, 用此文件替代
--            Clock_Generator.vhd 加入文件列表即可
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Clock_Generator is
    port (
        clk_50MHz : in  std_logic;
        reset_n   : in  std_logic;
        clk_1Hz   : out std_logic
    );
end entity Clock_Generator;

architecture Behavioral of Clock_Generator is
    -- 仿真加速: 半周期 = 2, 即每 80 ns 产生一个 1 Hz 脉冲
    constant HALF_PERIOD_SIM : unsigned(25 downto 0) :=
        to_unsigned(2, 26);
    signal counter : unsigned(25 downto 0) := (others => '0');
    signal clk_int : std_logic := '0';
begin
    process (clk_50MHz, reset_n)
    begin
        if reset_n = '0' then
            counter <= (others => '0');
            clk_int <= '0';
        elsif rising_edge(clk_50MHz) then
            if counter = HALF_PERIOD_SIM - 1 then
                counter <= (others => '0');
                clk_int <= not clk_int;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    clk_1Hz <= clk_int;
end architecture Behavioral;
