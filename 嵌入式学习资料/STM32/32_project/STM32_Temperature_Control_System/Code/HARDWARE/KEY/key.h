/**
 ******************************************************************************
 * @file    key.h
 * @author  山西大学 测控技术与仪器专业
 * @brief   按键驱动 头文件
 * @version V1.0
 * @date    2026-06-17
 ******************************************************************************
 */

#ifndef __KEY_H
#define __KEY_H

#include "stm32f10x.h"
#include "delay.h"

/* ==================== 按键引脚定义 ==================== */
#define KEY_UP_PORT         GPIOG
#define KEY_UP_PIN          GPIO_Pin_8
#define KEY_UP_RCC          RCC_APB2Periph_GPIOG

#define KEY_DOWN_PORT       GPIOG
#define KEY_DOWN_PIN        GPIO_Pin_7
#define KEY_DOWN_RCC        RCC_APB2Periph_GPIOG

/* ==================== 按键返回值 ==================== */
#define KEY_NONE            0
#define KEY_UP_PRESS        1
#define KEY_DOWN_PRESS      2

/* ==================== 按键消抖参数 ==================== */
#define KEY_DEBOUNCE_MS     20    /* 消抖时间 20ms */

/* ==================== 函数声明 ==================== */
void    KEY_Init(void);
uint8_t KEY_Scan(uint8_t mode);

#endif /* __KEY_H */
