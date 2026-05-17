Um = 1;             % 振幅 1 V
f = 1;              % 模拟频率 1 Hz
fs = 32;            % 采样频率 32 Hz（一个周期采32点）
T = 1/f;            % 周期 1 s
w = 2*pi*f/fs;  % 数字频率 = pi/16

% 连续信号（两个周期，用于绘图）
t_cont = linspace(0, 2*T, 1000);
x_cont = Um * sin(2*pi*f*t_cont);
n = 0 : 31;                 % 采样序号
x_sample = Um * sin(w * n);   % 使用数字频率 omega
% 绘图
figure;
plot(t_cont, x_cont, 'b-', 'LineWidth', 1.5); hold on;
stem(n/fs, x_sample, 'r', 'LineWidth', 1.5, 'MarkerSize', 6);
xlabel('时间 (s)');
ylabel('幅值 (V)');
title('正弦信号及一个周期的32点采样（数字频率 ω = π/16）');
legend('连续波形', '离散采样点');
grid on;