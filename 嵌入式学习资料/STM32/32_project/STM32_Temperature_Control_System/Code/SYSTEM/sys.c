/**
 ******************************************************************************
 * @file    sys.c
 * @author  山西大学 测控技术与仪器专业
 * @brief   系统基础功能实现
 * @version V1.0
 * @date    2026-06-17
 ******************************************************************************
 */

#include "sys.h"

/**
 * @brief  重定义fputc，使printf输出到USART1
 * @param  ch: 字符
 * @param  f: 文件指针
 * @retval 字符
 */
int fputc(int ch, FILE *f)
{
    while (USART_GetFlagStatus(USART1, USART_FLAG_TXE) == RESET);
    USART_SendData(USART1, (uint8_t)ch);
    return ch;
}

/**
 * @brief  重定义fgetc，使scanf从USART1读取
 * @param  f: 文件指针
 * @retval 读取的字符
 */
int fgetc(FILE *f)
{
    while (USART_GetFlagStatus(USART1, USART_FLAG_RXNE) == RESET);
    return (int)USART_ReceiveData(USART1);
}
