/**
 * signal_generator.c
 * Software Signal Generator Implementation
 * ===========================================
 * Generates test signals for PLL validation without external hardware.
 * All 4 test cases match the MATLAB simulation scenarios.
 */

#include "signal_generator.h"
#include "fast_math.h"

/* ---- Internal State ---- */
static uint32_t noise_seed = 42;

/* Simple pseudo-Gaussian noise via sum of 4 uniform random numbers.
 * Central Limit Theorem: sum of N uniforms → approx Gaussian.
 * Avoids sqrtf/logf/cosf (math.h heavy on Cortex-M3 without FPU). */
static float32_t rand_gauss(void)
{
    float32_t sum = 0.0f;
    uint32_t i;
    for (i = 0; i < 4; i++) {
        noise_seed = noise_seed * 1103515245 + 12345;
        sum += (float32_t)((noise_seed >> 16) & 0xFFF) / 4096.0f;
    }
    /* Normalize: mean=4*0.5=2.0, std=4/12*scale → subtract 2, divide by sqrt(4/12) */
    return (sum - 2.0f) * 1.732f;  /* 1.732 = sqrt(3) = 1/sqrt(1/3) */
}

/* ---- Public Functions ---- */

void SignalGenerator_Init(SignalGenerator *sg)
{
    if (sg == NULL) return;

    sg->phase        = 0.0f;
    sg->frequency    = GRID_FREQ;
    sg->amplitude    = 1.0f;
    sg->output       = 0.0f;
    sg->sample_count = 0;
    sg->test_case    = CASE_NORMAL;
    sg->case_changed = 1;

    noise_seed = 42;
}

void SignalGenerator_SetCase(SignalGenerator *sg, TestCase tc)
{
    if (sg == NULL) return;
    sg->test_case    = tc;
    sg->case_changed = 1;
}

void SignalGenerator_NextCase(SignalGenerator *sg)
{
    if (sg == NULL) return;
    uint8_t idx = (uint8_t)(sg->test_case) + 1;
    if (idx >= CASE_MAX) idx = 0;
    SignalGenerator_SetCase(sg, (TestCase)idx);
}

uint8_t SignalGenerator_GetCaseIndex(SignalGenerator *sg)
{
    if (sg == NULL) return 0;
    return (uint8_t)(sg->test_case);
}

const char* SignalGenerator_GetCaseName(TestCase tc)
{
    switch (tc) {
        case CASE_NORMAL:     return "Normal 50Hz";
        case CASE_PHASE_JUMP: return "Phase Jump 90deg";
        case CASE_FREQ_RANGE: return "Freq Range 48-52Hz";
        case CASE_AMP_CHANGE: return "Amp Change 1.0->0.5";
        case CASE_NOISE:      return "Noise SNR=20dB";
        default:              return "Unknown";
    }
}

float32_t SignalGenerator_Update(SignalGenerator *sg)
{
    if (sg == NULL) return 0.0f;

    float32_t f, amp, noise_val;

    /* Apply case-specific parameters */
    switch (sg->test_case)
    {
        case CASE_NORMAL:
        default:
            f   = GRID_FREQ;
            amp = 1.0f;
            noise_val = 0.0f;
            break;

        case CASE_PHASE_JUMP:
            f   = GRID_FREQ;
            amp = 1.0f;
            /* +90 deg phase jump at 0.15s (3000 samples @ 20kHz) */
            if (sg->sample_count == 3000 && sg->case_changed == 0) {
                sg->phase += PI / 2.0f;
            }
            noise_val = 0.0f;
            break;

        case CASE_FREQ_RANGE:
            /* Cycle through 48, 49, 50, 51, 52 Hz */
            {
                uint32_t block = sg->sample_count / 4000;  /* 200ms per freq */
                float32_t freqs[] = {48.0f, 49.0f, 50.0f, 51.0f, 52.0f};
                uint32_t idx = block % 5;
                f = freqs[idx];
            }
            amp = 1.0f;
            noise_val = 0.0f;
            break;

        case CASE_AMP_CHANGE:
            f = GRID_FREQ;
            /* Amplitude drops from 1.0 to 0.5 at 0.15s */
            amp = (sg->sample_count < 3000) ? 1.0f : 0.5f;
            noise_val = 0.0f;
            break;

        case CASE_NOISE:
            f   = GRID_FREQ;
            amp = 1.0f;
            /* SNR = 20 dB → noise_std = sqrt(0.5/100) = 0.0707 */
            noise_val = 0.0707f * rand_gauss();
            break;
    }

    /* Advance phase */
    sg->phase += TWO_PI * f * DELTA_T;
    if (sg->phase > TWO_PI) {
        sg->phase -= TWO_PI;
    }

    /* Generate output */
    sg->output = amp * fast_sin(sg->phase) + noise_val;

    sg->sample_count++;
    sg->case_changed = 0;

    return sg->output;
}
