--------------------------------------------------------------------------------
-- 模块名称 : BCD_Down_Counter
-- 功能描述 : 两位 BCD 码可预置减计数器, 每个 clk_1Hz 脉冲减 1
-- 接口说明 : load_enable='1' 时装载 load_value; 减至 0 后 count_done 置位
-- 借位规则 : 个位为 0 时向十位借 1, 个位置 9; 十位为 0 时直接保持 0
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BCD_Down_Counter is
    port (
        clk_1Hz      : in  std_logic;                     -- 1 Hz 秒脉冲
        reset_n      : in  std_logic;                     -- 异步复位 (低有效)
        load_enable  : in  std_logic;                     -- 装载使能 ('1'=装载)
        load_value   : in  std_logic_vector(7 downto 0);   -- 预装载 BCD 值
        count_done   : out std_logic;                     -- 计数归零标志
        count_high   : out std_logic_vector(3 downto 0);   -- 十位 BCD 输出
        count_low    : out std_logic_vector(3 downto 0)    -- 个位 BCD 输出
    );
end entity BCD_Down_Counter;

architecture Behavioral of BCD_Down_Counter is
    signal high_bcd : unsigned(3 downto 0) := (others => '0');  -- 十位
    signal low_bcd  : unsigned(3 downto 0) := (others => '0');  -- 个位
begin

    -- +---------------------------------------------------------------+
    -- | BCD 减计数进程 :                                               |
    -- |   load_enable = '1' => 装载 load_value                        |
    -- |   否则每个秒脉冲执行 BCD 减 1, 遵循借位规则                    |
    -- +---------------------------------------------------------------+
    process (clk_1Hz, reset_n)
    begin
        if reset_n = '0' then
            high_bcd <= (others => '0');
            low_bcd  <= (others => '0');
        elsif rising_edge(clk_1Hz) then
            if load_enable = '1' then
                -- 将 std_logic_vector 显式转换为 unsigned 后拆分十位/个位
                high_bcd <= unsigned(load_value(7 downto 4));
                low_bcd  <= unsigned(load_value(3 downto 0));
            else
                -- BCD 借位减 1 逻辑
                if low_bcd = 0 then
                    if high_bcd = 0 then
                        -- 已经是 00, 保持在 00
                        high_bcd <= (others => '0');
                        low_bcd  <= (others => '0');
                    else
                        -- 个位借位: 个位 <- 9, 十位减 1
                        low_bcd  <= to_unsigned(9, 4);
                        high_bcd <= high_bcd - 1;
                    end if;
                else
                    low_bcd <= low_bcd - 1;
                end if;
            end if;
        end if;
    end process;

    -- +---------------------------------------------------------------+
    -- | 组合输出 :                                                      |
    -- |   count_done = '1' 当十位和个位均为 0                          |
    -- |   类型转换: unsigned -> std_logic_vector 供外部互联             |
    -- +---------------------------------------------------------------+
    count_done <= '1' when (high_bcd = 0 and low_bcd = 0) else '0';
    count_high <= std_logic_vector(high_bcd);
    count_low  <= std_logic_vector(low_bcd);

end architecture Behavioral;
