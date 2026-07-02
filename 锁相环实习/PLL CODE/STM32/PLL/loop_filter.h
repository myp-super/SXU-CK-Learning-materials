/**
 * loop_filter.h
 * PI Loop Filter (1st-Order IIR)
 * ===============================
 * Filters the notch output to extract the DC frequency error.
 * Equivalent to a PI controller: Kp + Ki/s
 *
 * Implementation: ylf[n] = -A1*ylf[n-1] + B0*ynotch[n] + B1*ynotch[n-1]
 * With A1=-1: ylf[n] = ylf[n-1] + B0*ynotch[n] + B1*ynotch[n-1]
 *
 * Coefficients (teacher PDF: zeta=0.7, omega_n=110 rad/s):
 *   Kp = 166.322, Ki = 27756
 *   B0 = Kp + Ki*Ts, B1 = -Kp
 *
 * Ref: SPLL_1PH.H lines 107-110
 */

#ifndef LOOP_FILTER_H
#define LOOP_FILTER_H

#include <arm_math.h>

typedef struct {
    float32_t B0, B1, A1;  /* Filter coefficients */
    float32_t ylf[2];       /* [0]=current, [1]=previous */
} LoopFilter;

/**
 * Initialize loop filter
 * @param lf      Filter instance
 * @param delta_T Sampling period (seconds)
 */
void LoopFilter_Init(LoopFilter *lf, float32_t delta_T);

/**
 * Process one sample through loop filter
 * @param lf       Filter instance
 * @param ynotch0  Notch filter output (current)
 * @param ynotch1  Notch filter output (previous)
 * @return         Loop filter output (ylf)
 */
float32_t LoopFilter_Update(LoopFilter *lf, float32_t ynotch0, float32_t ynotch1);

#endif /* LOOP_FILTER_H */
