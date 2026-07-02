/**
 * signal_generator.h
 * Software Signal Generator for PLL Testing
 * ===========================================
 * Generates 50Hz sinusoidal reference signal internally.
 * Supports 4 test cases via button switching:
 *   Case 0: Normal 50Hz sine
 *   Case 1: Phase jump (+90 deg)
 *   Case 2: Frequency range test
 *   Case 3: Amplitude change
 *   Case 4: Noise injection
 *
 * Ref: 电网PLL模拟测试 (cekong, 2020)
 */

#ifndef SIGNAL_GENERATOR_H
#define SIGNAL_GENERATOR_H

#include <arm_math.h>

#define GRID_FREQ       50.0f
#define ISR_FREQUENCY   10000.0f
#define DELTA_T         (1.0f / ISR_FREQUENCY)
#define TWO_PI          6.283185307f

/* Test case identifiers */
typedef enum {
    CASE_NORMAL     = 0,
    CASE_PHASE_JUMP = 1,
    CASE_FREQ_RANGE = 2,
    CASE_AMP_CHANGE = 3,
    CASE_NOISE      = 4,
    CASE_MAX        = 5
} TestCase;

/* Signal generator state */
typedef struct {
    float32_t phase;          /* Accumulated phase (rad) */
    float32_t frequency;      /* Current output frequency (Hz) */
    float32_t amplitude;      /* Current output amplitude */
    float32_t output;         /* Latest output sample */
    uint32_t  sample_count;   /* Total samples generated */
    TestCase  test_case;      /* Active test case */
    uint8_t   case_changed;   /* Flag: case just changed, reset state */
} SignalGenerator;

/* Public API */
void SignalGenerator_Init(SignalGenerator *sg);
void SignalGenerator_SetCase(SignalGenerator *sg, TestCase tc);
float32_t SignalGenerator_Update(SignalGenerator *sg);
const char* SignalGenerator_GetCaseName(TestCase tc);
void SignalGenerator_NextCase(SignalGenerator *sg);
uint8_t SignalGenerator_GetCaseIndex(SignalGenerator *sg);

#endif /* SIGNAL_GENERATOR_H */
