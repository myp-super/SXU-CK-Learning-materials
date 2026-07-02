/**
 * ================================================================
 *  main_user_code.h - 添加到CubeMX生成的main.c中
 * ================================================================
 *
 * 【使用方法】
 * 第1步: 双击 PLL_F103.ioc → CubeMX → GENERATE CODE
 * 第2步: 打开 Core/Src/main.c
 * 第3步: 按下面的位置添加代码
 * 第4步: 把 STM32/PLL/ 目录所有文件添加到Keil工程
 * 第5步: 编译、下载、运行
 * ================================================================
 */

/* ====== 1. USER CODE BEGIN Includes (main.c 顶部) ====== */
#include "pll_app.h"

/* ====== 2. USER CODE BEGIN PV (Private Variables) ====== */
/* (pll_app.c中已定义, 无需额外变量) */

/* ====== 3. USER CODE BEGIN 2 (main函数内, 外设初始化之后) ====== */
  PLL_App_Init();

  /* Start TIM3 (PLL ISR @ 20kHz) */
  HAL_TIM_Base_Start_IT(&htim3);

  /* Print startup info */
  {
      const char *startup = "\r\n=== Software PLL Ready ===\r\n"
                            "Button (PA0): Press to switch test case\r\n"
                            "LED (PC13): ON = PLL Locked\r\n"
                            "Cases: Normal -> PhaseJump -> FreqRange -> AmpChange -> Noise\r\n";
      HAL_UART_Transmit(&huart1, (uint8_t *)startup,
                        strlen(startup), 100);
  }

/* ====== 4. USER CODE BEGIN WHILE (while循环内) ====== */
  while (1)
  {
    PLL_App_MainLoop();

    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */

    /* (空, 所有逻辑在PLL_App_MainLoop中) */

  }
  /* USER CODE END 3 */

/* ====== 5. 修改 stm32f1xx_it.c 中的 TIM3_IRQHandler ====== */
/* 在 stm32f1xx_it.c 文件底部找到:
 * void TIM3_IRQHandler(void)
 * {
 *   HAL_TIM_IRQHandler(&htim3);
 * }
 *
 * 在 HAL_TIM_IRQHandler 之后添加:
 */
/*
void TIM3_IRQHandler(void)
{
  HAL_TIM_IRQHandler(&htim3);
  PLL_App_ISR();   // <--- 添加这一行
}
*/

/* ====== 6. Keil工程配置 ====== */
/*
 * 1. 添加 PLL/ 目录下所有 .c 文件到工程
 * 2. 添加包含路径: ..\PLL
 * 3. 启用 CMSIS-DSP:
 *    Options -> C/C++ -> Define: ARM_MATH_CM3
 *    添加 CMSIS DSP 库: arm_cortexM3l_math.lib
 * 4. Options -> Target -> Use MicroLIB (勾选)
 * 5. Options -> Debug -> ST-Link Debugger
 * 6. 编译、下载
 */
