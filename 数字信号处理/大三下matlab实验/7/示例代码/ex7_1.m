% x1(n) = R4(n)
x1 = [1, 1, 1, 1]; 
N_vals = [8, 16];
figure('Name', 'x1(n) 频谱');
for i = 1:length(N_vals)
    N = N_vals(i);
    X1 = fft(x1, N);
    subplot(2, 1, i);
    stem(0:N-1, abs(X1), 'filled');
    title(['x_1(n) 幅频特性, N=', num2str(N)]);
end