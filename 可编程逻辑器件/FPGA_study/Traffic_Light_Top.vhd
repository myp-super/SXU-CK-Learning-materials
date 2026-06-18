--------------------------------------------------------------------------------
-- 模块名称 : Traffic_Light_Top
-- 功能描述 : 顶层集成——例化四个子模块, 完成交通灯控制系统
-- 设计风格 : 纯结构体描述 (Structural), 顶层不含行为逻辑
-- 时钟策略 : 50 MHz → Clock_Generator → 1 Hz → 全系统时基
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Traffic_Light_Top is
    port (
        clk_50MHz        : in  std_logic;      -- 50 MHz 外部晶振
        reset_n          : in  std_logic;      -- 系统复位 (低有效)
        vehicle_detected : in  std_logic;      -- 支干道车辆传感器
        main_red         : out std_logic;      -- 主干道红灯
        main_yellow      : out std_logic;      -- 主干道黄灯
        main_green       : out std_logic;      -- 主干道绿灯
        branch_red       : out std_logic;      -- 支干道红灯
        branch_yellow    : out std_logic;      -- 支干道黄灯
        branch_green     : out std_logic;      -- 支干道绿灯
        seg_high         : out std_logic_vector(6 downto 0); -- 十位段码
        seg_low          : out std_logic_vector(6 downto 0)  -- 个位段码
    );
end entity Traffic_Light_Top;

architecture Structural of Traffic_Light_Top is

    -- ================================================================
    -- 元件声明
    -- ================================================================
    component Clock_Generator is
        port (
            clk_50MHz : in  std_logic;
            reset_n   : in  std_logic;
            clk_1Hz   : out std_logic
        );
    end component;

    component Traffic_Light_FSM is
        port (
            clk_1Hz          : in  std_logic;
            reset_n          : in  std_logic;
            vehicle_detected : in  std_logic;
            count_done       : in  std_logic;
            main_red         : out std_logic;
            main_yellow      : out std_logic;
            main_green       : out std_logic;
            branch_red       : out std_logic;
            branch_yellow    : out std_logic;
            branch_green     : out std_logic;
            counter_en       : out std_logic;
            load_value       : out std_logic_vector(7 downto 0)
        );
    end component;

    component BCD_Down_Counter is
        port (
            clk_1Hz     : in  std_logic;
            reset_n     : in  std_logic;
            load_enable : in  std_logic;
            load_value  : in  std_logic_vector(7 downto 0);
            count_done  : out std_logic;
            count_high  : out std_logic_vector(3 downto 0);
            count_low   : out std_logic_vector(3 downto 0)
        );
    end component;

    component Seven_Seg_Decoder is
        port (
            bcd_in  : in  std_logic_vector(3 downto 0);
            seg_out : out std_logic_vector(6 downto 0)
        );
    end component;

    -- ================================================================
    -- 内部互连信号声明 (所有信号名均具备自解释性)
    -- ================================================================
    signal clk_1Hz_int       : std_logic;                      -- 1 Hz 时基
    signal count_done_int    : std_logic;                      -- 计数归零
    signal counter_en_int    : std_logic;                      -- 装载使能
    signal load_value_int    : std_logic_vector(7 downto 0);    -- BCD 装载值
    signal count_high_int    : std_logic_vector(3 downto 0);    -- 十位 BCD
    signal count_low_int     : std_logic_vector(3 downto 0);    -- 个位 BCD

begin

    -- ================================================================
    -- 子模块例化
    -- ================================================================

    -- 时钟分频器 : 50 MHz → 1 Hz
    U_CLK_GEN: Clock_Generator
        port map (
            clk_50MHz => clk_50MHz,
            reset_n   => reset_n,
            clk_1Hz   => clk_1Hz_int
        );

    -- 三段式状态机控制器
    U_FSM: Traffic_Light_FSM
        port map (
            clk_1Hz          => clk_1Hz_int,
            reset_n          => reset_n,
            vehicle_detected => vehicle_detected,
            count_done       => count_done_int,
            main_red         => main_red,
            main_yellow      => main_yellow,
            main_green       => main_green,
            branch_red       => branch_red,
            branch_yellow    => branch_yellow,
            branch_green     => branch_green,
            counter_en       => counter_en_int,
            load_value       => load_value_int
        );

    -- BCD 减计数器
    U_COUNTER: BCD_Down_Counter
        port map (
            clk_1Hz     => clk_1Hz_int,
            reset_n     => reset_n,
            load_enable => counter_en_int,
            load_value  => load_value_int,
            count_done  => count_done_int,
            count_high  => count_high_int,
            count_low   => count_low_int
        );

    -- 十位七段译码器
    U_SEG_HIGH: Seven_Seg_Decoder
        port map (
            bcd_in  => count_high_int,
            seg_out => seg_high
        );

    -- 个位七段译码器
    U_SEG_LOW: Seven_Seg_Decoder
        port map (
            bcd_in  => count_low_int,
            seg_out => seg_low
        );

end architecture Structural;
