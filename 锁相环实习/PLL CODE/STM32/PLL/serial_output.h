#ifndef SERIAL_OUTPUT_H
#define SERIAL_OUTPUT_H

#include <arm_math.h>
#include "usart.h"
#include "pll.h"

void SerialOutput_Init(void);
void SerialOutput_Flush(PLL_OutputData *data);
void SerialOutput_PrintHeader(void);
void SerialOutput_StartOfFrame(const char *case_name);

#endif
