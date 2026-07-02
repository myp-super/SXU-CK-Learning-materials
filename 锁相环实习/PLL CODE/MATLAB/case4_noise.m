%% case4_noise.m
% ============================================================
% Case 4: Gaussian Noise Test
% Input signal with additive white Gaussian noise
% Observe: PLL anti-interference capability
% ============================================================

clear; clc; close all;

% ---- Simulation Parameters ----
GridFreq = 50;
Fs       = 50000;
Ts       = 1 / Fs;
Tfinal   = 0.3;
t        = 0:Ts:Tfinal;
N        = length(t);

% ---- Noise Parameters ----
SNR_dB = 20;  % Signal-to-Noise Ratio (dB)
% SNR = 10*log10(Ps/Pn) => Pn = Ps / 10^(SNR/10)
% For sine: Ps = A^2/2 = 0.5
Ps = 0.5;  % Signal power (A=1 sine)
Pn = Ps / (10^(SNR_dB/10));
noise_std = sqrt(Pn);

fprintf('=== Case 4: Gaussian Noise (SNR = %d dB) ===\n', SNR_dB);

% ---- Generate Noisy Input Signal ----
rng(42);  % Reproducible noise
u_clean = sin(2 * pi * GridFreq * t);
noise   = noise_std * randn(1, N);
u       = u_clean + noise;

fprintf('Grid Freq: %d Hz, Fs: %d Hz, Duration: %.2f s\n', GridFreq, Fs, Tfinal);
fprintf('Noise std: %.4f, SNR: %d dB\n', noise_std, SNR_dB);
fprintf('Running PLL...\n');

% ---- Run PLL ----
result = PLL(u, Ts, GridFreq);

% ---- Summary Stats ----
% Steady-state analysis (last 20%)
ss_start = round(0.8 * N);
freq_ss  = result.fo(ss_start:end);
fprintf('Steady-state frequency: %.2f +/- %.3f Hz\n', ...
    mean(freq_ss), std(freq_ss));
fprintf('Frequency ripple (noise): %.3f Hz RMS\n', std(freq_ss));
fprintf('Locked: %s\n', ternary(result.lock_state(end), 'YES', 'NO'));

% ---- Plot and Save ----
plot_result(result, 'Case4_Noise');

fprintf('Done.\n\n');

function s = ternary(cond, t, f)
    if cond, s = t; else, s = f; end
end
