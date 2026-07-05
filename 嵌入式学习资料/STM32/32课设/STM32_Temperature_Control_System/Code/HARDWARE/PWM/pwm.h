#ifndef __PWM_H
#define __PWM_H
#include "stm32f10x.h"

#define PWM_ARR  999     /* 1kHz: 72MHz/(71+1)/(999+1) */
#define PWM_PSC  71

void PWM_Init(void);
void PWM_Fan(uint8_t duty);   /* duty: 0-100 */
void PWM_Heat(uint8_t duty);
#endif
