/**
 * pll.h
 * Top-Level Software PLL Integration
 * ===================================
 * Integrates all PLL sub-modules:
 *   Signal Generator -> Phase Detector -> Notch Filter
 *   -> PI Loop Filter -> NCO -> Lock Detection
 *
 * This module is called from TIM3 ISR at 20kHz.
 *
 * Algorithm chain matches teacher's SPLL_1PH.H exactly.
 */

#ifndef PLL_H
#define PLL_H

#include <arm_math.h>
#include "signal_generator.h"
#include "phase_detector.h"
#include "notch_filter.h"
#include "loop_filter.h"
#include "nco.h"

/* PLL output data structure (for USART streaming) */
typedef struct {
    float32_t timestamp;      /* Time in seconds */
    float32_t input;          /* Signal generator output */
    float32_t pll_output;     /* PLL sine estimate */
    float32_t theta;          /* Phase angle (rad) */
    float32_t frequency;      /* Frequency estimate (Hz) */
    float32_t phase_error;    /* Input - PLL output */
    float32_t loop_filter;    /* ylf output */
    uint8_t   lock_state;     /* 0=unlocked, 1=locked */
} PLL_OutputData;

/* PLL main structure */
typedef struct {
    SignalGenerator sg;
    PhaseDetector   pd;
    NotchFilter     nf;
    LoopFilter      lf;
    NCO             nco;
    PLL_OutputData  out;       /* Latest output data */
    uint32_t        lock_cnt;  /* Lock detection counter */
    uint8_t         locked;    /* Lock flag */
    uint32_t        iter;      /* Iteration counter */
} SoftwarePLL;

/* Public API */
void SoftwarePLL_Init(SoftwarePLL *pll);
void SoftwarePLL_Run(SoftwarePLL *pll);
PLL_OutputData* SoftwarePLL_GetOutput(SoftwarePLL *pll);
void SoftwarePLL_NextCase(SoftwarePLL *pll);
uint8_t SoftwarePLL_GetCase(SoftwarePLL *pll);
const char* SoftwarePLL_GetCaseName(SoftwarePLL *pll);

#endif /* PLL_H */
