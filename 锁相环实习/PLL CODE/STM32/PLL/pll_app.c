#include "pll_app.h"
#include "main.h"

volatile SoftwarePLL pll;
volatile uint32_t isr_proof = 0;
static uint32_t last_button_time = 0;
#define DEBOUNCE_MS 200

void PLL_App_Init(void)
{
    SoftwarePLL_Init((SoftwarePLL*)&pll);
    HAL_UART_Transmit(&huart1,
        (uint8_t *)"time,input,pll_output,theta,frequency,phase_error,loop_filter,lock_state\r\n",
        75, 500);
}

void PLL_App_ISR(void)
{
    isr_proof++;

    /* Run PLL every 100th ISR call (200Hz) to avoid overloading CPU */
    if ((isr_proof & 1) == 0) {
        SoftwarePLL_Run((SoftwarePLL*)&pll);
    }

    if (pll.out.lock_state) {
        HAL_GPIO_WritePin(GPIOC, GPIO_PIN_13, GPIO_PIN_RESET);
    } else {
        HAL_GPIO_WritePin(GPIOC, GPIO_PIN_13, GPIO_PIN_SET);
    }
}

/* Simple float-to-string: writes val with 'dec' decimal places to *p, returns new p */
static char* ftoa(char *p, float val, int dec)
{
    if (val < 0.0f) { *p++ = '-'; val = -val; }
    int w = (int)val;
    float f = val - (float)w;
    if (w == 0) { *p++ = '0'; }
    else {
        char t[16]; int i = 0;
        while (w > 0) { t[i++] = '0'+(w%10); w /= 10; }
        while (i > 0) *p++ = t[--i];
    }
    if (dec > 0) {
        *p++ = '.';
        while (dec-- > 0) { f *= 10.0f; int d = (int)f; *p++ = '0'+d; f -= (float)d; }
    }
    return p;
}

void PLL_App_MainLoop(void)
{
    static uint32_t n = 0;
    char buf[128], *p;
    n++;

    if ((n % 2000) != 0) { PLL_App_ButtonCheck(); return; }

    p = buf;
    p = ftoa(p, pll.out.timestamp,   6); *p++ = ',';
    p = ftoa(p, pll.out.input,       6); *p++ = ',';
    p = ftoa(p, pll.out.pll_output,  6); *p++ = ',';
    p = ftoa(p, pll.out.theta,       4); *p++ = ',';
    p = ftoa(p, pll.out.frequency,   2); *p++ = ',';
    p = ftoa(p, pll.out.phase_error, 4); *p++ = ',';
    p = ftoa(p, pll.out.loop_filter, 3); *p++ = ',';
    *p++ = '0' + (pll.out.lock_state & 1);
    *p++ = '\r'; *p++ = '\n';

    HAL_UART_Transmit(&huart1, (uint8_t *)buf, (uint16_t)(p - buf), 500);
    PLL_App_ButtonCheck();
}

void PLL_App_ButtonCheck(void)
{
    uint32_t now = HAL_GetTick();
    if (HAL_GPIO_ReadPin(GPIOA, GPIO_PIN_0) == GPIO_PIN_RESET) {
        if (now - last_button_time > DEBOUNCE_MS) {
            last_button_time = now;
        }
    }
}
