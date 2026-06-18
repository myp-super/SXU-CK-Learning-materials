--------------------------------------------------------------------------------
-- 模块名称 : Seven_Seg_Decoder
-- 功能描述 : 将 4 位 BCD 码转换为共阳极七段数码管段码
-- 段码映射: {g, f, e, d, c, b, a} —— '0' 点亮, '1' 熄灭
--           非法 BCD 码 (10~15) 全部熄灭 (全 '1')
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity Seven_Seg_Decoder is
    port (
        bcd_in  : in  std_logic_vector(3 downto 0);  -- 4 位 BCD 输入 (0~9)
        seg_out : out std_logic_vector(6 downto 0)    -- 7 段码输出 (gfedcba)
    );
end entity Seven_Seg_Decoder;

architecture Behavioral of Seven_Seg_Decoder is
begin
    process (bcd_in)
    begin
        case bcd_in is
            when "0000" => seg_out <= "1000000"; -- 显示 '0'
            when "0001" => seg_out <= "1111001"; -- 显示 '1'
            when "0010" => seg_out <= "0100100"; -- 显示 '2'
            when "0011" => seg_out <= "0110000"; -- 显示 '3'
            when "0100" => seg_out <= "0011001"; -- 显示 '4'
            when "0101" => seg_out <= "0010010"; -- 显示 '5'
            when "0110" => seg_out <= "0000010"; -- 显示 '6'
            when "0111" => seg_out <= "1111000"; -- 显示 '7'
            when "1000" => seg_out <= "0000000"; -- 显示 '8'
            when "1001" => seg_out <= "0010000"; -- 显示 '9'
            when others => seg_out <= "1111111"; -- 非法输入, 全灭
        end case;
    end process;
end architecture Behavioral;
