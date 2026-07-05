#ifndef __DELAY_H
#define __DELAY_H
#include "stm32f10x.h"

void     delay_init(void);
void     delay_ms(uint32_t nms);
void     delay_us(uint32_t nus);
uint32_t delay_tick(void);
uint32_t delay_tdiff(uint32_t last);
#endif
