% x8(n) = x4(n) + j*x5(n)
N_vals = [8, 16];
figure('Name', 'x8(n) 频谱');
for i = 1:length(N_vals)
    N = N_vals(i);
    n = 0:N-1;
    x8 = cos(pi/4 * n) + 1j * sin(pi/8 * n);
    X8 = fft(x8, N);
    subplot(2, 1, i);
    stem(0:N-1, abs(X8), 'filled');
    title(['x_8(n) 幅频特性, N=', num2str(N)]);
end