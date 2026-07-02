# Software PLL - STM32F103C8T6 实验平台

## 零基础操作指南

### 你需要的东西
- STM32F103C8T6 最小系统板（蓝色小板，约10元）
- ST-Link V2 下载器
- USB转TTL 模块（CH340/CP2102，约3元）
- 杜邦线若干

### 接线方法

```
ST-Link → STM32F103C8T6:
  SWCLK → SWCLK (PA14)
  SWDIO → SWDIO (PA13)
  GND   → GND
  3.3V  → 3.3V

USB-TTL → STM32F103C8T6:
  TXD → PA10 (USART1 RX)
  RXD → PA9  (USART1 TX)
  GND → GND

按键 → PA0 (一端接PA0, 一端接GND)
LED  → PC13 (板载LED, 无需额外接线)
```

### 第一步：生成Keil工程

1. 双击 `PLL_F103.ioc`
2. CubeMX自动打开 → 点击顶部 **GENERATE CODE**
3. 等待生成完成 → 点击 **Open Project**
4. Keil5自动打开工程

### 第二步：添加PLL源码

1. 在Keil左侧 Project 窗口右键 → **Add Group** → 命名为 `PLL`
2. 右键 PLL → **Add Existing Files** → 选择 `STM32/PLL/` 下所有 `.c` 文件
3. 右键 Target → **Options for Target** → **C/C++** → **Include Paths** → 添加 `..\PLL`
4. 在 **Define** 栏添加: `ARM_MATH_CM3`

### 第三步：替换main.c用户代码

1. 打开 `main_user_code.h` 查看所有需要添加的代码位置
2. 按注释说明在 `Core/Src/main.c` 中添加对应代码
3. 修改 `Core/Src/stm32f1xx_it.c` 的 `TIM3_IRQHandler`

### 第四步：编译下载

1. 点击 **Build (F7)** 编译
2. 连接ST-Link → 点击 **Download (F8)**
3. 复位开发板

### 第五步：查看串口输出

1. 打开串口助手 (115200, 8N1)
2. 可以看到CSV格式数据输出
3. LED亮起 = PLL已锁定

### 按键操作

- 按一下 PA0 按键 → 切换测试Case
- Case 0: Normal 50Hz
- Case 1: Phase Jump 90°
- Case 2: Frequency Range
- Case 3: Amplitude Change
- Case 4: Noise Injection

---

## 工程结构

```
STM32/
├── PLL_F103.ioc          ← CubeMX工程（双击打开）
├── main_user_code.h      ← 用户代码添加说明
├── README.md             ← 本文件
├── PLL/                  ← PLL算法模块
│   ├── pll.h / pll.c
│   ├── signal_generator.h / signal_generator.c
│   ├── phase_detector.h / phase_detector.c
│   ├── notch_filter.h / notch_filter.c
│   ├── loop_filter.h / loop_filter.c
│   ├── nco.h / nco.c
│   ├── serial_output.h / serial_output.c
│   └── pll_app.h / pll_app.c
├── Core/                 ← CubeMX自动生成
│   ├── Inc/ (main.h, gpio.h, tim.h, usart.h...)
│   └── Src/ (main.c, gpio.c, tim.c, usart.c...)
├── Drivers/              ← HAL库（CubeMX自动生成）
│   ├── CMSIS/
│   └── STM32F1xx_HAL_Driver/
└── MDK-ARM/              ← Keil工程文件
```
