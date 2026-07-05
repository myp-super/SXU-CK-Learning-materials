/**
 ******************************************************************************
 * @file    usart.c
 * @author  山西大学 测控技术与仪器专业
 * @brief   USART1串口驱动实现
 * @version V1.0
 * @date    2026-06-17
 ******************************************************************************
 */

#include "usart.h"

/**
 * @brief  USART1初始化
 * @param  baud_rate: 波特率 (如115200, 9600)
 * @retval 无
 */
void uart_init(uint32_t baud_rate)
{
    GPIO_InitTypeDef  GPIO_InitStructure;
    USART_InitTypeDef USART_InitStructure;

    /* 使能USART1和GPIOA时钟 */
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1 | RCC_APB2Periph_GPIOA, ENABLE);

    /* ==================== GPIO配置 ==================== */
    /* PA9 → USART1_TX: 复用推挽输出 */
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_9;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOA, &GPIO_InitStructure);

    /* PA10 → USART1_RX: 浮空输入 */
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_10;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
    GPIO_Init(GPIOA, &GPIO_InitStructure);

    /* ==================== USART1配置 ==================== */
    USART_InitStructure.USART_BaudRate = baud_rate;
    USART_InitStructure.USART_WordLength = USART_WordLength_8b;
    USART_InitStructure.USART_StopBits = USART_StopBits_1;
    USART_InitStructure.USART_Parity = USART_Parity_No;
    USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
    USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
    USART_Init(USART1, &USART_InitStructure);

    /* 使能USART1 */
    USART_Cmd(USART1, ENABLE);
}

/**
 * @brief  USART1发送一个字节
 * @param  data: 待发送字节
 * @retval 无
 */
void USART1_SendByte(uint8_t data)
{
    USART_SendData(USART1, data);
    while (USART_GetFlagStatus(USART1, USART_FLAG_TXE) == RESET);
}

/**
 * @brief  USART1发送字符串
 * @param  str: 字符串指针
 * @retval 无
 */
void USART1_SendString(char *str)
{
    while (*str)
    {
        USART1_SendByte((uint8_t)*str);
        str++;
    }
}

/**
 * @brief  USART1发送指定长度数据
 * @param  data: 数据缓冲区
 * @param  len: 数据长度
 * @retval 无
 */
void USART1_SendData(uint8_t *data, uint16_t len)
{
    uint16_t i;
    for (i = 0; i < len; i++)
    {
        USART1_SendByte(data[i]);
    }
}
