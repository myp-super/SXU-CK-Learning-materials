/**
 * serial_output.c
 * Direct ISR UART output with manually formatted floats.
 * MicroLIB snprintf does NOT support %f - must convert manually.
 */
#include "serial_output.h"
#include <string.h>
#include <stdint.h>

extern UART_HandleTypeDef huart1;
static char buf[128];

/* Convert float to string manually (MicroLIB snprintf has no %f support!) */
static int ftoa(char *out, float val, int decimals)
{
    char *p = out;
    if (val < 0.0f) { *p++ = '-'; val = -val; }

    int32_t whole = (int32_t)val;
    float frac_f = val - (float)whole;

    /* Whole part */
    if (whole == 0) {
        *p++ = '0';
    } else {
        char tmp[16]; int ti = 0;
        while (whole > 0) { tmp[ti++] = '0' + (whole % 10); whole /= 10; }
        while (ti > 0) *p++ = tmp[--ti];
    }

    *p++ = '.';

    /* Fractional part */
    for (int i = 0; i < decimals; i++) {
        frac_f *= 10.0f;
        int d = (int)frac_f;
        *p++ = '0' + d;
        frac_f -= (float)d;
    }

    *p = '\0';
    return (int)(p - out);
}

void SerialOutput_Init(void)
{
    HAL_UART_Transmit(&huart1,
        (uint8_t *)"time,input,pll_output,theta,freq,phase_err,ylf,lock\r\n",
        60, 100);
}

void SerialOutput_Flush(PLL_OutputData *d)
{
    if (!d) return;
    static uint32_t cnt = 0;
    if (++cnt % 40 != 0) return;

    char *p = buf;

    p += ftoa(p, d->timestamp, 6);     *p++ = ',';
    p += ftoa(p, d->input, 6);         *p++ = ',';
    p += ftoa(p, d->pll_output, 6);    *p++ = ',';
    p += ftoa(p, d->theta, 4);         *p++ = ',';
    p += ftoa(p, d->frequency, 2);     *p++ = ',';
    p += ftoa(p, d->phase_error, 4);   *p++ = ',';
    p += ftoa(p, d->loop_filter, 3);   *p++ = ',';
    *p++ = '0' + (d->lock_state & 1);
    *p++ = '\r'; *p++ = '\n'; *p = '\0';

    HAL_UART_Transmit(&huart1, (uint8_t *)buf, (uint16_t)(p - buf), 200);
}

void SerialOutput_PrintHeader(void)
{
    HAL_UART_Transmit(&huart1,
        (uint8_t *)"\r\n=== Software PLL F103 ===\r\n", 31, 100);
}

void SerialOutput_StartOfFrame(const char *name)
{
    int len = 0;
    char *p = buf;
    *p++ = '#'; *p++ = 'C'; *p++ = 'A'; *p++ = 'S'; *p++ = 'E'; *p++ = ':';
    while (*name) *p++ = *name++;
    *p++ = '\r'; *p++ = '\n';
    HAL_UART_Transmit(&huart1, (uint8_t *)buf, (uint16_t)(p - buf), 100);
}
