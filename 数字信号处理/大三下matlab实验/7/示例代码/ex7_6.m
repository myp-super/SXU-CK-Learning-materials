% x6(t) = cos(8*pi*t) + cos(16*pi*t) + cos(20*pi*t)
fs = 64; 
N_vals = [8, 16, 32];
figure('Name', 'x6(t) 离散化频谱');
for i = 1:length(N_vals)
    N = N_vals(i);
    t = (0:N-1) / fs; % 根据抽样率生成时间序列
    x6 = cos(8*pi*t) + cos(16*pi*t) + cos(20*pi*t);
    X6 = fft(x6, N);
    subplot(3, 1, i);
    stem(0:N-1, abs(X6), 'filled');
    title(['x_6(n) 幅频特性, N=', num2str(N)]);
end