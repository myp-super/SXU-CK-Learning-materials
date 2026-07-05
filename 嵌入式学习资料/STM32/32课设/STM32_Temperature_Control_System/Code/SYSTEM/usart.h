/**
 ******************************************************************************
 * @file    usart.h
 * @author  山西大学 测控技术与仪器专业
 * @brief   串口驱动 头文件
 * @version V1.0
 * @date    2026-06-17
 ******************************************************************************
 */

#ifndef __USART_H
#define __USART_H

#include "stm32f10x.h"
#include <stdio.h>

/* ==================== 函数声明 ==================== */
void uart_init(uint32_t baud_rate);
void USART1_SendByte(uint8_t data);
void USART1_SendString(char *str);
void USART1_SendData(uint8_t *data, uint16_t len);

#endif /* __USART_H */
