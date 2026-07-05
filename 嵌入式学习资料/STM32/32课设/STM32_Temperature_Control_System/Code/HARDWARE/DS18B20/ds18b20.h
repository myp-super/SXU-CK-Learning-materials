/**
 ******************************************************************************
 * @file    ds18b20.h
 * @author  山西大学 测控技术与仪器专业
 * @brief   DS18B20温度传感器驱动 头文件
 * @version V1.0
 * @date    2026-06-17
 ******************************************************************************
 */

#ifndef __DS18B20_H
#define __DS18B20_H

#include "stm32f10x.h"
#include "delay.h"

/* ==================== DS18B20 引脚定义 ==================== */
#define DS18B20_PORT            GPIOG
#define DS18B20_PIN             GPIO_Pin_9
#define DS18B20_RCC_PORT        RCC_APB2Periph_GPIOG

/* ==================== DS18B20 输入/输出模式切换 ==================== */
#define DS18B20_DQ_OUT()        {                           \
    GPIO_InitTypeDef GPIO_InitStructure;                     \
    GPIO_InitStructure.GPIO_Pin = DS18B20_PIN;               \
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;        \
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;       \
    GPIO_Init(DS18B20_PORT, &GPIO_InitStructure);            \
}

#define DS18B20_DQ_IN()         {                           \
    GPIO_InitTypeDef GPIO_InitStructure;                     \
    GPIO_InitStructure.GPIO_Pin = DS18B20_PIN;               \
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;            \
    GPIO_Init(DS18B20_PORT, &GPIO_InitStructure);             \
}

/* ==================== DS18B20 引脚操作 ==================== */
#define DS18B20_DQ_HIGH()       GPIO_SetBits(DS18B20_PORT, DS18B20_PIN)
#define DS18B20_DQ_LOW()        GPIO_ResetBits(DS18B20_PORT, DS18B20_PIN)
#define DS18B20_DQ_READ()       GPIO_ReadInputDataBit(DS18B20_PORT, DS18B20_PIN)

/* ==================== DS18B20 指令定义 ==================== */
#define DS18B20_CMD_CONVERT_TEMP    0x44  /* 启动温度转换 */
#define DS18B20_CMD_READ_SCRATCHPAD 0xBE  /* 读取暂存器 */
#define DS18B20_CMD_WRITE_SCRATCHPAD 0x4E /* 写暂存器 */
#define DS18B20_CMD_COPY_SCRATCHPAD  0x48 /* 复制暂存器到EEPROM */
#define DS18B20_CMD_RECALL_E2        0xB8 /* 从EEPROM调出 */
#define DS18B20_CMD_READ_POWER_SUPPLY 0xB4 /* 读供电模式 */
#define DS18B20_CMD_SKIP_ROM         0xCC /* 跳过ROM */
#define DS18B20_CMD_MATCH_ROM        0x55 /* 匹配ROM */

/* ==================== 函数声明 ==================== */
uint8_t DS18B20_Init(void);
void    DS18B20_Start(void);
uint8_t DS18B20_Read_Byte(void);
void    DS18B20_Write_Byte(uint8_t dat);
int16_t DS18B20_Get_Temp(void);
uint8_t DS18B20_Check(void);
void    DS18B20_Rst(void);

#endif /* __DS18B20_H */
