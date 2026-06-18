--------------------------------------------------------------------------------
-- 方案一：二进制模60计数器（秒计数器）
-- 行为描述方式，输出6位二进制数（0~59）
-- 与方案二的BCD计数器不同，本计数器输出纯二进制值
--------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity count_sec_bin is
    port(
        clk, rst, en: in std_logic;
        q: out std_logic_vector(5 downto 0);  -- 6位二进制输出(0~59)
        cout: out std_logic                     -- 进位信号(计数到59时输出1)
    );
end count_sec_bin;

architecture behavioral of count_sec_bin is
    signal count: std_logic_vector(5 downto 0) := "000000";
    signal m_clk: std_logic;
begin
    -- 进位输出：计数到59(111011)且使能有效时，cout=1
    cout <= '1' when (count = "111011" and en = '1') else '0';

    process (rst, clk)
    begin
        m_clk <= clk;
        if (rst = '1') then
            count <= "000000";           -- 异步复位，归零
        elsif (m_clk'event and m_clk = '0') then  -- 下降沿触发
            if (en = '1') then
                if (count = "111011") then  -- 计数到59
                    count <= "000000";       -- 回零
                else
                    count <= count + 1;      -- 二进制加1
                end if;
            end if;
        end if;
    end process;

    q <= count;  -- 输出6位二进制计数值
end behavioral;
