--------------------------------------------------------------------------------
-- 模块名称 : Clock_Generator
-- 功能描述 : 将 50 MHz 输入时钟分频为 1 Hz 秒脉冲输出
-- 实现策略 : 半周期翻转法 —— 计数器计满 25,000,000 后翻转输出,
--            产生占空比 50% 的 1 Hz 时钟
-- 计数器位宽: 26 bit (2^26 = 67,108,864 > 50,000,000, 确保不溢出)
-- 目标器件 : 任意 FPGA (纯行为级描述, 无器件特定原语)
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Clock_Generator is
    port (
        clk_50MHz : in  std_logic;     -- 外部 50 MHz 有源晶振输入
        reset_n   : in  std_logic;     -- 异步复位, 低电平有效
        clk_1Hz   : out std_logic      -- 1 Hz 秒脉冲输出 (50% 占空比)
    );
end entity Clock_Generator;

architecture Behavioral of Clock_Generator is
    -- 半周期计数值: 50,000,000 / 2 = 25,000,000
    constant HALF_PERIOD : unsigned(25 downto 0) :=
        to_unsigned(25_000_000, 26);
    signal counter    : unsigned(25 downto 0) := (others => '0');
    signal clk_int    : std_logic := '0';  -- 内部时钟信号
begin

    -- +---------------------------------------------------------------+
    -- | 分频进程 : 异步复位 + 同步计数 + 半周期翻转                    |
    -- +---------------------------------------------------------------+
    process (clk_50MHz, reset_n)
    begin
        if reset_n = '0' then
            counter <= (others => '0');
            clk_int <= '0';
        elsif rising_edge(clk_50MHz) then
            if counter = HALF_PERIOD - 1 then
                counter <= (others => '0');
                clk_int <= not clk_int;  -- 每 0.5 s 翻转一次
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    -- 输出驱动
    clk_1Hz <= clk_int;

end architecture Behavioral;
