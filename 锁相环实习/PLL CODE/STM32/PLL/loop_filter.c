/**
 * loop_filter.c
 * PI Loop Filter Implementation
 * ==============================
 * Exact replica of teacher's SPLL_1ph_init() loop filter section
 * and SPLL_1ph_run_FUNC() loop filter section.
 */

#include "loop_filter.h"

void LoopFilter_Init(LoopFilter *lf, float32_t delta_T)
{
    if (lf == NULL) return;

    /* Teacher's PI parameters (from PDF: zeta=0.7, omega_n=110 rad/s) */
    const float32_t Kp = 166.322444f;
    const float32_t Ki = 27755.55f;

    /* Discrete-time coefficients:
     * B0 = Kp + Ki*Ts  (proportional + integral per sample)
     * B1 = -Kp          (proportional feed-through from prev sample)
     * A1 = -1.0         (pure integrator: y[n] = y[n-1] + ...) */
    lf->B0 = Kp + Ki * delta_T;
    lf->B1 = -Kp;
    lf->A1 = -1.0f;

    /* Clear state */
    lf->ylf[0] = 0.0f;
    lf->ylf[1] = 0.0f;
}

float32_t LoopFilter_Update(LoopFilter *lf, float32_t ynotch0, float32_t ynotch1)
{
    if (lf == NULL) return 0.0f;

    /* Shift state */
    lf->ylf[1] = lf->ylf[0];

    /* ylf = -A1*ylf[1] + B0*ynotch[0] + B1*ynotch[1]
     * With A1=-1: ylf = ylf[1] + B0*ynotch[0] + B1*ynotch[1] */
    lf->ylf[0] = -lf->A1 * lf->ylf[1]
                 + lf->B0 * ynotch0
                 + lf->B1 * ynotch1;

    return lf->ylf[0];
}
