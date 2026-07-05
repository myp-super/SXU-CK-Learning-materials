/**
 ******************************************************************************
 * @file    ds18b20.c
 * @author  山西大学 测控技术与仪器专业
 * @brief   DS18B20温度传感器驱动 实现文件
 * @version V1.0
 * @date    2026-06-17
 ******************************************************************************
 * @note    DS18B20单总线通信协议实现
 *          - 复位脉冲 + 存在脉冲检测
 *          - 写时序：写0（拉低60-120us），写1（拉低1-15us）
 *          - 读时序：拉低1-15us后读取，15us内完成
 *          - 温度转换时间：12位精度需750ms
 ******************************************************************************
 */

#include "ds18b20.h"

/**
 * @brief  DS18B20引脚初始化
 * @param  无
 * @retval 初始化结果 (0:成功, 1:失败)
 */
uint8_t DS18B20_Init(void)
{
    GPIO_InitTypeDef GPIO_InitStructure;

    /* 使能GPIO时钟 */
    RCC_APB2PeriphClockCmd(DS18B20_RCC_PORT, ENABLE);

    /* 配置为推挽输出 */
    GPIO_InitStructure.GPIO_Pin = DS18B20_PIN;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(DS18B20_PORT, &GPIO_InitStructure);
    DS18B20_DQ_HIGH();  /* 总线空闲高电平 */

    /* 检测DS18B20是否存在 */
    return DS18B20_Check();
}

/**
 * @brief  DS18B20总线复位
 * @param  无
 * @retval 无
 * @note   主机拉低480-960us → 释放总线 → 等待15-60us
 *         存在脉冲 → DS18B20拉低60-240us
 */
void DS18B20_Rst(void)
{
    DS18B20_DQ_OUT();
    DS18B20_DQ_LOW();       /* 拉低总线 */
    delay_us(500);          /* 保持低电平500us (480-960us范围内) */
    DS18B20_DQ_HIGH();      /* 释放总线 */
    delay_us(15);           /* 等待DS18B20响应 */
}

/**
 * @brief  检测DS18B20是否存在
 * @param  无
 * @retval 0:存在, 1:不存在
 */
uint8_t DS18B20_Check(void)
{
    uint8_t retry = 0;

    DS18B20_DQ_IN();        /* 设置为输入，检测存在脉冲 */

    /* 等待DS18B20拉低总线 (存在脉冲) */
    while (DS18B20_DQ_READ() && retry < 200)
    {
        retry++;
        delay_us(1);
    }

    if (retry >= 200)
    {
        return 1;  /* 未检测到DS18B20 */
    }

    retry = 0;

    /* 等待DS18B20释放总线 */
    while (!DS18B20_DQ_READ() && retry < 240)
    {
        retry++;
        delay_us(1);
    }

    if (retry >= 240)
    {
        return 1;  /* DS18B20应答异常 */
    }

    return 0;  /* DS18B20正常 */
}

/**
 * @brief  从DS18B20读取一个字节
 * @param  无
 * @retval 读取的字节
 */
uint8_t DS18B20_Read_Byte(void)
{
    uint8_t i, byte = 0;
    uint8_t bit_val;

    for (i = 0; i < 8; i++)
    {
        byte >>= 1;  /* 先右移，低位在前 */

        DS18B20_DQ_OUT();
        DS18B20_DQ_LOW();       /* 拉低总线启动读时序 */
        delay_us(2);            /* 保持低电平 >1us */
        DS18B20_DQ_HIGH();      /* 释放总线 */
        delay_us(1);

        DS18B20_DQ_IN();        /* 设置为输入 */
        delay_us(2);            /* 等待数据稳定 */

        if (DS18B20_DQ_READ())
        {
            bit_val = 0x80;     /* 读1 */
        }
        else
        {
            bit_val = 0x00;     /* 读0 */
        }

        byte |= bit_val;
        delay_us(45);           /* 等待读时序完成 (>60us total) */
    }

    return byte;
}

/**
 * @brief  向DS18B20写入一个字节
 * @param  dat: 要写入的字节
 * @retval 无
 */
void DS18B20_Write_Byte(uint8_t dat)
{
    uint8_t i;

    DS18B20_DQ_OUT();

    for (i = 0; i < 8; i++)
    {
        if (dat & 0x01)  /* 写1 */
        {
            DS18B20_DQ_LOW();   /* 拉低总线 */
            delay_us(2);        /* 保持 >1us */
            DS18B20_DQ_HIGH();  /* 释放总线 */
            delay_us(60);       /* 等待写时序完成 (>60us) */
        }
        else  /* 写0 */
        {
            DS18B20_DQ_LOW();   /* 拉低总线 */
            delay_us(60);       /* 保持低电平 >60us */
            DS18B20_DQ_HIGH();  /* 释放总线 */
            delay_us(2);        /* 恢复时间 */
        }
        dat >>= 1;  /* 下一位 */
    }
}

/**
 * @brief  启动DS18B20温度转换
 * @param  无
 * @retval 无
 * @note   12位精度转换时间约750ms
 */
void DS18B20_Start(void)
{
    DS18B20_Rst();
    DS18B20_Check();
    DS18B20_Write_Byte(DS18B20_CMD_SKIP_ROM);   /* 跳过ROM匹配 */
    DS18B20_Write_Byte(DS18B20_CMD_CONVERT_TEMP); /* 启动温度转换 */
}

/**
 * @brief  读取DS18B20温度值
 * @param  无
 * @retval 温度值（放大10倍，单位0.1°C），读取失败返回-1000
 * @note
 *   温度数据格式（12位）：
 *   | Bit15-11 | Bit10-0 |
 *   | 符号位S  | 温度数据 |
 *   正值: S=0, T = 数值 × 0.0625°C
 *   负值: S=1, T = -(补码) × 0.0625°C
 */
int16_t DS18B20_Get_Temp(void)
{
    uint8_t temp_l, temp_h;
    int16_t temp_raw;
    uint8_t retry = 0;

    /* 复位并发送读暂存器命令 */
    DS18B20_Rst();
    if (DS18B20_Check() != 0)
    {
        return -1000;  /* DS18B20无响应 */
    }

    DS18B20_Write_Byte(DS18B20_CMD_SKIP_ROM);
    DS18B20_Write_Byte(DS18B20_CMD_READ_SCRATCHPAD);

    /* 读取9字节暂存器，取前2字节（温度数据） */
    temp_l = DS18B20_Read_Byte();  /* 温度低字节 */
    temp_h = DS18B20_Read_Byte();  /* 温度高字节 */

    /* 合成温度原始值 */
    temp_raw = (int16_t)(((uint16_t)temp_h << 8) | (uint16_t)temp_l);

    /* 转换为0.1°C单位 */
    /* DS18B20默认12位精度，温度值 = raw × 0.0625°C */
    /* 放大10倍: temp_x10 = raw × 0.625 */
    temp_raw = (int16_t)((float)temp_raw * 0.625f);

    return temp_raw;
}
