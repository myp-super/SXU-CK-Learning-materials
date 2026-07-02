/**
 * phase_detector.h
 * Phase Detector - Mixer-based (Multiplier Type)
 * =================================================
 * Upd = u(n) * cos(theta_prev)
 *
 * The phase detector multiplies the input signal by the
 * PLL's internally generated cosine, producing an output
 * with a DC component proportional to phase error and
 * an AC component at twice the input frequency.
 *
 * Ref: SPLL_1PH.H line 91
 */

#ifndef PHASE_DETECTOR_H
#define PHASE_DETECTOR_H

#include <arm_math.h>

typedef struct {
    float32_t Upd[3];    /* [0]=current, [1]=prev, [2]=prev2 */
} PhaseDetector;

void PhaseDetector_Init(PhaseDetector *pd);
float32_t PhaseDetector_Update(PhaseDetector *pd,
                                float32_t input,
                                float32_t cos_val);

#endif /* PHASE_DETECTOR_H */
