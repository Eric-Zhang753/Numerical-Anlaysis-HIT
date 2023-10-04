%-------------高斯列主元消去法-------------%
clc; clear all;
%% 参数1
% A = [1e-8 2 3; -1 3.712 4.623; -2 1.072 5.643];
% B = [1; 2; 3];
%% 参数2
A = [4 -2 4; -2 17 10; -4 10 9];
B = [10; 3; 7];

A_b = [A B]; %增广矩阵
%% 高斯列主元消去循环
[m, n] = size(A_b);
sub = zeros(1, n);
for i = 1:m
    %% 替换主元素
    [p, q] = max(abs(A_b(:, 1))); %q为当前列所有元素最大值的位置（行数）
    if q > i
        sub = A_b(i, :);
        A_b(i, :) = A_b(q, :);
        A_b(q, :) = sub;
    end
    %% 消元
    for j = 1:m-i
        k = A_b(j+i, i)/A_b(i, i);
        A_b(j+i, :) = A_b(j+i, :) - k .* A_b(i, :);
    end
end
%% 迭代计算循环
X = zeros(3,1);
for i = m:-1:1
    total = 0;
    for j = 1:m
        total = total + X(j)*A_b(i, j);
    end
    X(i) = (A_b(i, n) - total)/A_b(i, i);
end
double(X)