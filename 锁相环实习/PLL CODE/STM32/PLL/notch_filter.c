/**
 * notch_filter.c
 * Notch Filter Implementation
 * ============================
 * Exact replica of teacher's SPLL_1PH_notch_coeff_update() and
 * the notch filter section of SPLL_1ph_run_FUNC().
 */

#include "notch_filter.h"

/* PI is defined by CMSIS DSP arm_math.h */

void NotchFilter_Init(NotchFilter *nf, float32_t delta_T,
                       float32_t gridFreq, float32_t c1, float32_t c2)
{
    if (nf == NULL) return;

    /* Notch target: 2x grid frequency (100Hz for 50Hz grid) */
    float32_t wn = 2.0f * PI * gridFreq * 2.0f;

    /* Compute coefficients (SPLL_1PH.H lines 76-84) */
    float32_t x = 2.0f * c2 * wn * delta_T;
    float32_t y = 2.0f * c1 * wn * delta_T;
    float32_t z = wn * delta_T * wn * delta_T;

    nf->A2 = z - y + 1.0f;
    nf->A1 = y - 2.0f;
    nf->B0 = 1.0f;
    nf->B1 = x - 2.0f;
    nf->B2 = z - x + 1.0f;

    /* Clear state */
    nf->ynotch[0] = 0.0f;
    nf->ynotch[1] = 0.0f;
    nf->ynotch[2] = 0.0f;
}

float32_t NotchFilter_Update(NotchFilter *nf, float32_t Upd0,
                              float32_t Upd1, float32_t Upd2)
{
    if (nf == NULL) return 0.0f;

    /* Shift state */
    nf->ynotch[2] = nf->ynotch[1];
    nf->ynotch[1] = nf->ynotch[0];

    /* Direct Form I (SPLL_1PH.H lines 95-100):
     * ynotch[0] = -A1*y[n-1] - A2*y[n-2]
     *            + B0*Upd[0] + B1*Upd[1] + B2*Upd[2] */
    nf->ynotch[0] = -nf->A1 * nf->ynotch[1]
                    - nf->A2 * nf->ynotch[2]
                    + nf->B0 * Upd0
                    + nf->B1 * Upd1
                    + nf->B2 * Upd2;

    return nf->ynotch[0];
}
