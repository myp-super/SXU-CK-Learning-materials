%% case1_phase_jump.m
% ============================================================
% Case 1: Phase Jump Test
% Input signal undergoes +90 degree phase jump at midpoint
% Observe: PLL re-locking behavior, phase error convergence
% Ref: 电网PLL模拟测试 PDF Page 2
% ============================================================

clear; clc; close all;

% ---- Simulation Parameters (from teacher) ----
GridFreq = 50;              % Grid frequency (Hz)
Fs       = 50000;           % Sampling rate (Hz) - teacher's ISR frequency
Ts       = 1 / Fs;          % Sampling period
Tfinal   = 0.3;             % Total simulation time (s)
t        = 0:Ts:Tfinal;     % Time vector
N        = length(t);

% ---- Generate Input Signal with Phase Jump at Midpoint ----
midpoint = floor(N / 2);

u = zeros(1, N);
for n = 1:N
    if n < midpoint
        u(n) = sin(2 * pi * GridFreq * Ts * n);
    else
        u(n) = sin(2 * pi * GridFreq * Ts * n + pi/2);  % +90 deg phase jump
    end
end

% ---- Run PLL ----
fprintf('=== Case 1: Phase Jump (+90 deg) ===\n');
fprintf('Grid Freq: %d Hz, Fs: %d Hz, Duration: %.2f s\n', GridFreq, Fs, Tfinal);
fprintf('Phase jump at t = %.3f s\n', t(midpoint));
fprintf('Running PLL...\n');

result = PLL(u, Ts, GridFreq);

% ---- Compute Lock Time after Jump ----
lock_idx = find(result.lock_state(midpoint:end) == 1, 1, 'first');
if ~isempty(lock_idx)
    lock_time = lock_idx * Ts;
    fprintf('Re-lock time after jump: %.1f ms\n', lock_time * 1000);
else
    fprintf('Re-lock time: Not locked within simulation window\n');
end

% ---- Summary Stats ----
fprintf('Final frequency: %.2f Hz\n', result.fo(end));
fprintf('Final phase error: %.4f\n', result.phase_error(end));
fprintf('Locked: %s\n', ternary(result.lock_state(end), 'YES', 'NO'));

% ---- Plot and Save ----
plot_result(result, 'Case1_PhaseJump');

fprintf('Done.\n\n');

% Helper
function s = ternary(cond, t, f)
    if cond, s = t; else, s = f; end
end
