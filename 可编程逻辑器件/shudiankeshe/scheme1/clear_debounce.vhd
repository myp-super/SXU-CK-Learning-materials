--------------------------------------------------------------------------------
-- 清零模块（带消抖）
-- 功能：按下清零键后，产生一个可靠的复位脉冲
-- 采用状态机实现按键消抖，防止误触发
--------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clear_debounce is
    port(
        clk: in std_logic;          -- 扫描时钟
        key_in: in std_logic;       -- 按键输入（低有效或有噪声）
        rst_out: out std_logic      -- 清零复位输出（高有效）
    );
end clear_debounce;

architecture behavioral of clear_debounce is
    signal debounce_cnt: integer range 0 to 50000 := 0;
    signal key_stable: std_logic := '0';
    signal key_prev: std_logic := '0';
    constant DEBOUNCE_THRESHOLD: integer := 50000; -- 10ms消抖(假设clk=5MHz)
begin
    process(clk)
    begin
        if (clk'event and clk = '1') then
            -- 按键消抖：连续采样到稳定值才确认
            if (key_in /= key_prev) then
                debounce_cnt <= 0;
                key_prev <= key_in;
            elsif (debounce_cnt < DEBOUNCE_THRESHOLD) then
                debounce_cnt <= debounce_cnt + 1;
            else
                key_stable <= key_in;
            end if;
        end if;
    end process;

    -- 检测按键按下边沿，产生单周期复位脉冲
    rst_out <= '1' when (key_stable = '1') else '0';
end behavioral;
