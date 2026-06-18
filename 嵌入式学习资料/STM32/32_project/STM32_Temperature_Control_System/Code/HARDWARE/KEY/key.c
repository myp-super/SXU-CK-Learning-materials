/**
 ******************************************************************************
 * @file    key.c
 * @author  山西大学 测控技术与仪器专业
 * @brief   按键驱动实现 (支持消抖)
 * @version V1.0
 * @date    2026-06-17
 ******************************************************************************
 */

#include "key.h"

/**
 * @brief  按键GPIO初始化
 * @param  无
 * @retval 无
 */
void KEY_Init(void)
{
    GPIO_InitTypeDef GPIO_InitStructure;

    /* 使能GPIO时钟 */
    RCC_APB2PeriphClockCmd(KEY_UP_RCC | KEY_DOWN_RCC, ENABLE);

    /* KEY_UP: PG8 - 上拉输入 (按下低电平) */
    GPIO_InitStructure.GPIO_Pin = KEY_UP_PIN;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;
    GPIO_Init(GPIOG, &GPIO_InitStructure);

    /* KEY_DOWN: PG7 - 上拉输入 (按下低电平) */
    GPIO_InitStructure.GPIO_Pin = KEY_DOWN_PIN;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;
    GPIO_Init(GPIOG, &GPIO_InitStructure);
}

/**
 * @brief  按键扫描函数 (带消抖)
 * @param  mode: 0-不支持连续按; 1-支持连续按
 * @retval 0:无按键, 1:KEY_UP按下, 2:KEY_DOWN按下
 */
uint8_t KEY_Scan(uint8_t mode)
{
    static uint8_t key_up_flag = 1;  /* 按键松开标志 */
    uint8_t key_value = KEY_NONE;

    /* 检测是否有按键按下 */
    if (key_up_flag && (GPIO_ReadInputDataBit(KEY_UP_PORT, KEY_UP_PIN) == RESET ||
                        GPIO_ReadInputDataBit(KEY_DOWN_PORT, KEY_DOWN_PIN) == RESET))
    {
        /* 软件消抖: 延时20ms后再次检测 */
        delay_ms(KEY_DEBOUNCE_MS);
        key_up_flag = 0;  /* 清除松开标志 */

        /* 再次确认按键状态 */
        if (GPIO_ReadInputDataBit(KEY_UP_PORT, KEY_UP_PIN) == RESET)
        {
            key_value = KEY_UP_PRESS;
        }
        else if (GPIO_ReadInputDataBit(KEY_DOWN_PORT, KEY_DOWN_PIN) == RESET)
        {
            key_value = KEY_DOWN_PRESS;
        }
    }
    else if (GPIO_ReadInputDataBit(KEY_UP_PORT, KEY_UP_PIN) != RESET &&
             GPIO_ReadInputDataBit(KEY_DOWN_PORT, KEY_DOWN_PIN) != RESET)
    {
        /* 所有按键都已松开 */
        key_up_flag = 1;
    }

    /* 连续按模式: 不清除标志位 */
    if (mode)
    {
        key_up_flag = 1;
    }

    return key_value;
}
