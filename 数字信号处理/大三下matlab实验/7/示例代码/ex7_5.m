% x5(n) = sin(pi/8 * n)
N_vals = [8, 16];
figure('Name', 'x5(n) 频谱');
for i = 1:length(N_vals)
    N = N_vals(i);
    n = 0:N-1;
    x5 = sin(pi/8 * n);
    X5 = fft(x5, N);
    subplot(2, 1, i);
    stem(0:N-1, abs(X5), 'filled');
    title(['x_5(n) 幅频特性, N=', num2str(N)]);
end