/**
 * fast_math.h - LUT-based sin/cos for Cortex-M3 (no FPU)
 * ======================================================
 * 256-entry lookup table with linear interpolation.
 * Replaces CMSIS-DSP arm_sin_f32/arm_cos_f32 at source level.
 * No library linking needed.
 */
#ifndef FAST_MATH_H
#define FAST_MATH_H

#include <stdint.h>

#define FAST_SIN_TABLE_SIZE 256

float fast_sin(float x);
float fast_cos(float x);

#endif
