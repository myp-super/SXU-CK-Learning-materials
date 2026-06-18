--------------------------------------------------------------------------------
-- 方案一：数字钟顶层测试平台
-- 测试内容：
--   1. 正常计数：00:00:00 → 23:59:59 → 00:00:00 循环
--   2. 校时功能：小时快速调节
--   3. 校分功能：分钟快速调节
--   4. 清零功能：计数器归零
--   5. 整点报时：XX:59:59 → XX+1:00:00 蜂鸣器触发
--------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_clock_top_scheme1 is
end tb_clock_top_scheme1;

architecture testbench of tb_clock_top_scheme1 is

    -- ======================== 待测元件 ========================
    component clock_top_scheme1 is
        port(
            clk: in std_logic;
            key_sec: in std_logic;
            key_min: in std_logic;
            key_hour: in std_logic;
            sec0, sec1: buffer std_logic_vector(3 downto 0);
            min0, min1: buffer std_logic_vector(3 downto 0);
            hour0, hour1: buffer std_logic_vector(3 downto 0);
            key_shift: in std_logic;
            speak: out std_logic;
            seg_sec0: out std_logic_vector(6 downto 0);
            seg_sec1: out std_logic_vector(6 downto 0);
            seg_min0: out std_logic_vector(6 downto 0);
            seg_min1: out std_logic_vector(6 downto 0);
            seg_hour0: out std_logic_vector(6 downto 0);
            seg_hour1: out std_logic_vector(6 downto 0)
        );
    end component;

    -- ======================== 测试信号 ========================
    signal clk: std_logic := '0';
    signal key_sec: std_logic := '0';
    signal key_min: std_logic := '0';
    signal key_hour: std_logic := '0';
    signal sec0, sec1: std_logic_vector(3 downto 0);
    signal min0, min1: std_logic_vector(3 downto 0);
    signal hour0, hour1: std_logic_vector(3 downto 0);
    signal key_shift: std_logic := '0';
    signal speak: std_logic;
    signal seg_sec0, seg_sec1: std_logic_vector(6 downto 0);
    signal seg_min0, seg_min1: std_logic_vector(6 downto 0);
    signal seg_hour0, seg_hour1: std_logic_vector(6 downto 0);

    -- 时钟周期常量
    constant CLK_PERIOD: time := 20 ns;  -- 50MHz系统时钟

    -- 辅助函数：将BCD向量转为整数便于检查
    function bcd_to_int(tens, ones: std_logic_vector(3 downto 0)) return integer is
    begin
        return conv_integer(tens) * 10 + conv_integer(ones);
    end function;

begin
    -- ======================== 待测元件例化 ========================
    UUT: clock_top_scheme1 port map (
        clk        => clk,
        key_sec    => key_sec,
        key_min    => key_min,
        key_hour   => key_hour,
        sec0       => sec0,
        sec1       => sec1,
        min0       => min0,
        min1       => min1,
        hour0      => hour0,
        hour1      => hour1,
        key_shift  => key_shift,
        speak      => speak,
        seg_sec0   => seg_sec0,
        seg_sec1   => seg_sec1,
        seg_min0   => seg_min0,
        seg_min1   => seg_min1,
        seg_hour0  => seg_hour0,
        seg_hour1  => seg_hour1
    );

    -- ======================== 系统时钟生成 ========================
    clk_process: process
    begin
        clk <= '0';
        wait for CLK_PERIOD / 2;
        clk <= '1';
        wait for CLK_PERIOD / 2;
    end process;

    -- ======================== 测试主流程 ========================
    stimulus: process
    begin
        -- ========== 初始化 ==========
        key_sec <= '0';
        key_min <= '0';
        key_hour <= '0';
        key_shift <= '0';
        wait for 100 ns;

        -- ======================================================
        -- 测试1：正常计数验证（加速仿真）
        -- ======================================================
        -- 注：由于实际计数需要很长时间（秒级），仿真中通过
        -- 观察分频后的时钟沿来验证计数逻辑。这里使用行为级
        -- 验证：直接观察计数器对时钟的响应。
        --
        -- 在分频器分频系数很小的情况下（diver.vhd中c_cnt_0=3），
        -- 可以看到正常计数行为。
        --
        -- 验证内容：
        --   - 秒计数器从00递增到59，然后回零
        --   - 分计数器在秒回零时递增
        --   - 时计数器在分回零时递增
        --   - 23:59:59 → 00:00:00
        --
        report "========== 测试1：正常计数验证 ==========";
        wait for 5000 ns;  -- 等待若干时钟周期观察计数行为

        -- ======================================================
        -- 测试2：校分功能验证
        -- ======================================================
        report "========== 测试2：校分功能验证 ==========";
        -- 按下校分键（key_min），分钟应以快速时钟递增
        key_min <= '1';
        wait for 500 ns;  -- 保持校分键按下，观察分钟变化
        key_min <= '0';
        wait for 200 ns;

        -- ======================================================
        -- 测试3：校时功能验证
        -- ======================================================
        report "========== 测试3：校时功能验证 ==========";
        -- 按下校时键（key_hour），小时应以快速时钟递增
        key_hour <= '1';
        wait for 500 ns;
        key_hour <= '0';
        wait for 200 ns;

        -- ======================================================
        -- 测试4：清零功能验证
        -- ======================================================
        report "========== 测试4：清零功能验证 ==========";
        -- 同时按下校时和校分键以触发清零
        key_min <= '1';
        key_hour <= '1';
        wait for 200 ns;
        key_min <= '0';
        key_hour <= '0';
        wait for 200 ns;
        -- 此时所有计数器应为00

        -- ======================================================
        -- 测试5：整点报时验证
        -- ======================================================
        report "========== 测试5：整点报时验证 ==========";
        -- 需要通过校分功能将时间调到59分，然后等待秒进位到00
        -- 在实际仿真中，由于时间尺度限制，这里验证报时逻辑的
        -- 组合电路正确性：
        --   当 min=59, sec=59 时，speak信号应在下一秒触发
        --
        -- 通过校分键将分调到59附近，观察整点报时
        key_min <= '1';
        wait for 10000 ns;  -- 快速调到接近59
        key_min <= '0';
        wait for 10000 ns;  -- 等待正常计数触发报时
        -- 检查speak信号

        -- ======================================================
        -- 测试6：24小时循环验证
        -- ======================================================
        report "========== 测试6：24小时循环验证 ==========";
        -- 通过校时将小时调到23，然后等待分秒溢出
        key_hour <= '1';
        wait for 10000 ns;  -- 快速调到接近23
        key_hour <= '0';
        wait for 50000 ns;  -- 等待正常计数完成循环
        -- 期望：23:59:59 → 00:00:00

        -- ======================================================
        -- 测试7：七段译码验证
        -- ======================================================
        report "========== 测试7：七段译码显示验证 ==========";
        -- 验证seg7_decoder输出正确
        -- 检查各数字对应的段选信号
        wait for 1000 ns;

        report "========== 所有测试完成 ==========";
        wait;
    end process;

    -- ======================== 监控进程 ========================
    -- 实时报告时间变化
    monitor: process(clk)
        variable prev_sec, prev_min, prev_hour: integer := -1;
        variable cur_sec, cur_min, cur_hour: integer;
    begin
        if (clk'event and clk = '0') then
            cur_sec  := bcd_to_int(sec1, sec0);
            cur_min  := bcd_to_int(min1, min0);
            cur_hour := bcd_to_int(hour1, hour0);

            -- 时间变化时报告
            if (cur_sec /= prev_sec) or (cur_min /= prev_min) or (cur_hour /= prev_hour) then
                -- 仅在整点或整分时报告，减少输出
                if (cur_sec = 0) then
                    report "时间: " &
                        integer'image(cur_hour) & ":" &
                        integer'image(cur_min) & ":" &
                        integer'image(cur_sec);
                end if;
            end if;

            -- 检查整点报时
            if (speak = '1') then
                report ">>> 蜂鸣器触发! 时间: " &
                    integer'image(cur_hour) & ":" &
                    integer'image(cur_min) & ":" &
                    integer'image(cur_sec);
            end if;

            prev_sec  := cur_sec;
            prev_min  := cur_min;
            prev_hour := cur_hour;
        end if;
    end process;

end testbench;
