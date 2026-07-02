# Software PLL 实验平台 — 零基础操作手册

## 你需要准备

| 物品 | 说明 | 大约价格 |
|------|------|----------|
| STM32F103C8T6 最小系统板 | 蓝色小板 | ~10元 |
| ST-Link V2 下载器 | 4线SWD接口 | ~8元 |
| USB转TTL模块 | CH340或CP2102 | ~3元 |
| 杜邦线 | 母对母 x6 | ~2元 |
| 微动开关+2根线 | 接PA0和GND | ~1元 |

---

## 第一步：MATLAB理论验证（5分钟）

### 1.1 双击运行

```
双击： MATLAB/Run_MATLAB.bat
```

### 1.2 你看到什么

- 自动依次运行4个测试Case
- 弹出4组PNG图片（每个Case一组7张子图）
- 所有图片和数据自动保存到 `MATLAB/figures/` 文件夹

### 1.3 预期结果

| Case | 内容 | 预期结果 |
|------|------|----------|
| Case1 | 90°相位跳变 | 重锁~96ms, 锁定成功 |
| Case2 | 频率48-52Hz范围 | 全部跟踪成功 |
| Case3 | 幅值减半 | 锁定不受影响 |
| Case4 | 噪声20dB | 频率均值50.01Hz |

### 1.4 如果没装MATLAB

跳过此步，直接做第二步。MATLAB图片已经生成在 `MATLAB/figures/` 里，不影响后面STM32和Python实验。

---

## 第二步：STM32工程生成和编译（15分钟）

### 2.1 安装必备软件

| 软件 | 下载地址 |
|------|----------|
| STM32CubeMX | https://www.st.com/stm32cubemx |
| Keil MDK-ARM V5 | https://www.keil.com/download/product/ |
| STM32F1 Packs | Keil中：Pack Installer → STM32F1 |

### 2.2 硬件接线

```
ST-Link → STM32F103C8T6:
  SWCLK  →  SWCLK  (PA14)
  SWDIO  →  SWDIO  (PA13)
  GND    →  GND
  3.3V   →  3.3V

USB-TTL → STM32F103C8T6:
  TXD    →  PA10  (USART1 RX)
  RXD    →  PA9   (USART1 TX)
  GND    →  GND

按键:
  一端接 PA0，另一端接 GND
```

### 2.3 生成Keil工程

```
①  双击 STM32/PLL_F103.ioc
②  CubeMX自动打开
③  点击顶部菜单栏：Project Manager → Toolchain/IDE → 选择 MDK-ARM
④  点击右上角 GENERATE CODE 按钮
⑤  等生成完成 → 点击 Open Project
⑥  Keil5自动打开工程
```

### 2.4 添加PLL源码到工程

```
①  在Keil左侧 Project 窗口，右键 Target →
    Add Group → 输入 "PLL"

②  右键刚创建的 PLL 组 →
    Add Existing Files to Group →
    进入 STM32/PLL/ 文件夹 →
    选中所有 .c 文件（按住Ctrl多选）→ Add

③  右键 Target → Options for Target 'Target1' →
    C/C++(AC6) 标签页 →
    Include Paths 右边 ... 按钮 →
    新建一行 → 输入 ..\PLL → OK

④  同一个窗口，Define 输入框添加：ARM_MATH_CM3

⑤  Target 标签页 → Code Generation →
    勾选 Use MicroLIB
```

### 2.5 修改用户代码

```
①  在Keil中打开 Core/Src/main.c

②  找到 /* USER CODE BEGIN Includes */ 
    在下面添加：
    #include "pll_app.h"

③  找到 /* USER CODE BEGIN 2 */
    在下面添加：
    PLL_App_Init();
    HAL_TIM_Base_Start_IT(&htim3);

④  找到 /* USER CODE BEGIN WHILE */
    在 while(1) 中添加：
    PLL_App_MainLoop();

⑤  在Keil中打开 Core/Src/stm32f1xx_it.c
    找到 void TIM3_IRQHandler(void)
    在 HAL_TIM_IRQHandler(&htim3); 下面添加：
    PLL_App_ISR();
```

### 2.6 编译和下载

```
①  点击 Build (F7) 编译 → 应该0错误0警告
②  点击 Download (F8) 下载到板子
③  按一下板子上的 RESET 键
④  板载LED（PC13）常亮 = PLL已锁定
```

---

## 第三步：Python虚拟示波器（2分钟）

### 3.1 安装Python环境

```
如果没有Python：https://www.python.org/downloads/
安装时勾选 "Add Python to PATH"
```

### 3.2 启动示波器

```
①  把 USB-TTL 模块插到电脑USB口
②  双击 Python/Run_Python.bat
```

首次运行会自动安装依赖（pyserial、matplotlib、numpy），等几十秒。

### 3.3 连接和观察

```
①  GUI窗口打开后：
    - COM口下拉 → 选择USB-TTL对应的COM口（如COM3）
    - 波特率保持 115200
    - 点击 [连接] 按钮

②  连接成功后：
    - 7条曲线开始实时刷新
    - 状态栏显示 "Fo: 50.00 Hz"
    - 绿色圆点 = PLL锁定

③  按STM32板子上的按键（PA0）：
    - 每按一次切换一个测试Case
    - 观察不同Case下的波形变化
    - GUI左上角显示当前Case名称

④  保存数据：
    - [保存CSV] → 保存当前所有数据
    - [保存截图] → 保存当前绘图窗口
```

---

## 第四步：一键验收流程

### 运行全部

```
双击 Start_Project.bat
选择 [3] 全部运行
```

### 验收检查清单

- [ ] MATLAB 4个Case全部通过
- [ ] STM32 LED（PC13）常亮 = PLL锁定
- [ ] Python示波器7条曲线正常刷新
- [ ] 按下按键切换Case，串口收到Case标记
- [ ] 频率显示约50.00Hz
- [ ] 实验报告.docx存在且图表完整

---

## 常见问题

| 问题 | 解决办法 |
|------|----------|
| CubeMX找不到STM32F103C8T6 | 安装STM32F1 Packs：Help → Manage embedded software packages |
| Keil编译报错 "arm_math.h not found" | 确认安装了CMSIS Pack，或手动添加CMSIS路径 |
| Python找不到串口 | 检查USB-TTL驱动(CH340/CP2102)，设备管理器查看COM号 |
| 连接后没有数据 | 检查TX/RX是否交叉连接，波特率是否115200 |
| LED不亮 | 检查接线，按复位键，确认代码下载成功 |
| ST-Link连接失败 | 检查SWCLK/SWIO是否接反，GND是否共地 |

---

## 项目目录

```
PLL CODE/
│
├── Start_Project.bat            ← ① 一键总入口（双击）
├── Generate_Report.py            ← 自动化报告生成
├── README.md                    ← 本文件
│
├── MATLAB/                      ← 理论验证
│   ├── Run_MATLAB.bat           ← ② 双击运行
│   ├── PLL.m                    ← PLL核心算法
│   ├── case1~4_*.m              ← 4个测试Case
│   └── figures/                 ← 输出（PNG+CSV+MAT）
│
├── STM32/                       ← 嵌入式平台
│   ├── PLL_F103.ioc             ← ③ 双击打开CubeMX
│   ├── README.md                ← STM32详细说明
│   ├── main_user_code.h         ← main.c修改指南
│   └── PLL/                     ← PLL算法源码（16个文件）
│
├── Python/                      ← 虚拟示波器
│   ├── Run_Python.bat           ← ④ 双击启动
│   ├── main.py                  ← 示波器主程序
│   └── requirements.txt         ← Python依赖
│
└── Software_PLL_Design_Report.docx  ← ⑤ 最终实验报告
```
