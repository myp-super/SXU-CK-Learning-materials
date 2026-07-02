/**
 * notch_filter.h
 * 2nd-Order IIR Notch Filter
 * ===========================
 * Removes the double-frequency (100Hz) component from the
 * phase detector output. The notch is tuned to 2*f_grid
 * to suppress the sin(2ωt) term from mixing.
 *
 * Transfer function:
 *   ynotch(z)    B0 + B1*z^-1 + B2*z^-2
 *   --------- = -------------------------
 *    Upd(z)      1 + A1*z^-1 + A2*z^-2
 *
 * Parameters: c1=0.1 (bandwidth), c2=1e-5 (depth)
 * Ref: SPLL_1PH.H lines 73-100
 */

#ifndef NOTCH_FILTER_H
#define NOTCH_FILTER_H

#include <arm_math.h>

typedef struct {
    float32_t A1, A2;      /* Denominator coefficients */
    float32_t B0, B1, B2;  /* Numerator coefficients   */
    float32_t ynotch[3];   /* [0]=curr, [1]=prev, [2]=prev2 */
} NotchFilter;

/**
 * Initialize notch filter coefficients
 * @param nf       Filter instance
 * @param delta_T  Sampling period (seconds)
 * @param gridFreq Nominal grid frequency (Hz) - notch at 2*gridFreq
 * @param c1       Bandwidth factor (0.1 = narrow)
 * @param c2       Depth factor (1e-5 = deep)
 */
void NotchFilter_Init(NotchFilter *nf, float32_t delta_T,
                       float32_t gridFreq, float32_t c1, float32_t c2);

/**
 * Process one sample through the notch filter
 * @param nf    Filter instance
 * @param Upd0  Phase detector output (current sample)
 * @param Upd1  Phase detector output (prev sample)
 * @param Upd2  Phase detector output (prev-prev sample)
 * @return      Filtered output (ynotch)
 */
float32_t NotchFilter_Update(NotchFilter *nf, float32_t Upd0,
                              float32_t Upd1, float32_t Upd2);

#endif /* NOTCH_FILTER_H */
