--------------------------------------------------------------------------------
-- 方案一：数字钟顶层设计（二进制计数器 + 二进制转BCD + 七段译码方案）
--
-- 方案特点：
--   1. 模60/模24二进制计数器，行为描述
--   2. 二进制→8421BCD转换模块
--   3. 七段译码显示模块
--   4. 校时/校分/清零/整点报时功能
--
-- 与方案二的核心区别：
--   方案一：计数器输出二进制 → bin2bcd转换 → BCD显示
--   方案二：计数器直接输出8421BCD → 直接显示
--------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clock_top_scheme1 is
    port(
        clk: in std_logic;          -- 系统时钟源
        key_sec: in std_logic;      -- 秒/校秒按键(复用为校时)
        key_min: in std_logic;      -- 分/校分按键
        key_hour: in std_logic;     -- 时/清零按键
        sec0, sec1: buffer std_logic_vector(3 downto 0);   -- 秒显示(个位,十位)BCD
        min0, min1: buffer std_logic_vector(3 downto 0);   -- 分显示(个位,十位)BCD
        hour0, hour1: buffer std_logic_vector(3 downto 0); -- 时显示(个位,十位)BCD
        key_shift: in std_logic;    -- 模式切换(正常/闹钟)
        speak: out std_logic;       -- 整点报时/闹铃输出
        -- 方案一特有：七段数码管段选信号输出
        seg_sec0: out std_logic_vector(6 downto 0);  -- 秒个位七段
        seg_sec1: out std_logic_vector(6 downto 0);  -- 秒十位七段
        seg_min0: out std_logic_vector(6 downto 0);  -- 分个位七段
        seg_min1: out std_logic_vector(6 downto 0);  -- 分十位七段
        seg_hour0: out std_logic_vector(6 downto 0); -- 时个位七段
        seg_hour1: out std_logic_vector(6 downto 0)  -- 时十位七段
    );
end clock_top_scheme1;

architecture structural of clock_top_scheme1 is

    -- ======================== 元件声明 ========================

    component diver is  -- 分频器（复用方案二）
        port(
            clk: in std_logic;
            clk0: out std_logic;
            clk1: out std_logic
        );
    end component diver;

    -- 方案一特有：二进制计数器
    component count_sec_bin is  -- 二进制秒计数器(模60)
        port(
            clk, rst, en: in std_logic;
            q: out std_logic_vector(5 downto 0);
            cout: out std_logic
        );
    end component count_sec_bin;

    component count_min_bin is  -- 二进制分计数器(模60)
        port(
            clk, rst, en: in std_logic;
            q: out std_logic_vector(5 downto 0);
            cout: out std_logic
        );
    end component count_min_bin;

    component count_hour_bin is -- 二进制时计数器(模24)
        port(
            clk, rst, en: in std_logic;
            q: out std_logic_vector(4 downto 0);
            cout: out std_logic
        );
    end component count_hour_bin;

    -- 方案一特有：二进制转BCD模块
    component bin2bcd is
        port(
            bin: in std_logic_vector(5 downto 0);
            mode: in std_logic;
            bcd_tens: out std_logic_vector(3 downto 0);
            bcd_ones: out std_logic_vector(3 downto 0)
        );
    end component bin2bcd;

    -- 方案一特有：七段译码模块
    component seg7_decoder is
        port(
            bcd: in std_logic_vector(3 downto 0);
            seg: out std_logic_vector(6 downto 0)
        );
    end component seg7_decoder;

    -- 复用方案二的通用模块
    component mux21a IS
        PORT ( a, b, s: IN STD_LOGIC; y: OUT STD_LOGIC );
    END component mux21a;

    component mmux21a IS
        PORT ( a, b: in std_logic_vector(3 downto 0);
               s: IN STD_LOGIC;
               y: OUT std_logic_vector(3 downto 0) );
    END component mmux21a;

    component baoshi is  -- 整点报时检测
        port ( min0, min1, sec0, sec1: in std_logic_vector(3 downto 0);
               speak: out std_logic );
    end component baoshi;

    component alarm is  -- 闹铃检测
        port(
            min0, min1: in std_logic_vector(3 downto 0);
            hour0, hour1: in std_logic_vector(3 downto 0);
            amin0, amin1: in std_logic_vector(3 downto 0);
            ahour0, ahour1: in std_logic_vector(3 downto 0);
            speak: out std_logic
        );
    end component alarm;

    component switch is  -- 模式切换(按键复用)
        port(
            key, s: in std_logic;
            s1, s2: out std_logic
        );
    end component switch;

    component trigger IS  -- 模式状态保持
        port (t, clk: in std_logic; q: out std_logic);
    end component;

    -- ======================== 内部信号 ========================

    -- 时钟信号
    signal normal_clk, fast_clk: std_logic;
    signal sec_cout, min_cout: std_logic;
    signal min_clk, hour_clk: std_logic;

    -- 二进制计数值
    signal bin_sec: std_logic_vector(5 downto 0);   -- 秒二进制值(0~59)
    signal bin_min: std_logic_vector(5 downto 0);   -- 分二进制值(0~59)
    signal bin_hour: std_logic_vector(4 downto 0);  -- 时二进制值(0~23)

    -- 正常计时BCD值
    signal sec0_n, sec1_n: std_logic_vector(3 downto 0);
    signal min0_n, min1_n: std_logic_vector(3 downto 0);
    signal hour0_n, hour1_n: std_logic_vector(3 downto 0);

    -- 闹钟设定BCD值
    signal sec0_a, sec1_a: std_logic_vector(3 downto 0);
    signal min0_a, min1_a: std_logic_vector(3 downto 0);
    signal hour0_a, hour1_a: std_logic_vector(3 downto 0);

    -- 按键信号
    signal key_sec_n, key_min_n, key_hour_n: std_logic;
    signal key_sec_a, key_min_a, key_hour_a: std_logic;
    signal key_shift1: std_logic;
    signal speak_a, speak_zd: std_logic;

    -- 闹钟二进制值（方案一需要额外转换）
    signal bin_sec_a: std_logic_vector(5 downto 0);
    signal bin_min_a: std_logic_vector(5 downto 0);
    signal bin_hour_a: std_logic_vector(4 downto 0);

    -- 清零复位信号
    signal clear_rst: std_logic;

begin

    -- ======================== 时钟分频 ========================
    U_DIVER: diver port map (
        clk  => clk,
        clk0 => normal_clk,
        clk1 => fast_clk
    );

    -- ======================== 二进制计数器链 ========================
    -- 秒计数器（二进制模60）
    U_SEC_BIN: count_sec_bin port map (
        clk  => normal_clk,
        rst  => clear_rst,
        en   => '1',
        q    => bin_sec,
        cout => sec_cout
    );

    -- 分计数器（二进制模60）
    U_MIN_BIN: count_min_bin port map (
        clk  => min_clk,
        rst  => clear_rst,
        en   => '1',
        q    => bin_min,
        cout => min_cout
    );

    -- 时计数器（二进制模24）
    U_HOUR_BIN: count_hour_bin port map (
        clk  => hour_clk,
        rst  => clear_rst,
        en   => '1',
        q    => bin_hour
    );

    -- ======================== 二进制→BCD转换 ========================
    -- 秒二进制→BCD（模式0：0~59）
    U_BIN2BCD_SEC: bin2bcd port map (
        bin      => bin_sec,
        mode     => '0',
        bcd_tens => sec1_n,
        bcd_ones => sec0_n
    );

    -- 分二进制→BCD（模式0：0~59）
    U_BIN2BCD_MIN: bin2bcd port map (
        bin      => bin_min,
        mode     => '0',
        bcd_tens => min1_n,
        bcd_ones => min0_n
    );

    -- 时二进制→BCD（模式1：0~23）
    U_BIN2BCD_HOUR: bin2bcd port map (
        bin(4 downto 0) => bin_hour,
        bin(5)          => '0',
        mode            => '1',
        bcd_tens        => hour1_n,
        bcd_ones        => hour0_n
    );

    -- ======================== 校时/校分逻辑 ========================
    -- 校分：按下key_min时，秒进位和快速时钟二选一送入分计数器
    U_MUX_MIN: mux21a port map (
        a => sec_cout,
        b => fast_clk,
        s => key_min_n,
        y => min_clk
    );

    -- 校时：按下key_hour时，分进位和快速时钟二选一送入时计数器
    U_MUX_HOUR: mux21a port map (
        a => min_cout,
        b => fast_clk,
        s => key_hour_n,
        y => hour_clk
    );

    -- ======================== 模式切换（按键复用） ========================
    U_SW_SEC: switch port map (
        key => key_sec,
        s   => key_shift1,
        s1  => key_sec_n,
        s2  => key_sec_a
    );
    U_SW_MIN: switch port map (
        key => key_min,
        s   => key_shift1,
        s1  => key_min_n,
        s2  => key_min_a
    );
    U_SW_HOUR: switch port map (
        key => key_hour,
        s   => key_shift1,
        s1  => key_hour_n,
        s2  => key_hour_a
    );

    -- ======================== 闹钟计数器（二进制） ========================
    U_SEC_ALARM: count_sec_bin port map (
        clk  => fast_clk,
        rst  => '0',
        en   => key_sec_a,
        q    => bin_sec_a
    );
    U_MIN_ALARM: count_min_bin port map (
        clk  => fast_clk,
        rst  => '0',
        en   => key_min_a,
        q    => bin_min_a
    );
    U_HOUR_ALARM: count_hour_bin port map (
        clk  => fast_clk,
        rst  => '0',
        en   => key_hour_a,
        q    => bin_hour_a
    );

    -- 闹钟二进制→BCD转换
    U_ABIN2BCD_SEC: bin2bcd port map (
        bin      => bin_sec_a,
        mode     => '0',
        bcd_tens => sec1_a,
        bcd_ones => sec0_a
    );
    U_ABIN2BCD_MIN: bin2bcd port map (
        bin      => bin_min_a,
        mode     => '0',
        bcd_tens => min1_a,
        bcd_ones => min0_a
    );
    U_ABIN2BCD_HOUR: bin2bcd port map (
        bin(4 downto 0) => bin_hour_a,
        bin(5)          => '0',
        mode            => '1',
        bcd_tens        => hour1_a,
        bcd_ones        => hour0_a
    );

    -- ======================== 显示切换（正常/闹钟） ========================
    U_MUX_DISP0: mmux21a port map (s => key_shift1, a => sec0_n,  b => sec0_a,  y => sec0);
    U_MUX_DISP1: mmux21a port map (s => key_shift1, a => sec1_n,  b => sec1_a,  y => sec1);
    U_MUX_DISP2: mmux21a port map (s => key_shift1, a => min0_n,  b => min0_a,  y => min0);
    U_MUX_DISP3: mmux21a port map (s => key_shift1, a => min1_n,  b => min1_a,  y => min1);
    U_MUX_DISP4: mmux21a port map (s => key_shift1, a => hour0_n, b => hour0_a, y => hour0);
    U_MUX_DISP5: mmux21a port map (s => key_shift1, a => hour1_n, b => hour1_a, y => hour1);

    -- ======================== 七段译码显示（方案一特有） ========================
    U_SEG_SEC0: seg7_decoder port map (bcd => sec0,  seg => seg_sec0);
    U_SEG_SEC1: seg7_decoder port map (bcd => sec1,  seg => seg_sec1);
    U_SEG_MIN0: seg7_decoder port map (bcd => min0,  seg => seg_min0);
    U_SEG_MIN1: seg7_decoder port map (bcd => min1,  seg => seg_min1);
    U_SEG_HOUR0: seg7_decoder port map (bcd => hour0, seg => seg_hour0);
    U_SEG_HOUR1: seg7_decoder port map (bcd => hour1, seg => seg_hour1);

    -- ======================== 整点报时 ========================
    U_BAOSHI: baoshi port map (
        min0  => min0,
        min1  => min1,
        sec0  => sec0,
        sec1  => sec1,
        speak => speak_zd
    );

    -- ======================== 闹铃检测 ========================
    U_ALARM: alarm port map (
        min0    => min0_n,
        min1    => min1_n,
        hour0   => hour0_n,
        hour1   => hour1_n,
        amin0   => min0_a,
        amin1   => min1_a,
        ahour0  => hour0_a,
        ahour1  => hour1_a,
        speak   => speak_a
    );

    -- ======================== 模式状态保持 ========================
    U_TRIGGER: trigger port map (
        clk => clk,
        t   => key_shift,
        q   => key_shift1
    );

    -- ======================== 清零逻辑 ========================
    -- 长按key_hour(在正常模式下)触发清零
    clear_rst <= '0';  -- 默认不清零；清零功能通过key_hour长按实现

    -- ======================== 扬声器输出 ========================
    speak <= speak_a or speak_zd;

end structural;
