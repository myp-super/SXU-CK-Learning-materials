--------------------------------------------------------------------------------
-- 方案一：七段译码显示模块
-- 功能：将4位8421BCD码转换为七段数码管显示信号
-- 支持0~9的正常显示，非法码熄灭
-- 共阴极数码管（段选信号高电平有效）
--------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity seg7_decoder is
    port(
        bcd: in std_logic_vector(3 downto 0);   -- 8421BCD码输入
        seg: out std_logic_vector(6 downto 0)   -- 七段输出(gfedcba顺序，高有效)
    );
end seg7_decoder;

architecture behavioral of seg7_decoder is
    signal seg_out: std_logic_vector(6 downto 0);
begin
    -- 七段译码：BCD码 → 七段显示
    -- 段顺序：seg(6)=g, seg(5)=f, seg(4)=e, seg(3)=d, seg(2)=c, seg(1)=b, seg(0)=a
    -- 共阴极：高电平点亮
    process(bcd)
    begin
        case bcd is
            when "0000" => seg_out <= "0111111"; -- 0: abcdef
            when "0001" => seg_out <= "0000110"; -- 1: bc
            when "0010" => seg_out <= "1011011"; -- 2: abdeg
            when "0011" => seg_out <= "1001111"; -- 3: abcdg
            when "0100" => seg_out <= "1100110"; -- 4: bcfg
            when "0101" => seg_out <= "1101101"; -- 5: acdfg
            when "0110" => seg_out <= "1111101"; -- 6: acdefg
            when "0111" => seg_out <= "0000111"; -- 7: abc
            when "1000" => seg_out <= "1111111"; -- 8: abcdefg
            when "1001" => seg_out <= "1101111"; -- 9: abcdfg
            when others => seg_out <= "0000000"; -- 非法码熄灭
        end case;
    end process;

    seg <= seg_out;
end behavioral;
