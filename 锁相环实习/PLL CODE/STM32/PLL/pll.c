/**
 * pll.c
 * Software PLL Top-Level Implementation
 * ======================================
 * Called at 20kHz from TIM3 ISR.
 * Runs one complete PLL iteration per call.
 *
 * Algorithm chain (exactly matches teacher's SPLL_1PH.H):
 *   1. Generate reference signal (software signal source)
 *   2. Phase detect: Upd = input * cos(prev_theta)
 *   3. Notch filter: remove 2*f_grid component
 *   4. PI loop filter: extract DC frequency error
 *   5. NCO: frequency/phase update, sin/cos generation
 *   6. Lock detection
 */

#include "pll.h"

/* my_fabsf macro (avoids math.h dependency on Cortex-M3 MicroLIB) */
#define my_fabsf(x) ((x) < 0.0f ? -(x) : (x))

/* Lock detection parameters */
#define LOCK_WINDOW     400     /* ~20ms @ 20kHz */
#define FREQ_LOCK_THRESH 2.0f   /* Hz */
#define YLF_LOCK_THRESH  10.0f  /* ylf stability threshold */

void SoftwarePLL_Init(SoftwarePLL *pll)
{
    if (pll == NULL) return;

    /* Init sub-modules */
    SignalGenerator_Init(&pll->sg);
    SignalGenerator_SetCase(&pll->sg, CASE_NORMAL);
    PhaseDetector_Init(&pll->pd);
    NotchFilter_Init(&pll->nf, DELTA_T, GRID_FREQ, 0.1f, 0.00001f);
    LoopFilter_Init(&pll->lf, DELTA_T);
    NCO_Init(&pll->nco, GRID_FREQ, DELTA_T);

    /* Clear output */
    pll->out.timestamp   = 0.0f;
    pll->out.input       = 0.0f;
    pll->out.pll_output  = 0.0f;
    pll->out.theta       = 0.0f;
    pll->out.frequency   = GRID_FREQ;
    pll->out.phase_error = 0.0f;
    pll->out.loop_filter = 0.0f;
    pll->out.lock_state  = 0;

    pll->lock_cnt = 0;
    pll->locked   = 0;
    pll->iter     = 0;
}

void SoftwarePLL_Run(SoftwarePLL *pll)
{
    if (pll == NULL) return;

    float32_t input_signal, ynotch_curr, ylf_curr;
    float32_t freq_err;

    /* ---- Step 1: Generate reference signal ---- */
    input_signal = SignalGenerator_Update(&pll->sg);

    /* ---- Step 2: Phase Detector ----
     * Upd = input * cos(theta_prev)
     * cos_prev is nco.cos_val[1] (previous sample's cosine) */
    (void)PhaseDetector_Update(&pll->pd, input_signal,
                                pll->nco.cos_val[1]);

    /* ---- Step 3: Notch Filter ----
     * Remove 2*f_grid component from Upd */
    ynotch_curr = NotchFilter_Update(&pll->nf,
                                      pll->pd.Upd[0],  /* current Upd */
                                      pll->pd.Upd[1],  /* prev Upd */
                                      pll->pd.Upd[2]); /* prev-prev Upd */

    /* ---- Step 4: PI Loop Filter ----
     * ylf = -A1*ylf_prev + B0*ynotch + B1*ynotch_prev */
    ylf_curr = LoopFilter_Update(&pll->lf,
                                  ynotch_curr,          /* ynotch[0] */
                                  pll->nf.ynotch[1]);   /* ynotch[1] */

    /* ---- Step 5: NCO Update ----
     * wo = wn - ylf, theta += wo*Ts, sin/cos generation */
    NCO_Update(&pll->nco, ylf_curr);

    /* ---- Step 6: Lock Detection ---- */
    freq_err = my_fabsf(pll->nco.wo - pll->nco.wn) / (2.0f * 3.141592653f);
    float32_t ylf_abs = my_fabsf(ylf_curr);

    if (freq_err < FREQ_LOCK_THRESH && ylf_abs < YLF_LOCK_THRESH) {
        if (pll->lock_cnt < LOCK_WINDOW) pll->lock_cnt++;
    } else {
        if (pll->lock_cnt > 0) pll->lock_cnt -= 2;
    }
    pll->locked = (pll->lock_cnt >= LOCK_WINDOW) ? 1 : 0;

    /* ---- Fill output data ---- */
    pll->out.timestamp   = (float32_t)pll->iter * DELTA_T;
    pll->out.input       = input_signal;
    pll->out.pll_output  = pll->nco.sin_val[0];
    pll->out.theta       = pll->nco.theta[0];
    pll->out.frequency   = pll->nco.fo;
    pll->out.phase_error = input_signal - pll->nco.sin_val[0];
    pll->out.loop_filter = ylf_curr;
    pll->out.lock_state  = pll->locked;

    pll->iter++;
}

PLL_OutputData* SoftwarePLL_GetOutput(SoftwarePLL *pll)
{
    if (pll == NULL) return NULL;
    return &pll->out;
}

void SoftwarePLL_NextCase(SoftwarePLL *pll)
{
    if (pll == NULL) return;
    SignalGenerator_NextCase(&pll->sg);
}

uint8_t SoftwarePLL_GetCase(SoftwarePLL *pll)
{
    if (pll == NULL) return 0;
    return SignalGenerator_GetCaseIndex(&pll->sg);
}

const char* SoftwarePLL_GetCaseName(SoftwarePLL *pll)
{
    if (pll == NULL) return "N/A";
    return SignalGenerator_GetCaseName(pll->sg.test_case);
}
