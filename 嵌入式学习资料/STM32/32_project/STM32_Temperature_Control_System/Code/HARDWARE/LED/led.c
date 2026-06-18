#include "led.h"

void LED_Init(void)
{
    GPIO_InitTypeDef g;
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOC, ENABLE);
    g.GPIO_Mode = GPIO_Mode_Out_PP;
    g.GPIO_Speed = GPIO_Speed_50MHz;
    g.GPIO_Pin = LED_FAN_PIN | LED_HEAT_PIN | LED_PWR_PIN;
    GPIO_Init(LED_PORT, &g);
    GPIO_SetBits(LED_PORT, LED_FAN_PIN | LED_HEAT_PIN); /* 灭 */
    GPIO_ResetBits(LED_PORT, LED_PWR_PIN);               /* 电源灯亮 */
}

void LED_Fan(uint8_t on)  { if(on) GPIO_ResetBits(LED_PORT,LED_FAN_PIN);  else GPIO_SetBits(LED_PORT,LED_FAN_PIN); }
void LED_Heat(uint8_t on) { if(on) GPIO_ResetBits(LED_PORT,LED_HEAT_PIN); else GPIO_SetBits(LED_PORT,LED_HEAT_PIN); }
