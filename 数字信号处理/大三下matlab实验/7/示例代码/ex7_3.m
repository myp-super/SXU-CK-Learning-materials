% x3(n)
x3 = [4, 3, 2, 1, 1, 2, 3, 4];
N_vals = [8, 16];
figure('Name', 'x3(n) 频谱');
for i = 1:length(N_vals)
    N = N_vals(i);
    X3 = fft(x3, N);
    subplot(2, 1, i);
    stem(0:N-1, abs(X3), 'filled');
    title(['x_3(n) 幅频特性, N=', num2str(N)]);
end