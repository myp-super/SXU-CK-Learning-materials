/**
 ******************************************************************************
 * @file    stm32f10x_conf.h
 * @author  山西大学 测控技术与仪器专业
 * @brief   STM32标准外设库 配置文件
 * @version V1.0
 * @date    2026-06-17
 ******************************************************************************
 */

#ifndef __STM32F10X_CONF_H
#define __STM32F10X_CONF_H

/* 如果使用标准外设库的assert功能 */
/* #define USE_FULL_ASSERT    1 */

/* 包含外设头文件 */
#include "stm32f10x_gpio.h"
#include "stm32f10x_rcc.h"
#include "stm32f10x_tim.h"
#include "stm32f10x_usart.h"
#include "stm32f10x_fsmc.h"
#include "stm32f10x_flash.h"
#include "stm32f10x_exti.h"
#include "stm32f10x_misc.h"

#ifdef USE_FULL_ASSERT
  #define assert_param(expr) ((expr) ? (void)0 : assert_failed((uint8_t *)__FILE__, __LINE__))
  void assert_failed(uint8_t* file, uint32_t line);
#else
  #define assert_param(expr) ((void)0)
#endif

#endif /* __STM32F10X_CONF_H */
