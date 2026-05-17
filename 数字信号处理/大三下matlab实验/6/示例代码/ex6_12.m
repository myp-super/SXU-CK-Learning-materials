% 正弦序列 3 sin(nπ/4)，0 < n < 20
n = 1:19;
f = 3 * sin(n * pi / 4);
stem(n, f, 'filled', 'LineWidth', 1.5);
xlabel('n'); ylabel('3 sin(nπ/4)');
title('正弦序列 3 sin(nπ/4)');