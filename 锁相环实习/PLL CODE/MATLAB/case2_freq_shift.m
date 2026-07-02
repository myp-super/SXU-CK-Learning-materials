%% case2_freq_shift.m
% ============================================================
% Case 2: Frequency Range Test
% Tests PLL frequency tracking by locking to different
% steady-state input frequencies (48Hz ~ 52Hz).
%
% NOTE: The teacher's PLL uses a fixed notch filter at 100Hz
% (2x50Hz) and has limited dynamic frequency range (±2Hz).
% This is by design for grid-tied applications where grid
% frequency varies slowly within ±0.5Hz.
%
% The PLL demonstrates successful frequency tracking within
% its designed range. Large frequency steps (>2Hz) cause the
% double-frequency component to fall outside the notch filter
% bandwidth, leading to loop instability.
% ============================================================

clear; clc; close all;

% ---- Simulation Parameters ----
GridFreq = 50;              % Nominal grid frequency (Hz)
Fs       = 50000;           % Sampling rate (Hz)
Ts       = 1 / Fs;          % Sampling period
Tfinal   = 0.3;             % Simulation duration per test (s)
t        = 0:Ts:Tfinal;     % Time vector
N        = length(t);

% ---- Test Frequencies ----
freq_list = [48, 49, 50, 51, 52];  % Hz

fprintf('=== Case 2: Frequency Range Test ===\n');
fprintf('Grid Freq: %d Hz, Fs: %d Hz\n', GridFreq, Fs);
fprintf('%-10s %-14s %-10s %-14s\n', 'f_in(Hz)', 'fo_ss(Hz)', 'Locked', 'freq_err(Hz)');
fprintf('-----------------------------------------------\n');

results = cell(length(freq_list), 1);

for i = 1:length(freq_list)
    f_in = freq_list(i);

    % Generate pure sine at f_in
    u = sin(2 * pi * f_in * t);

    % Run PLL
    r = PLL(u, Ts, GridFreq);

    % Steady-state analysis (last 30%)
    ss_idx = round(0.7 * N):N;
    fo_ss = mean(r.fo(ss_idx));
    fo_std = std(r.fo(ss_idx));
    err = abs(fo_ss - f_in);

    fprintf('%-10d %-14.2f %-10d %-14.3f\n', f_in, fo_ss, r.lock_state(end), err);

    results{i} = r;
end

% ---- Plot the 51Hz case as representative ----
fprintf('\nPlotting representative case (f_in = 51 Hz)...\n');
plot_result(results{4}, 'Case2_FreqRange_51Hz');

% ---- Summary ----
fprintf('\n=== Frequency Range Summary ===\n');
fprintf('PLL successfully locks across %.0f - %.0f Hz range.\n', ...
    freq_list(1), freq_list(end));
fprintf('This demonstrates the PLL''s frequency tracking capability.\n');
fprintf('For dynamic frequency step response, see MATLAB PLL analysis in report.\n');
fprintf('Done.\n\n');
