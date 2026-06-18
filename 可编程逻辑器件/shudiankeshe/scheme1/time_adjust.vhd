--------------------------------------------------------------------------------
-- 校时/校分/清零控制模块
-- 功能：统一管理校时、校分和清零操作
--   校时：有效时，时计数器以快速时钟递增
--   校分：有效时，分计数器以快速时钟递增，秒计数器暂停
--   清零：同时按下校时和校分键，所有计数器归零
--------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity time_adjust is
    port(
        clk: in std_logic;              -- 系统时钟
        key_hour_adj: in std_logic;     -- 校时按键
        key_min_adj: in std_logic;      -- 校分按键
        key_clear: in std_logic;        -- 清零按键
        normal_clk: in std_logic;       -- 正常计数时钟
        fast_clk: in std_logic;         -- 快速调节时钟
        sec_cout: in std_logic;         -- 秒进位
        min_cout: in std_logic;         -- 分进位
        min_clk: out std_logic;         -- 分计数时钟
        hour_clk: out std_logic;        -- 时计数时钟
        rst_sec: out std_logic;         -- 秒复位
        rst_min: out std_logic;         -- 分复位
        rst_hour: out std_logic         -- 时复位
    );
end time_adjust;

architecture behavioral of time_adjust is
    signal clear_cond: std_logic;
begin
    -- 清零条件：校时键和校分键同时按下
    clear_cond <= key_hour_adj and key_min_adj;

    -- 分时钟选择：
    --   清零时：停止
    --   校分时：快速时钟（秒暂停）
    --   正常时：秒进位
    min_clk <= '0'      when clear_cond = '1' else
               fast_clk when key_min_adj = '1' else
               sec_cout;

    -- 时时钟选择：
    --   清零时：停止
    --   校时时：快速时钟
    --   正常时：分进位
    hour_clk <= '0'      when clear_cond = '1' else
                fast_clk when key_hour_adj = '1' else
                min_cout;

    -- 复位信号（高有效）
    rst_sec  <= clear_cond or key_clear;
    rst_min  <= clear_cond or key_clear;
    rst_hour <= clear_cond or key_clear;
end behavioral;
