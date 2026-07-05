# STM32温度测控系统 — 研究发现

## 1. STM32F103ZET6关键参数
- 内核：ARM Cortex-M3，72MHz
- Flash：512KB，SRAM：64KB
- GPIO：112个
- 定时器：8个（TIM1-TIM8）
- ADC：3个12位ADC
- 通信：USART×5, SPI×3, I2C×2, FSMC

## 2. DS18B20温度传感器
- 单总线（1-Wire）通信协议
- 测温范围：-55°C ~ +125°C
- 精度：±0.5°C（-10°C ~ +85°C）
- 分辨率：9~12位可配置
- 数据线需4.7kΩ上拉电阻
- 连接引脚：PG9

## 3. LCD DMTFT-28显示屏
- 2.8寸TFT，分辨率320×240
- 驱动IC：ILI9341
- 接口：FSMC 16位并口 / SPI
- 推荐使用FSMC接口获得更快刷新速度
- 背光控制：PWM可调

## 4. PWM控制方案
- 风扇PWM：TIM3_CH1（PA6），频率1kHz
- 电热丝PWM：TIM3_CH2（PA7），频率1kHz
- 占空比范围：0~100%（对应CCR：0~999）
- 温度→PWM映射：分段线性映射

## 5. 按键设定
- KEY_UP：PG8（增加设定温度）
- KEY_DOWN：PG7（减少设定温度）
- 设定温度范围：10°C ~ 40°C
- 步进：1°C/次

## 6. LED指示
- LED_FAN：PC0（风扇工作指示）
- LED_HEAT：PC1（加热工作指示）
- LED_POWER：PC13（系统电源指示）

## 7. 控制策略
- 温度 > 设定温度+0.5°C：风扇模式（电热丝关，风扇开）
- 温度 < 设定温度-0.5°C：加热模式（风扇关，电热丝开）
- |温度-设定温度| ≤ 0.5°C：保持模式（全关）
- PWM占空比 = 基准 + K × |温度偏差|
  - K：风扇模式用K_fan，加热模式用K_heat
  - 最小占空比：10%，最大：100%

## 8. 参考文献收集关键词
中文：STM32温度控制、DS18B20、PWM温控、嵌入式温控系统、ARM Cortex-M3
英文：STM32 temperature control, DS18B20, PWM thermal management, embedded temperature monitoring
