/**
 * nco.c
 * NCO Implementation
 * ===================
 * Exact replica of teacher's SPLL_1ph_run_FUNC() VCO section.
 *
 * Key: wo = wn - ylf (SUBTRACTION, not addition!)
 * This provides negative feedback: when ylf increases,
 * the output frequency decreases.
 */

#include "nco.h"
#include "fast_math.h"

#define TWO_PI 6.283185307f

void NCO_Init(NCO *nco, float32_t gridFreq, float32_t delta_T)
{
    if (nco == NULL) return;

    nco->wn      = TWO_PI * gridFreq;  /* 2*PI*50 = 314.159 rad/s */
    nco->wo      = nco->wn;
    nco->fo      = gridFreq;
    nco->delta_t = delta_T;

    /* Initialize state (SPLL_1PH.H lines 60-66) */
    nco->theta[0]   = 0.0f;
    nco->theta[1]   = 0.0f;
    nco->sin_val[0] = 0.0f;
    nco->sin_val[1] = 0.0f;
    nco->cos_val[0] = 0.999f;  /* Initial cos = 0.999 per teacher line 62 */
    nco->cos_val[1] = 0.999f;
}

void NCO_Update(NCO *nco, float32_t ylf)
{
    if (nco == NULL) return;

    /* Shift previous values */
    nco->theta[1]   = nco->theta[0];
    nco->sin_val[1] = nco->sin_val[0];
    nco->cos_val[1] = nco->cos_val[0];

    /* VCO: wo = wn - ylf (SPLL_1PH.H line 149) */
    nco->wo = nco->wn - ylf;

    /* Phase integration (SPLL_1PH.H lines 150-151) */
    nco->theta[0] = nco->theta[1] + nco->wo * nco->delta_t;

    /* Wrap theta to [0, 2*PI) (SPLL_1PH.H lines 152-153) */
    if (nco->theta[0] > TWO_PI) {
        nco->theta[0] -= TWO_PI;
    }

    /* Sin/Cos via CMSIS-DSP (SPLL_1PH.H lines 155-156) */
    nco->sin_val[0] = fast_sin(nco->theta[0]);
    nco->cos_val[0] = fast_cos(nco->theta[0]);

    /* Update frequency in Hz */
    nco->fo = nco->wo / TWO_PI;
}
