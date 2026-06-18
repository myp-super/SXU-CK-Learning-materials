--------------------------------------------------------------------------------
-- 方案一：二进制转8421BCD模块
-- 功能：将二进制计数值转换为8421BCD码
-- 支持6位二进制(0~59)和5位二进制(0~23)两种输入
-- 采用行为描述方式，使用除法和取模运算
-- 这是方案一区别于方案二的关键模块
--------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity bin2bcd is
    port(
        bin: in std_logic_vector(5 downto 0);   -- 二进制输入(最大6位)
        mode: in std_logic;                       -- 模式选择：'0'=模60(0~59), '1'=模24(0~23)
        bcd_tens: out std_logic_vector(3 downto 0); -- BCD十位输出
        bcd_ones: out std_logic_vector(3 downto 0)  -- BCD个位输出
    );
end bin2bcd;

architecture behavioral of bin2bcd is
    signal bin_val: integer range 0 to 63;
    signal max_val: integer range 0 to 63;
begin
    bin_val <= conv_integer(bin);
    max_val <= 59 when mode = '0' else 23;

    process(bin_val, mode)
        variable temp: integer range 0 to 63;
        variable tens: integer range 0 to 6;
        variable ones: integer range 0 to 9;
    begin
        temp := bin_val;
        -- 边界保护：确保输入值在合法范围内
        if (mode = '0') then
            if (temp > 59) then
                temp := 0;
            end if;
        else
            if (temp > 23) then
                temp := 0;
            end if;
        end if;

        -- 十进制拆分：十位 = 值/10，个位 = 值 mod 10
        tens := temp / 10;
        ones := temp mod 10;

        -- 输出8421BCD码
        bcd_tens <= conv_std_logic_vector(tens, 4);
        bcd_ones <= conv_std_logic_vector(ones, 4);
    end process;
end behavioral;
