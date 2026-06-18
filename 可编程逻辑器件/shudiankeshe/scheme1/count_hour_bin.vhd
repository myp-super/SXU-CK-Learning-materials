--------------------------------------------------------------------------------
-- 方案一：二进制模24计数器（时计数器）
-- 行为描述方式，输出5位二进制数（0~23）
-- 这是方案一与方案二的核心区别之一
--------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity count_hour_bin is
    port(
        clk, rst, en: in std_logic;
        q: out std_logic_vector(4 downto 0);  -- 5位二进制输出(0~23)
        cout: out std_logic                     -- 进位信号(计数到23时输出1)
    );
end count_hour_bin;

architecture behavioral of count_hour_bin is
    signal count: std_logic_vector(4 downto 0) := "00000";
    signal m_clk: std_logic;
begin
    -- 进位输出：计数到23(10111)且使能有效时，cout=1
    cout <= '1' when (count = "10111" and en = '1') else '0';

    process (rst, clk)
    begin
        m_clk <= clk;
        if (rst = '1') then
            count <= "00000";            -- 异步复位
        elsif (m_clk'event and m_clk = '0') then  -- 下降沿触发
            if (en = '1') then
                if (count = "10111") then   -- 计数到23
                    count <= "00000";        -- 回零
                else
                    count <= count + 1;       -- 二进制加1
                end if;
            end if;
        end if;
    end process;

    q <= count;
end behavioral;
