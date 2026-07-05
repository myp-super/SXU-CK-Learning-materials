#include "delay.h"

static volatile uint32_t g_tick = 0;

void delay_init(void)
{
    SysTick_CLKSourceConfig(SysTick_CLKSource_HCLK_Div8);  /* 9MHz */
    SysTick->LOAD = 9000 - 1;  /* 1ms */
    SysTick->CTRL |= SysTick_CTRL_TICKINT_Msk | SysTick_CTRL_ENABLE_Msk;
}

void SysTick_Handler(void) { g_tick++; }

void delay_ms(uint32_t n)
{
    uint32_t t = g_tick;
    while ((g_tick - t) < n);
}

void delay_us(uint32_t n)
{
    n *= 9;  /* 72MHz, ~9 cycles/loop */
    while (n--) __NOP();
}

uint32_t delay_tick(void)         { return g_tick; }
uint32_t delay_tdiff(uint32_t t)  { return g_tick - t; }
