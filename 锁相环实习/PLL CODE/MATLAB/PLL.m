function result = PLL(u, Ts, GridFreq)
% PLL - Single Phase Software PLL with Notch Filter
% =====================================================
% Strictly reproduces teacher's SPLL_1PH.H algorithm
% Ref: 电网PLL模拟测试 (cekong, Apr 2020)
%
% Algorithm chain:
%   Phase Detect -> Notch Filter (@2*f0) -> PI Loop Filter -> VCO -> sin/cos
%
% Inputs:
%   u        - Input signal vector
%   Ts       - Sampling period (seconds)
%   GridFreq - Nominal grid frequency (Hz)
%
% Output:
%   result - struct with fields:
%     .theta       - Phase estimate (rad)
%     .fo          - Frequency estimate (Hz)
%     .wo          - Angular frequency (rad/s)
%     .ylf         - Loop filter output
%     .ynotch      - Notch filter output
%     .Upd         - Phase detector output
%     .sin_est     - PLL sine output
%     .cos_est     - PLL cosine output
%     .phase_error - Input minus PLL sine
%     .lock_state  - Lock detection (0/1)
%     .t           - Time vector
%     .Ts          - Sampling period
%     .GridFreq    - Nominal frequency
%
% Usage:
%   t = 0:50e-6:0.2;
%   u = sin(2*pi*50*t);
%   r = PLL(u, 50e-6, 50);
%   plot(r.t, r.fo);

N = length(u);
PI = 3.14159265358979;

% =====================================================================
% PLL Parameters (exact values from teacher's adc.c and SPLL_1PH.H)
% =====================================================================
wn_vco   = 2 * PI * GridFreq;        % VCO nominal angular frequency
wn_notch = 2 * PI * GridFreq * 2;    % Notch target = 2x grid (100Hz)

% Loop Filter coefficients (teacher's adc.c lines 163-165)
% NOTE: Teacher used B0=166.878, B1=-166.322 (ζ≈0.35, ωn≈118).
% This is INTENTIONALLY lower than the PDF design target (ζ=0.7, ωn=110)
% to limit residual 100Hz ripple amplification after imperfect notch filtering.
% Design trade-off: lower damping → less ripple amplification → stable lock.
B0_lf = 166.877556;
B1_lf = -166.322444;
A1_lf = -1.0;

% Notch filter damping (teacher's adc.c lines 194-195)
c1 = 0.1;
c2 = 0.00001;

% Compute notch coefficients (teacher's SPLL_1PH.H lines 73-84)
x = 2.0 * c2 * wn_notch * Ts;
y = 2.0 * c1 * wn_notch * Ts;
z = wn_notch * Ts * wn_notch * Ts;

A1_notch = y - 2;
A2_notch = z - y + 1;
B0_notch = 1.0;
B1_notch = x - 2;
B2_notch = z - x + 1;

% =====================================================================
% State Variables (matching SPLL_1ph struct layout)
% =====================================================================
Upd    = [0, 0, 0];       % Phase detector [curr, prev, prev2]
ynotch = [0, 0, 0];       % Notch filter   [curr, prev, prev2]
ylf    = [0, 0];          % Loop filter    [curr, prev]
theta_v= [0, 0];          % Phase          [curr, prev]
sin_v  = [0, 0];          % Sine           [curr, prev]
cos_v  = [0.999, 0.999];  % Cosine         [curr, prev]  (init 0.999 per teacher line 62-63)

wn = wn_vco;  % Nominal angular frequency (const)

% Lock detection state
lock_count = 0;
LOCK_WINDOW = round(0.02 / Ts);  % ~20ms lock confirmation
FREQ_LOCK_THRESH = 2.0;          % Hz (accounts for residual notch ripple)
ylf_lock_thresh = 10.0;          % ylf must be stable within ±10

% =====================================================================
% Pre-allocate outputs
% =====================================================================
theta_arr   = zeros(1, N);
wo_arr      = zeros(1, N);
fo_arr      = zeros(1, N);
ylf_arr     = zeros(1, N);
ynotch_arr  = zeros(1, N);
Upd_arr     = zeros(1, N);
sin_arr     = zeros(1, N);
cos_arr     = zeros(1, N);
phase_err   = zeros(1, N);
lock_arr    = zeros(1, N);

% =====================================================================
% Main PLL Loop (exact replica of SPLL_1ph_run_FUNC)
% =====================================================================
for n = 1:N
    % ---- Phase Detector (teacher line 91) ----
    % Upd[0] = AC_input * cos[1]
    Upd(1) = u(n) * cos_v(2);

    % ---- Notch Filter (teacher lines 95-100) ----
    % ynotch[0] = -A1*ynotch[1] - A2*ynotch[2]
    %            + B0*Upd[0] + B1*Upd[1] + B2*Upd[2]
    ynotch(1) = -A1_notch * ynotch(2) - A2_notch * ynotch(3) ...
                + B0_notch * Upd(1) + B1_notch * Upd(2) + B2_notch * Upd(3);

    % Shift Upd (teacher lines 102-103)
    Upd(3) = Upd(2);
    Upd(2) = Upd(1);

    % ---- PI Loop Filter (teacher lines 107-110) ----
    % ylf[0] = -A1_lf*ylf[1] + B0_lf*ynotch[0] + B1_lf*ynotch[1]
    % With A1_lf=-1: ylf[0] = ylf[1] + B0_lf*ynotch[0] + B1_lf*ynotch[1]
    ylf(1) = -A1_lf * ylf(2) + B0_lf * ynotch(1) + B1_lf * ynotch(2);

    % Shift delay lines (teacher lines 112-114)
    ynotch(3) = ynotch(2);
    ynotch(2) = ynotch(1);
    ylf(2) = ylf(1);

    % ---- VCO (teacher lines 149-153) ----
    % wo = wn - ylf[0]   (SUBTRACTION, not addition)
    wo = wn - ylf(1);

    % theta[0] = theta[1] + wo * delta_t
    theta_v(1) = theta_v(2) + wo * Ts;

    % Wrap theta (teacher lines 152-153)
    if theta_v(1) > 2 * PI
        theta_v(1) = theta_v(1) - 2 * PI;
    end

    theta_v(2) = theta_v(1);  % (teacher line 154)

    % ---- Sin/Cos via CMSIS DSP equivalents (teacher lines 155-156) ----
    sin_v(2) = sin(theta_v(1));
    cos_v(2) = cos(theta_v(1));

    % ---- Lock Detection ----
    % Locked when: frequency error < threshold AND ylf is stable
    freq_err_hz = abs(wo - wn) / (2 * PI);
    ylf_stable = abs(ylf(1)) < ylf_lock_thresh;
    if freq_err_hz < FREQ_LOCK_THRESH && ylf_stable
        lock_count = min(lock_count + 1, LOCK_WINDOW);
    else
        lock_count = max(lock_count - 2, 0);  % faster unlock on disturbance
    end

    % ---- Store ----
    theta_arr(n)  = theta_v(1);
    wo_arr(n)     = wo;
    fo_arr(n)     = wo / (2 * PI);
    ylf_arr(n)    = ylf(1);
    ynotch_arr(n) = ynotch(1);
    Upd_arr(n)    = Upd(1);
    sin_arr(n)    = sin_v(2);
    cos_arr(n)    = cos_v(2);
    phase_err(n)  = u(n) - sin_v(2);
    lock_arr(n)   = double(lock_count >= LOCK_WINDOW);
end

% =====================================================================
% Build output structure
% =====================================================================
result = struct( ...
    'theta',       theta_arr, ...
    'fo',          fo_arr, ...
    'wo',          wo_arr, ...
    'ylf',         ylf_arr, ...
    'ynotch',      ynotch_arr, ...
    'Upd',         Upd_arr, ...
    'sin_est',     sin_arr, ...
    'cos_est',     cos_arr, ...
    'phase_error', phase_err, ...
    'lock_state',  lock_arr, ...
    't',           (0:N-1) * Ts, ...
    'Ts',          Ts, ...
    'GridFreq',    GridFreq ...
);
end
