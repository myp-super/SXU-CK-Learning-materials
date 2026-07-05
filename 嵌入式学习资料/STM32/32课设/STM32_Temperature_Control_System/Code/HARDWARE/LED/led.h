#ifndef __LED_H
#define __LED_H
#include "stm32f10x.h"

#define LED_FAN_PIN   GPIO_Pin_0
#define LED_HEAT_PIN  GPIO_Pin_1
#define LED_PWR_PIN   GPIO_Pin_13
#define LED_PORT      GPIOC

void LED_Init(void);
void LED_Fan(uint8_t on);     /* 1=亮, 0=灭 */
void LED_Heat(uint8_t on);
#endif
