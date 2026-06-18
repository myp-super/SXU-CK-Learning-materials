/**
 ******************************************************************************
 * @file    stm32f10x_it.c
 * @author  山西大学 测控技术与仪器专业
 * @brief   中断服务函数 实现
 * @version V1.0
 * @date    2026-06-17
 ******************************************************************************
 */

#include "stm32f10x_it.h"
#include "main.h"

/* 系统滴答计数（由delay.c使用） */
extern uint32_t g_tick_ms;

/**
 * @brief  NMI异常处理
 */
void NMI_Handler(void)
{
}

/**
 * @brief  硬件错误处理
 */
void HardFault_Handler(void)
{
    /* 进入HardFault则死循环 */
    while (1)
    {
    }
}

/**
 * @brief  存储器管理错误处理
 */
void MemManage_Handler(void)
{
    while (1)
    {
    }
}

/**
 * @brief  总线错误处理
 */
void BusFault_Handler(void)
{
    while (1)
    {
    }
}

/**
 * @brief  使用错误处理
 */
void UsageFault_Handler(void)
{
    while (1)
    {
    }
}

/**
 * @brief  SVC调用处理
 */
void SVC_Handler(void)
{
}

/**
 * @brief  调试监控处理
 */
void DebugMon_Handler(void)
{
}

/**
 * @brief  PendSV处理
 */
void PendSV_Handler(void)
{
}
