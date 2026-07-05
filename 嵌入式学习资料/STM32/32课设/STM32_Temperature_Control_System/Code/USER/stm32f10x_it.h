/**
 ******************************************************************************
 * @file    stm32f10x_it.h
 * @author  山西大学 测控技术与仪器专业
 * @brief   中断服务函数 头文件
 * @version V1.0
 * @date    2026-06-17
 ******************************************************************************
 */

#ifndef __STM32F10X_IT_H
#define __STM32F10X_IT_H

#include "stm32f10x.h"

/* ==================== 中断服务函数声明 ==================== */
void NMI_Handler(void);
void HardFault_Handler(void);
void MemManage_Handler(void);
void BusFault_Handler(void);
void UsageFault_Handler(void);
void SVC_Handler(void);
void DebugMon_Handler(void);
void PendSV_Handler(void);
void SysTick_Handler(void);

#endif /* __STM32F10X_IT_H */
