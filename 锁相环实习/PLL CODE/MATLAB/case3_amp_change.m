%% case3_amp_change.m
% ============================================================
% Case 3: Amplitude Change Test
% Input amplitude: 1.0 -> 0.5 at midpoint
% Observe: PLL stability under amplitude disturbance
% ============================================================

clear; clc; close all;

% ---- Simulation Parameters ----
GridFreq = 50;
Fs       = 50000;
Ts       = 1 / Fs;
Tfinal   = 0.3;
t        = 0:Ts:Tfinal;
N        = length(t);

% ---- Generate Input Signal with Amplitude Change at Midpoint ----
midpoint = floor(N / 2);
amp1 = 1.0;
amp2 = 0.5;

fprintf('=== Case 3: Amplitude Change (%.1f -> %.1f) ===\n', amp1, amp2);

u = zeros(1, N);
for n = 1:N
    if n < midpoint
        u(n) = amp1 * sin(2 * pi * GridFreq * Ts * n);
    else
        u(n) = amp2 * sin(2 * pi * GridFreq * Ts * n);
    end
end

fprintf('Grid Freq: %d Hz, Fs: %d Hz, Duration: %.2f s\n', GridFreq, Fs, Tfinal);
fprintf('Amplitude change at t = %.3f s\n', t(midpoint));
fprintf('Running PLL...\n');

% ---- Run PLL ----
result = PLL(u, Ts, GridFreq);

% ---- Summary Stats ----
fprintf('Final frequency: %.2f Hz\n', result.fo(end));
fprintf('Frequency ripple (post-change): %.3f Hz peak-to-peak\n', ...
    max(result.fo(midpoint:end)) - min(result.fo(midpoint:end)));
fprintf('Locked: %s\n', ternary(result.lock_state(end), 'YES', 'NO'));

% ---- Plot and Save ----
plot_result(result, 'Case3_AmpChange');

fprintf('Done.\n\n');

function s = ternary(cond, t, f)
    if cond, s = t; else, s = f; end
end
