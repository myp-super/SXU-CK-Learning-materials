--------------------------------------------------------------------------------
-- ModelSim 仿真脚本
-- 用于编译和运行方案一和方案二的所有仿真
-- 使用方法：在ModelSim中执行 do run_simulation.do
--------------------------------------------------------------------------------

-- ======================== 创建库 ========================
vlib work
vmap work work

-- ======================== 编译方案二（原方案）源文件 ========================
echo ">>> 编译方案二源文件..."
vcom -2002 -work work ../digitalClock/diver.vhd
vcom -2002 -work work ../digitalClock/mux21a.vhd
vcom -2002 -work work ../digitalClock/mmux21a.vhd
vcom -2002 -work work ../digitalClock/switch.vhd
vcom -2002 -work work ../digitalClock/trigger.vhd
vcom -2002 -work work ../digitalClock/baoshi.vhd
vcom -2002 -work work ../digitalClock/alarm.vhd
vcom -2002 -work work ../digitalClock/count_sec.vhd
vcom -2002 -work work ../digitalClock/count_min.vhd
vcom -2002 -work work ../digitalClock/count_hour.vhd
vcom -2002 -work work ../digitalClock/clock_top_1.vhd

-- ======================== 编译方案一源文件 ========================
echo ">>> 编译方案一源文件..."
vcom -2002 -work work ../scheme1/count_sec_bin.vhd
vcom -2002 -work work ../scheme1/count_min_bin.vhd
vcom -2002 -work work ../scheme1/count_hour_bin.vhd
vcom -2002 -work work ../scheme1/bin2bcd.vhd
vcom -2002 -work work ../scheme1/seg7_decoder.vhd
vcom -2002 -work work ../scheme1/clear_debounce.vhd
vcom -2002 -work work ../scheme1/time_adjust.vhd
vcom -2002 -work work ../scheme1/clock_top_scheme1.vhd

-- ======================== 编译测试文件 ========================
echo ">>> 编译测试文件..."
vcom -2002 -work work tb_bin2bcd.vhd
vcom -2002 -work work tb_seg7_decoder.vhd
vcom -2002 -work work tb_clock_top_scheme1.vhd
vcom -2002 -work work tb_clock_top_scheme2.vhd

-- ======================== 运行单元测试 ========================
echo "=========================================="
echo ">>> 运行 bin2bcd 单元测试"
echo "=========================================="
vsim -novopt work.tb_bin2bcd
run -all

echo "=========================================="
echo ">>> 运行 seg7_decoder 单元测试"
echo "=========================================="
vsim -novopt work.tb_seg7_decoder
run -all

-- ======================== 运行方案一顶层仿真 ========================
echo "=========================================="
echo ">>> 运行方案一顶层仿真"
echo "=========================================="
vsim -novopt work.tb_clock_top_scheme1
-- 添加波形
add wave -divider "方案一 - 时钟和按键"
add wave tb_clock_top_scheme1/clk
add wave tb_clock_top_scheme1/key_sec
add wave tb_clock_top_scheme1/key_min
add wave tb_clock_top_scheme1/key_hour
add wave tb_clock_top_scheme1/key_shift
add wave -divider "方案一 - 时间BCD输出"
add wave -hex tb_clock_top_scheme1/hour1
add wave -hex tb_clock_top_scheme1/hour0
add wave -hex tb_clock_top_scheme1/min1
add wave -hex tb_clock_top_scheme1/min0
add wave -hex tb_clock_top_scheme1/sec1
add wave -hex tb_clock_top_scheme1/sec0
add wave -divider "方案一 - 七段输出"
add wave -hex tb_clock_top_scheme1/seg_hour1
add wave -hex tb_clock_top_scheme1/seg_hour0
add wave -hex tb_clock_top_scheme1/seg_min1
add wave -hex tb_clock_top_scheme1/seg_min0
add wave -hex tb_clock_top_scheme1/seg_sec1
add wave -hex tb_clock_top_scheme1/seg_sec0
add wave -divider "方案一 - 报时"
add wave tb_clock_top_scheme1/speak
-- 运行仿真
run 100 us

-- ======================== 运行方案二顶层仿真 ========================
echo "=========================================="
echo ">>> 运行方案二顶层仿真"
echo "=========================================="
vsim -novopt work.tb_clock_top_scheme2
add wave -divider "方案二 - 时钟和按键"
add wave tb_clock_top_scheme2/clk
add wave tb_clock_top_scheme2/key_sec
add wave tb_clock_top_scheme2/key_min
add wave tb_clock_top_scheme2/key_hour
add wave -divider "方案二 - 时间BCD输出"
add wave -hex tb_clock_top_scheme2/hour1
add wave -hex tb_clock_top_scheme2/hour0
add wave -hex tb_clock_top_scheme2/min1
add wave -hex tb_clock_top_scheme2/min0
add wave -hex tb_clock_top_scheme2/sec1
add wave -hex tb_clock_top_scheme2/sec0
add wave -divider "方案二 - 报时"
add wave tb_clock_top_scheme2/speak
run 100 us

echo "=========================================="
echo ">>> 所有仿真完成！"
echo "=========================================="
