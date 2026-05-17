% x7(n) = x4(n) + x5(n)
N_vals = [8, 16];
figure('Name', 'x7(n) 频谱');
for i = 1:length(N_vals)
    N = N_vals(i);
    n = 0:N-1;
    x7 = cos(pi/4 * n) + sin(pi/8 * n);
    X7 = fft(x7, N);
    subplot(2, 1, i);
    stem(0:N-1, abs(X7), 'filled');
    title(['x_7(n) 幅频特性, N=', num2str(N)]);
end