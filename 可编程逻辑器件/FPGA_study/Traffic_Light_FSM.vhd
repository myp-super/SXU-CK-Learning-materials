--------------------------------------------------------------------------------
-- 模块名称 : Traffic_Light_FSM
-- 功能描述 : 三段式 Moore 型有限状态机, 控制十字路口交通灯时序
-- 设计要点 :
--   (1) 三段式结构: STATE_REG(时序) + NEXT_STATE_LOGIC(组合)
--       + OUTPUT_LOGIC(时序) —— 输出寄存器隔离组合毛刺
--   (2) 独热码 (One-Hot) 状态编码, 译码路径最短
--   (3) 绿灯高电平有效 ('1' = 点亮)
--   (4) 使用 numeric_std 替代 std_logic_unsigned
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Traffic_Light_FSM is
    port (
        clk_1Hz          : in  std_logic;                     -- 1 Hz 时基
        reset_n          : in  std_logic;                     -- 异步复位(低有效)
        vehicle_detected : in  std_logic;                     -- 支干道车辆传感器
        count_done       : in  std_logic;                     -- 计数器归零标志
        main_red         : out std_logic;                     -- 主干道红灯
        main_yellow      : out std_logic;                     -- 主干道黄灯
        main_green       : out std_logic;                     -- 主干道绿灯
        branch_red       : out std_logic;                     -- 支干道红灯
        branch_yellow    : out std_logic;                     -- 支干道黄灯
        branch_green     : out std_logic;                     -- 支干道绿灯
        counter_en       : out std_logic;                     -- 计数器装载使能
        load_value       : out std_logic_vector(7 downto 0)   -- 预装载值(BCD)
    );
end entity Traffic_Light_FSM;

architecture Three_Process of Traffic_Light_FSM is

    -- ================================================================
    -- 状态定义 —— 独热码 (One-Hot Encoding)
    -- ================================================================
    type state_type is (
        ST_IDLE,            -- 初始/等待: 主干绿, 支干红
        ST_MAIN_GREEN,      -- 主干绿 45 s
        ST_MAIN_YELLOW,     -- 主干黄  5 s
        ST_BRANCH_GREEN,    -- 支干绿 25 s
        ST_BRANCH_YELLOW    -- 支干黄  5 s
    );

    signal current_state : state_type := ST_IDLE;
    signal next_state    : state_type := ST_IDLE;

    -- 计时参数定义 (BCD 编码)
    constant TIME_MAIN_GREEN    : std_logic_vector(7 downto 0) := "01000101"; -- 45
    constant TIME_MAIN_YELLOW   : std_logic_vector(7 downto 0) := "00000101"; --  5
    constant TIME_BRANCH_GREEN  : std_logic_vector(7 downto 0) := "00100101"; -- 25
    constant TIME_BRANCH_YELLOW : std_logic_vector(7 downto 0) := "00000101"; --  5

begin

    -- ================================================================
    -- 进程 1 : STATE_REG —— 状态寄存器 (时序逻辑 + 异步复位)
    -- ================================================================
    STATE_REG: process (clk_1Hz, reset_n)
    begin
        if reset_n = '0' then
            current_state <= ST_IDLE;
        elsif rising_edge(clk_1Hz) then
            current_state <= next_state;
        end if;
    end process STATE_REG;

    -- ================================================================
    -- 进程 2 : NEXT_STATE_LOGIC —— 次态译码 (纯组合逻辑)
    -- ================================================================
    NEXT_STATE_LOGIC: process (current_state, vehicle_detected, count_done)
    begin
        -- 默认保持当前状态 (避免综合出锁存器)
        next_state <= current_state;

        case current_state is
            when ST_IDLE =>
                -- 检测到车辆 → 启动主干绿灯计时
                if vehicle_detected = '1' then
                    next_state <= ST_MAIN_GREEN;
                end if;

            when ST_MAIN_GREEN =>
                -- 45 s 倒计时结束 → 主干黄灯
                if count_done = '1' then
                    next_state <= ST_MAIN_YELLOW;
                end if;

            when ST_MAIN_YELLOW =>
                -- 5 s 倒计时结束 → 支干绿灯
                if count_done = '1' then
                    next_state <= ST_BRANCH_GREEN;
                end if;

            when ST_BRANCH_GREEN =>
                -- 25 s 倒计时结束 → 支干黄灯
                if count_done = '1' then
                    next_state <= ST_BRANCH_YELLOW;
                end if;

            when ST_BRANCH_YELLOW =>
                -- 5 s 倒计时结束 → 回到 ST_IDLE 等待
                if count_done = '1' then
                    next_state <= ST_IDLE;
                end if;

            when others =>
                next_state <= ST_IDLE;
        end case;
    end process NEXT_STATE_LOGIC;

    -- ================================================================
    -- 进程 3 : OUTPUT_LOGIC —— 输出寄存器 (时序逻辑, 抑制毛刺)
    --           绿灯高电平有效, 与教师示例极性相反
    -- ================================================================
    OUTPUT_LOGIC: process (clk_1Hz, reset_n)
    begin
        if reset_n = '0' then
            main_red      <= '0';
            main_yellow   <= '0';
            main_green    <= '0';
            branch_red    <= '0';
            branch_yellow <= '0';
            branch_green  <= '0';
            counter_en    <= '0';
            load_value    <= (others => '0');
        elsif rising_edge(clk_1Hz) then
            -- 默认值 —— 避免隐式保持, 确保综合行为确定
            main_red      <= '0';
            main_yellow   <= '0';
            main_green    <= '0';
            branch_red    <= '0';
            branch_yellow <= '0';
            branch_green  <= '0';
            counter_en    <= '0';
            load_value    <= (others => '0');

            case current_state is
                when ST_IDLE =>
                    -- 主干绿, 支干红 (默认放行)
                    main_green   <= '1';
                    branch_red   <= '1';
                    -- 不启动计时器, 等待车辆触发
                    counter_en   <= '0';

                when ST_MAIN_GREEN =>
                    -- 主干绿, 支干红 (45 s 倒计时中)
                    main_green   <= '1';
                    branch_red   <= '1';
                    counter_en   <= '1';
                    load_value   <= TIME_MAIN_GREEN;

                when ST_MAIN_YELLOW =>
                    -- 主干黄, 支干红 (5 s 过渡)
                    main_yellow  <= '1';
                    branch_red   <= '1';
                    counter_en   <= '1';
                    load_value   <= TIME_MAIN_YELLOW;

                when ST_BRANCH_GREEN =>
                    -- 主干红, 支干绿 (25 s 放行)
                    main_red     <= '1';
                    branch_green <= '1';
                    counter_en   <= '1';
                    load_value   <= TIME_BRANCH_GREEN;

                when ST_BRANCH_YELLOW =>
                    -- 主干红, 支干黄 (5 s 过渡)
                    main_red     <= '1';
                    branch_yellow<= '1';
                    counter_en   <= '1';
                    load_value   <= TIME_BRANCH_YELLOW;

                when others =>
                    null;  -- 安全回退, 全部输出保持默认 '0'
            end case;
        end if;
    end process OUTPUT_LOGIC;

end architecture Three_Process;
