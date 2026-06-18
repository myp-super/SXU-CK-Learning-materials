--------------------------------------------------------------------------------
-- 方案二：数字钟顶层测试平台
-- 测试内容与方案一相同：
--   1. 正常计数循环
--   2. 校时功能
--   3. 校分功能
--   4. 清零功能
--   5. 整点报时
--------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_clock_top_scheme2 is
end tb_clock_top_scheme2;

architecture testbench of tb_clock_top_scheme2 is

    -- 待测元件（方案二原顶层）
    component clock_top_1 is
        port(
            clk: in std_logic;
            key_sec, key_min, key_hour: in std_logic;
            sec0, sec1: buffer std_logic_vector(3 downto 0);
            min0, min1: buffer std_logic_vector(3 downto 0);
            hour0, hour1: buffer std_logic_vector(3 downto 0);
            key_shift: in std_logic;
            speak: out std_logic
        );
    end component;

    signal clk: std_logic := '0';
    signal key_sec: std_logic := '0';
    signal key_min: std_logic := '0';
    signal key_hour: std_logic := '0';
    signal sec0, sec1: std_logic_vector(3 downto 0);
    signal min0, min1: std_logic_vector(3 downto 0);
    signal hour0, hour1: std_logic_vector(3 downto 0);
    signal key_shift: std_logic := '0';
    signal speak: std_logic;

    constant CLK_PERIOD: time := 20 ns;

    function bcd_to_int(tens, ones: std_logic_vector(3 downto 0)) return integer is
    begin
        return conv_integer(tens) * 10 + conv_integer(ones);
    end function;

begin
    UUT: clock_top_1 port map (
        clk       => clk,
        key_sec   => key_sec,
        key_min   => key_min,
        key_hour  => key_hour,
        sec0      => sec0,
        sec1      => sec1,
        min0      => min0,
        min1      => min1,
        hour0     => hour0,
        hour1     => hour1,
        key_shift => key_shift,
        speak     => speak
    );

    clk_process: process
    begin
        clk <= '0';
        wait for CLK_PERIOD / 2;
        clk <= '1';
        wait for CLK_PERIOD / 2;
    end process;

    stimulus: process
    begin
        key_sec <= '0';
        key_min <= '0';
        key_hour <= '0';
        key_shift <= '0';
        wait for 100 ns;

        -- 测试1：正常计数
        report "========== [方案二] 测试1：正常计数 ==========";
        wait for 5000 ns;

        -- 测试2：校分
        report "========== [方案二] 测试2：校分 ==========";
        key_min <= '1';
        wait for 500 ns;
        key_min <= '0';
        wait for 200 ns;

        -- 测试3：校时
        report "========== [方案二] 测试3：校时 ==========";
        key_hour <= '1';
        wait for 500 ns;
        key_hour <= '0';
        wait for 200 ns;

        -- 测试4：清零（方案二中通过同时按key_min和key_hour实现）
        report "========== [方案二] 测试4：清零 ==========";
        key_min <= '1';
        key_hour <= '1';
        wait for 200 ns;
        key_min <= '0';
        key_hour <= '0';
        wait for 200 ns;

        -- 测试5：整点报时
        report "========== [方案二] 测试5：整点报时 ==========";
        key_min <= '1';
        wait for 10000 ns;
        key_min <= '0';
        wait for 10000 ns;

        -- 测试6：24小时循环
        report "========== [方案二] 测试6：24小时循环 ==========";
        key_hour <= '1';
        wait for 10000 ns;
        key_hour <= '0';
        wait for 50000 ns;

        report "========== [方案二] 所有测试完成 ==========";
        wait;
    end process;

    monitor: process(clk)
        variable prev_sec, prev_min, prev_hour: integer := -1;
        variable cur_sec, cur_min, cur_hour: integer;
    begin
        if (clk'event and clk = '0') then
            cur_sec  := bcd_to_int(sec1, sec0);
            cur_min  := bcd_to_int(min1, min0);
            cur_hour := bcd_to_int(hour1, hour0);

            if (cur_sec /= prev_sec) or (cur_min /= prev_min) or (cur_hour /= prev_hour) then
                if (cur_sec = 0) then
                    report "[方案二] 时间: " &
                        integer'image(cur_hour) & ":" &
                        integer'image(cur_min) & ":" &
                        integer'image(cur_sec);
                end if;
            end if;

            if (speak = '1') then
                report ">>> [方案二] 蜂鸣器触发!";
            end if;

            prev_sec  := cur_sec;
            prev_min  := cur_min;
            prev_hour := cur_hour;
        end if;
    end process;

end testbench;
