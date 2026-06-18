# FPGA数字钟课程设计项目

## 项目概述

本项目完成了FPGA数字系统设计课程设计——数字钟的完整设计、仿真和报告撰写。

## 项目结构

```
shudiankeshe/
├── 课程设计要求.pptx                          # 课程设计任务书
├── FPGA数字系统设计课程设计模板.docx           # 报告模板
├── FPGA数字钟课程设计报告.docx                 # [最终输出] 完整课程设计报告
├── generate_report.py                         # 报告自动生成脚本
│
├── digitalClock/                              # 方案二（BCD计数器方案）- 原工程
│   ├── clock_top_1.vhd                        #   顶层文件
│   ├── diver.vhd                              #   分频器
│   ├── count_sec.vhd                          #   BCD秒计数器（模60）
│   ├── count_min.vhd                          #   BCD分计数器（模60）
│   ├── count_hour.vhd                         #   BCD时计数器（模24）
│   ├── baoshi.vhd                             #   整点报时模块
│   ├── alarm.vhd                              #   闹钟模块
│   ├── mux21a.vhd                             #   单比特二选一MUX
│   ├── mmux21a.vhd                            #   多比特二选一MUX
│   ├── switch.vhd                             #   模式切换模块
│   ├── trigger.vhd                            #   状态保持触发器
│   └── clock_top_1.qpf/qsf                   #   Quartus项目文件
│
├── scheme1/                                   # [新增] 方案一（二进制计数器方案）
│   ├── clock_top_scheme1.vhd                  #   顶层文件
│   ├── count_sec_bin.vhd                      #   二进制秒计数器（模60）
│   ├── count_min_bin.vhd                      #   二进制分计数器（模60）
│   ├── count_hour_bin.vhd                     #   二进制时计数器（模24）
│   ├── bin2bcd.vhd                            #   二进制→8421BCD转换器
│   ├── seg7_decoder.vhd                       #   七段译码显示模块
│   ├── time_adjust.vhd                        #   校时/校分/清零控制
│   └── clear_debounce.vhd                     #   按键消抖模块
│
└── testbenches/                               # [新增] 仿真测试文件
    ├── tb_clock_top_scheme1.vhd               #   方案一系统级仿真
    ├── tb_clock_top_scheme2.vhd               #   方案二系统级仿真
    ├── tb_bin2bcd.vhd                         #   bin2bcd单元测试
    ├── tb_seg7_decoder.vhd                    #   seg7_decoder单元测试
    └── run_simulation.do                      #   ModelSim批量仿真脚本
```

## 两种方案对比

| 维度 | 方案一（二进制+转换） | 方案二（BCD直出） |
|------|---------------------|-------------------|
| 计数器类型 | 二进制模60/模24计数器 | BCD模60/模24计数器 |
| 数据通路 | 计数器→bin2bcd→seg7→显示 | 计数器→直接BCD显示 |
| 模块数量 | 9个 | 7个 |
| 资源消耗 | 较多（额外转换模块） | 较少 |
| 可扩展性 | 优秀 | 一般 |
| 教学价值 | 高 | 中等 |

## 仿真测试覆盖

- [x] 正常计数 00:00:00 → 23:59:59 → 00:00:00
- [x] 校时功能验证
- [x] 校分功能验证
- [x] 清零功能验证
- [x] 整点报时验证（XX:59:59 → XX+1:00:00）
- [x] bin2bcd模块单元测试
- [x] seg7_decoder模块单元测试

## 使用方法

### Quartus综合
1. 打开 Quartus Prime
2. File → Open Project → 选择 digitalClock/clock_top_1.qpf

### ModelSim仿真
```
cd testbenches
vsim -do run_simulation.do
```

## VHDL源文件统计

- 方案二（原工程）：11个VHDL文件
- 方案一（新增）：8个VHDL文件
- 测试文件：4个VHDL + 1个DO脚本
- 总计：23个VHDL源文件
