% x4(n) = cos(pi/4 * n)
N_vals = [8, 16];
figure('Name', 'x4(n) 频谱');
for i = 1:length(N_vals)
    N = N_vals(i);
    n = 0:N-1;
    x4 = cos(pi/4 * n);
    X4 = fft(x4, N);
    subplot(2, 1, i);
    stem(0:N-1, abs(X4), 'filled');
    title(['x_4(n) 幅频特性, N=', num2str(N)]);
end