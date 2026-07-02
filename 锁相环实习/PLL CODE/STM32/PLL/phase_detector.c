/**
 * phase_detector.c
 * Phase Detector Implementation
 * ==============================
 * Strictly follows SPLL_1PH.H:
 *   Upd[0] = AC_input * cos[1]
 */

#include "phase_detector.h"

void PhaseDetector_Init(PhaseDetector *pd)
{
    if (pd == NULL) return;
    pd->Upd[0] = 0.0f;
    pd->Upd[1] = 0.0f;
    pd->Upd[2] = 0.0f;
}

float32_t PhaseDetector_Update(PhaseDetector *pd,
                                float32_t input,
                                float32_t cos_val)
{
    if (pd == NULL) return 0.0f;

    /* Shift delay line */
    pd->Upd[2] = pd->Upd[1];
    pd->Upd[1] = pd->Upd[0];

    /* Phase detect: Upd = input * cos(theta_prev) */
    pd->Upd[0] = input * cos_val;

    return pd->Upd[0];
}
