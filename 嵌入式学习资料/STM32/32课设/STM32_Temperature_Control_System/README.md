# STM32单片机温度测控系统

## 山西大学 测控技术与仪器专业 课程设计

---

## 项目概述

本系统以STM32F103ZET6为核心控制器，采用DS18B20数字温度传感器采集环境温度，通过DMTFT-28 LCD显示屏实时显示系统状态，利用两路PWM输出分别控制风扇（降温）和电热丝（加热），实现了闭环温度自动控制。

## 目录结构

```
STM32_Temperature_Control_System/
├── Report/                          # 课程设计报告
│   ├── 测控系统设计与应用实习课程设计.docx
│   └── generate_report.py           # 报告生成脚本
│
├── Code/                            # Keil5工程代码
│   ├── USER/                        # 主程序
│   │   ├── main.c                   # 主控制逻辑
│   │   ├── main.h                   # 主头文件（系统参数定义）
│   │   ├── stm32f10x_conf.h         # 标准外设库配置
│   │   ├── stm32f10x_it.c           # 中断服务函数
│   │   └── stm32f10x_it.h
│   ├── SYSTEM/                      # 系统基础文件
│   │   ├── delay.c/h                # SysTick延时
│   │   ├── sys.c/h                  # 系统支持（位带操作/printf重定向）
│   │   └── usart.c/h                # USART1串口驱动
│   └── HARDWARE/                    # 硬件驱动
│       ├── DS18B20/                 # DS18B20温度传感器（1-Wire协议）
│       ├── LCD/                     # DMTFT-28 LCD（FSMC+ILI9341）
│       ├── PWM/                     # TIM3双通道PWM（风扇+加热）
│       ├── KEY/                     # 按键驱动（消抖）
│       └── LED/                     # LED状态指示
│
├── Diagram/                         # 系统图表
│   ├── 系统总体框图.png
│   ├── 软件流程图.png
│   ├── 电路原理图.png
│   └── PCB连接图.png
│
├── Test/                            # 测试数据
│   ├── 温度变化曲线.png
│   ├── 温度-PWM曲线图.png
│   ├── 系统响应曲线.png
│   └── 测试数据综合图.png
│
└── Literature/                      # 英文文献综述
    └── 英文文献综述.docx
```

## 主要技术参数

| 参数 | 规格 |
|------|------|
| 主控制器 | STM32F103ZET6 (Cortex-M3, 72MHz) |
| 温度传感器 | DS18B20 (±0.5°C, -10~85°C) |
| 显示屏 | DMTFT-28 (ILI9341, 240×320) |
| PWM频率 | 1kHz (PSC=71, ARR=999) |
| PWM分辨率 | 0.1% (10位) |
| 控制模式 | 带滞回的双模式控制 (±0.5°C) |
| 设定温度范围 | 10°C ~ 40°C |

## 引脚分配

| 引脚 | 功能 |
|------|------|
| PA6 | TIM3_CH1 → 风扇PWM输出 |
| PA7 | TIM3_CH2 → 电热丝PWM输出 |
| PA9/PA10 | USART1 TX/RX (调试) |
| PG9 | DS18B20 1-Wire数据线 |
| PG12/PG0/PD4/PD5/PE7-15/PD0-1,14-15 | LCD FSMC接口 |
| PG8/PG7 | KEY_UP/KEY_DOWN |
| PC0/PC1/PC13 | LED_FAN/LED_HEAT/LED_POWER |

## 功能特性

1. **自动温度控制**：根据当前温度与设定温度的偏差自动切换加热/降温/保持模式
2. **PWM比例调节**：占空比随温度偏差线性变化（10%~100%），实现平滑控制
3. **滞回控制**：±0.5°C滞回区间防止频繁切换
4. **LCD实时显示**：当前温度、设定温度、模式、PWM占空比
5. **按键设定**：目标温度±1°C步进可调
6. **LED状态指示**：风扇运行、加热运行、电源状态
7. **串口调试输出**：USART1输出系统状态信息

## 编译说明

1. 使用Keil MDK-ARM V5打开工程
2. 需安装STM32F10x标准外设库 (StdPeriph Library V3.5.0)
3. 需安装ARM CMSIS (Cortex Microcontroller Software Interface Standard)
4. 编译器：ARM Compiler V5 或 V6
5. 下载器：ST-Link / J-Link (SWD接口)

## 开发环境

- IDE：Keil MDK-ARM V5
- 库：STM32 Standard Peripheral Library (非HAL)
- 编译器：ARMCC V5.06
- 调试器：ST-Link V2
- 文档生成：Python 3 + python-docx + matplotlib

## 设计文档章节

1. 摘要（~300字）
2. 关键词（5个）
3. 绪论（≥1000字，含研究背景/国内外现状/STM32优势/研究意义）
4. 设计原理及设计过程
5. 设计方案（两方案比较+最终选择）
6. 设计内容实现与测试（硬件连接/引脚分配/程序流程/测试数据）
7. 项目管理（WBS/甘特图/风险分析/人员分工）
8. 缺点与不足（含改进方案）
9. 分析和总结（≥1000字）
10. 参考文献（20篇，含中英文，GB/T7714格式）
11. 附录A~E

---

**山西大学 物理电子工程学院 测控技术与仪器专业**
