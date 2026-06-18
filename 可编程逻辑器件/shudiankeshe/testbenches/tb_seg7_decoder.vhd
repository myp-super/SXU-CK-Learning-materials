--------------------------------------------------------------------------------
-- 七段译码模块单元测试
-- 验证0~9的译码正确性和非法码处理
--------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_seg7_decoder is
end tb_seg7_decoder;

architecture testbench of tb_seg7_decoder is
    component seg7_decoder is
        port(
            bcd: in std_logic_vector(3 downto 0);
            seg: out std_logic_vector(6 downto 0)
        );
    end component;

    signal bcd: std_logic_vector(3 downto 0) := "0000";
    signal seg: std_logic_vector(6 downto 0);

    -- 预期七段值（共阴极，高有效，gfedcba顺序）
    -- seg(6)=g, seg(5)=f, seg(4)=e, seg(3)=d, seg(2)=c, seg(1)=b, seg(0)=a
    constant SEG_0: std_logic_vector(6 downto 0) := "0111111"; -- abcdef
    constant SEG_1: std_logic_vector(6 downto 0) := "0000110"; -- bc
    constant SEG_2: std_logic_vector(6 downto 0) := "1011011"; -- abdeg
    constant SEG_3: std_logic_vector(6 downto 0) := "1001111"; -- abcdg
    constant SEG_4: std_logic_vector(6 downto 0) := "1100110"; -- bcfg
    constant SEG_5: std_logic_vector(6 downto 0) := "1101101"; -- acdfg
    constant SEG_6: std_logic_vector(6 downto 0) := "1111101"; -- acdefg
    constant SEG_7: std_logic_vector(6 downto 0) := "0000111"; -- abc
    constant SEG_8: std_logic_vector(6 downto 0) := "1111111"; -- abcdefg
    constant SEG_9: std_logic_vector(6 downto 0) := "1101111"; -- abcdfg
    constant SEG_OFF: std_logic_vector(6 downto 0) := "0000000";

    type seg_table_type is array (0 to 15) of std_logic_vector(6 downto 0);
    constant SEG_TABLE: seg_table_type := (
        SEG_0, SEG_1, SEG_2, SEG_3, SEG_4, SEG_5, SEG_6, SEG_7,
        SEG_8, SEG_9, SEG_OFF, SEG_OFF, SEG_OFF, SEG_OFF, SEG_OFF, SEG_OFF
    );

begin
    UUT: seg7_decoder port map (bcd => bcd, seg => seg);

    stimulus: process
    begin
        report "--- 七段译码测试 (0~15) ---";
        for i in 0 to 15 loop
            bcd <= conv_std_logic_vector(i, 4);
            wait for 10 ns;
            assert (seg = SEG_TABLE(i))
                report "BCD=" & integer'image(i) & " seg decode FAILED"
                severity error;
        end loop;

        report "========== seg7_decoder 所有测试通过 ==========";
        wait;
    end process;
end testbench;
