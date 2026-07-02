/**
 * nco.h
 * Numerically Controlled Oscillator (VCO)
 * ========================================
 * Generates sine and cosine from phase accumulator.
 * Implements the VCO equation:
 *   wo = wn - ylf         (frequency update)
 *   theta += wo * delta_T (phase integration)
 *   sin/cos via CMSIS-DSP
 *
 * Ref: SPLL_1PH.H lines 146-161
 */

#ifndef NCO_H
#define NCO_H

#include <arm_math.h>

typedef struct {
    float32_t wn;           /* Nominal angular frequency (rad/s) */
    float32_t wo;           /* Output angular frequency (rad/s) */
    float32_t theta[2];     /* [0]=current, [1]=previous */
    float32_t sin_val[2];   /* [0]=current, [1]=previous */
    float32_t cos_val[2];   /* [0]=current, [1]=previous */
    float32_t delta_t;      /* Sampling period */
    float32_t fo;           /* Output frequency in Hz */
} NCO;

/**
 * Initialize NCO
 * @param nco      NCO instance
 * @param gridFreq Nominal grid frequency (Hz)
 * @param delta_T  Sampling period (seconds)
 */
void NCO_Init(NCO *nco, float32_t gridFreq, float32_t delta_T);

/**
 * Update NCO with new loop filter output
 * @param nco  NCO instance
 * @param ylf  Loop filter output (frequency correction)
 */
void NCO_Update(NCO *nco, float32_t ylf);

#endif /* NCO_H */
