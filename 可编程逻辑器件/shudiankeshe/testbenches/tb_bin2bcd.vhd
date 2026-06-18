--------------------------------------------------------------------------------
-- 二进制转BCD模块单元测试
-- 验证0~59和0~23范围内所有值的转换正确性
--------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_bin2bcd is
end tb_bin2bcd;

architecture testbench of tb_bin2bcd is
    component bin2bcd is
        port(
            bin: in std_logic_vector(5 downto 0);
            mode: in std_logic;
            bcd_tens: out std_logic_vector(3 downto 0);
            bcd_ones: out std_logic_vector(3 downto 0)
        );
    end component;

    signal bin: std_logic_vector(5 downto 0) := "000000";
    signal mode: std_logic := '0';
    signal bcd_tens, bcd_ones: std_logic_vector(3 downto 0);

    -- 预期值检查
    procedure check_bcd(
        test_name: string;
        expected_tens, expected_ones: integer) is
    begin
        assert (conv_integer(bcd_tens) = expected_tens and
                conv_integer(bcd_ones) = expected_ones)
            report test_name & " FAILED: bin=" & integer'image(conv_integer(bin)) &
                   " expected " & integer'image(expected_tens) & integer'image(expected_ones) &
                   " got " & integer'image(conv_integer(bcd_tens)) & integer'image(conv_integer(bcd_ones))
            severity error;
    end procedure;

begin
    UUT: bin2bcd port map (bin => bin, mode => mode, bcd_tens => bcd_tens, bcd_ones => bcd_ones);

    stimulus: process
    begin
        -- ===== 模60模式测试 (mode='0') =====
        mode <= '0';
        report "--- 模60模式测试 (0~59) ---";

        -- 测试边界值
        bin <= "000000"; wait for 10 ns; check_bcd("0", 0, 0);  -- 0
        bin <= "000001"; wait for 10 ns; check_bcd("1", 0, 1);  -- 1
        bin <= "001001"; wait for 10 ns; check_bcd("9", 0, 9);  -- 9
        bin <= "001010"; wait for 10 ns; check_bcd("10", 1, 0); -- 10
        bin <= "010011"; wait for 10 ns; check_bcd("19", 1, 9); -- 19
        bin <= "010100"; wait for 10 ns; check_bcd("20", 2, 0); -- 20
        bin <= "011101"; wait for 10 ns; check_bcd("29", 2, 9); -- 29
        bin <= "011110"; wait for 10 ns; check_bcd("30", 3, 0); -- 30
        bin <= "100111"; wait for 10 ns; check_bcd("39", 3, 9); -- 39
        bin <= "101000"; wait for 10 ns; check_bcd("40", 4, 0); -- 40
        bin <= "110001"; wait for 10 ns; check_bcd("49", 4, 9); -- 49
        bin <= "110010"; wait for 10 ns; check_bcd("50", 5, 0); -- 50
        bin <= "111011"; wait for 10 ns; check_bcd("59", 5, 9); -- 59

        -- 测试越界保护
        bin <= "111100"; wait for 10 ns; -- 60 -> 应为0
        assert (conv_integer(bcd_tens) = 0 and conv_integer(bcd_ones) = 0)
            report "溢出保护测试 FAILED" severity error;

        -- ===== 模24模式测试 (mode='1') =====
        mode <= '1';
        report "--- 模24模式测试 (0~23) ---";

        bin <= "000000"; wait for 10 ns; check_bcd("0", 0, 0);   -- 0
        bin <= "001001"; wait for 10 ns; check_bcd("9", 0, 9);   -- 9
        bin <= "001010"; wait for 10 ns; check_bcd("10", 1, 0);  -- 10
        bin <= "010011"; wait for 10 ns; check_bcd("19", 1, 9);  -- 19
        bin <= "010100"; wait for 10 ns; check_bcd("20", 2, 0);  -- 20
        bin <= "010111"; wait for 10 ns; check_bcd("23", 2, 3);  -- 23

        report "========== bin2bcd 所有测试通过 ==========";
        wait;
    end process;
end testbench;
