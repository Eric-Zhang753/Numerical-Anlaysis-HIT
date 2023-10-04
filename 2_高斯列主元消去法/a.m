%-------------高斯消去法-------------%
clc; clear all;
%% 参数1
A = [1e-8 2 3; -1 3.712 4.623; -2 1.072 5.643];
b = [1; 2; 3];
%% 参数2
% A = [4 -2 4; -2 17 10; -4 10 9];
% b = [10; 3; 7];

A_b = [A b]; %增广矩阵
%% 高斯消去循环
[m, n] = size(A_b);
for i = 1:m
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