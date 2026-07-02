%% Quick test: notch c1 parameter sweep for freq shift tracking
GridFreq = 50; Fs = 50000; Ts = 1/Fs; Tfinal = 0.4;
t = 0:Ts:Tfinal; N = length(t); mid = floor(N/2);
newFreq = 55;

% Generate phase-continuous 50->55 Hz step
phase = 0; u = zeros(1, N);
for n = 1:N
    if n < mid
        phase = phase + 2*pi*GridFreq*Ts;
    else
        phase = phase + 2*pi*newFreq*Ts;
    end
    u(n) = sin(phase);
end

fprintf('Testing c1 sweep for 50->55Hz step:\n');
fprintf('%-8s %-12s %-10s %-12s\n', 'c1', 'fo_end(Hz)', 'locked', 'ylf_ripple');

for c1 = [0.1, 0.3, 0.5, 0.7, 1.0, 2.0]
    r = test_pll_notch(u, Ts, GridFreq, c1, 0.00001);
    fprintf('%-8.1f %-12.2f %-10d %-12.1f\n', ...
        c1, r.fo(end), r.lock_state(end), std(r.ylf(mid:end)));
end

function r = test_pll_notch(u, Ts, GridFreq, c1, c2)
    N = length(u); PI = 3.14159265358979;
    wn = 2*PI*GridFreq; wn_notch = 2*PI*GridFreq*2;
    B0_lf = 166.877556; B1_lf = -166.322444; A1_lf = -1.0;
    x = 2*c2*wn_notch*Ts; y = 2*c1*wn_notch*Ts; z = wn_notch*Ts*wn_notch*Ts;
    A1n = y - 2; A2n = z - y + 1; B0n = 1; B1n = x - 2; B2n = z - x + 1;
    Upd = [0,0,0]; ynotch = [0,0,0]; ylf = [0,0];
    theta_v = [0,0]; sin_v = [0,0]; cos_v = [0.999, 0.999];
    lock_cnt = 0; LOCK_WIN = round(0.03 / Ts);
    fo = zeros(1,N); ylf_arr = zeros(1,N); lock_arr = zeros(1,N);
    for n = 1:N
        Upd(1) = u(n) * cos_v(2);
        ynotch(1) = -A1n*ynotch(2) - A2n*ynotch(3) + B0n*Upd(1) + B1n*Upd(2) + B2n*Upd(3);
        Upd(3) = Upd(2); Upd(2) = Upd(1);
        ylf(1) = -A1_lf*ylf(2) + B0_lf*ynotch(1) + B1_lf*ynotch(2);
        ynotch(3) = ynotch(2); ynotch(2) = ynotch(1); ylf(2) = ylf(1);
        wo = wn - ylf(1);
        theta_v(1) = theta_v(2) + wo*Ts;
        if theta_v(1) > 2*PI, theta_v(1) = theta_v(1) - 2*PI; end
        theta_v(2) = theta_v(1);
        sin_v(2) = sin(theta_v(1)); cos_v(2) = cos(theta_v(1));
        freq_err = abs(wo - wn) / (2*PI);
        if freq_err < 1.0, lock_cnt = min(lock_cnt+1, LOCK_WIN); else lock_cnt = max(lock_cnt-1, 0); end
        fo(n) = wo / (2*PI); ylf_arr(n) = ylf(1);
        lock_arr(n) = double(lock_cnt >= LOCK_WIN);
    end
    r.fo = fo; r.ylf = ylf_arr; r.lock_state = lock_arr;
end
