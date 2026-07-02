/**
 * pll_app.h
 * PLL Application Layer
 * ======================
 * Glue between CubeMX-generated HAL code and PLL modules.
 * Include this in main.c and call the functions.
 */

#ifndef PLL_APP_H
#define PLL_APP_H

#include "pll.h"
#include "serial_output.h"

/* Global PLL instance */
extern volatile SoftwarePLL pll;

/* Application functions - call from main.c */
void PLL_App_Init(void);
void PLL_App_ISR(void);        /* Call from TIM3 IRQ handler */
void PLL_App_MainLoop(void);   /* Call from while(1) */
void PLL_App_ButtonCheck(void);/* Button polling for case switch */

#endif /* PLL_APP_H */
