/**
 ******************************************************************************
 * @file    sys.h
 * @author  山西大学 测控技术与仪器专业
 * @brief   系统基础功能 头文件
 * @version V1.0
 * @date    2026-06-17
 ******************************************************************************
 */

#ifndef __SYS_H
#define __SYS_H

#include "stm32f10x.h"
#include <stdio.h>
#include <string.h>
#include <stdarg.h>

/* ==================== 位带操作宏 ==================== */
/* 位带区映射到别名区的公式:
 *   SRAM位带区: AliasAddr = 0x22000000 + (Addr - 0x20000000)*32 + Bit*4
 *   外设位带区: AliasAddr = 0x42000000 + (Addr - 0x40000000)*32 + Bit*4
 */
#define BITBAND(addr, bitnum)  ((addr & 0xF0000000) + 0x02000000 + \
                                ((addr & 0x000FFFFF) << 5) + (bitnum << 2))
#define MEM_ADDR(addr)         (*((volatile unsigned long *)(addr)))
#define BIT_ADDR(addr, bitnum)  MEM_ADDR(BITBAND(addr, bitnum))

/* GPIO 位带操作 */
#define PAout(n)  BIT_ADDR(&(GPIOA->ODR), n)
#define PAin(n)   BIT_ADDR(&(GPIOA->IDR), n)
#define PBout(n)  BIT_ADDR(&(GPIOB->ODR), n)
#define PBin(n)   BIT_ADDR(&(GPIOB->IDR), n)
#define PCout(n)  BIT_ADDR(&(GPIOC->ODR), n)
#define PCin(n)   BIT_ADDR(&(GPIOC->IDR), n)
#define PDout(n)  BIT_ADDR(&(GPIOD->ODR), n)
#define PDin(n)   BIT_ADDR(&(GPIOD->IDR), n)
#define PEout(n)  BIT_ADDR(&(GPIOE->ODR), n)
#define PEin(n)   BIT_ADDR(&(GPIOE->IDR), n)
#define PFout(n)  BIT_ADDR(&(GPIOF->ODR), n)
#define PFin(n)   BIT_ADDR(&(GPIOF->IDR), n)
#define PGout(n)  BIT_ADDR(&(GPIOG->ODR), n)
#define PGin(n)   BIT_ADDR(&(GPIOG->IDR), n)

/* ==================== 函数声明 ==================== */
void SystemInit(void);

#endif /* __SYS_H */
