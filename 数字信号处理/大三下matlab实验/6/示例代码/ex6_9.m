% 单位脉冲序列 δ(n)，-3 < n < 4
n = -3:3;
f = zeros(1,length(n));
f(n == 0) = 1;
stem(n, f, 'filled', 'LineWidth', 1.5);
xlabel('n'); ylabel('δ(n)');
title('单位脉冲序列 δ(n)');
grid on;