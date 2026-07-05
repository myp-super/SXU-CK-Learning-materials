#ifndef __MAIN_H
#define __MAIN_H

#include "stm32f10x.h"
#include "delay.h"
#include "usart.h"
#include "ds18b20.h"
#include "lcd.h"
#include "pwm.h"
#include "key.h"
#include "led.h"

/* 控制参数 */
#define DEFAULT_TEMP    25    /* 默认设定温度 °C */
#define TEMP_MIN        10
#define TEMP_MAX        40
#define HYSTERESIS      5     /* 滞回 0.5°C (单位0.1°C) */
#define PWM_MIN         10    /* 最低PWM占空比% */
#define PWM_MAX         100

/* 工作模式 */
typedef enum { MODE_HEATING, MODE_COOLING, MODE_STANDBY } SysMode_t;

/* 全局变量 */
extern volatile uint16_t g_cur_temp;    /* 当前温度×10 */
extern volatile int16_t  g_set_temp;    /* 设定温度×10 */
extern volatile uint8_t  g_fan_pwm;     /* 风扇占空比% */
extern volatile uint8_t  g_heat_pwm;    /* 加热占空比% */
extern volatile SysMode_t g_mode;
extern volatile uint8_t  g_fan_on, g_heat_on;

/* 函数 */
void Temp_Control(void);
void LCD_Update(void);

#endif
