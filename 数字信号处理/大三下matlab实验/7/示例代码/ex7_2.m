% x2(n)
n = 0:7;
x2 = [1, 2, 3, 4, 4, 3, 2, 1];
N_vals = [8, 16];
figure('Name', 'x2(n) 频谱');
for i = 1:length(N_vals)
    N = N_vals(i);
    X2 = fft(x2, N);
    subplot(2, 1, i);
    stem(0:N-1, abs(X2), 'filled');
    title(['x_2(n) 幅频特性, N=', num2str(N)]);
end