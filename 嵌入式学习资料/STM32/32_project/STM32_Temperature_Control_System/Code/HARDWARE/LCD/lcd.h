#ifndef __LCD_H
#define __LCD_H

#include "stm32f10x.h"
#include "delay.h"
#include <stdio.h>

#define LCD_W  240
#define LCD_H  320

/* RGB565 常用颜色 */
#define WHITE   0xFFFF
#define BLACK   0x0000
#define RED     0xF800
#define GREEN   0x07E0
#define BLUE    0x001F
#define YELLOW  0xFFE0

/* FSMC Bank1_SRAM4 基址: 0x6C000000 */
#define LCD_BASE  ((uint32_t)(0x60000000 | 0x0C000000))
#define LCD_CMD   (*((volatile uint16_t *)(LCD_BASE)))
#define LCD_DATA  (*((volatile uint16_t *)(LCD_BASE | 0x000007FE)))

void LCD_Init(void);
void LCD_Clear(uint16_t color);
void LCD_ShowChar(uint16_t x, uint16_t y, uint8_t ch, uint8_t size, uint16_t color);
void LCD_ShowString(uint16_t x, uint16_t y, uint16_t w, uint8_t size,
                    uint16_t color, uint8_t *str);
#endif
