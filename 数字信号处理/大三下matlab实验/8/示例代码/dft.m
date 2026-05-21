function X = dft(x, N)
% MY_DFT_LOOP 使用双重循环计算 N 点 DFT
%   X = my_dft_loop(x, N) 返回 x 的 N 点离散傅里叶变换
%   x - 输入向量（行或列）
%   N - 变换点数（可大于或小于 length(x)）

    if nargin < 2
        N = length(x);      % 若未指定 N，则默认使用信号长度
    end

    % 保存输入方向，并转为列向量
    is_row = isrow(x);
    x = x(:);
    
    % 截断或补零
    if length(x) > N
        x = x(1:N);         % 截断
    elseif length(x) < N
        x = [x; zeros(N - length(x), 1)];   % 尾部补零
    end

    X = zeros(N, 1);
    for k = 0:N-1
        for n = 0:N-1
            X(k+1) = X(k+1) + x(n+1) * exp(-1j * 2 * pi * k * n / N);
        end
    end

    % 恢复原始方向
    if is_row
        X = X.';
    end
end