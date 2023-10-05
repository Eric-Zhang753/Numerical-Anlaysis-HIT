%-------------本程序仅适用于二阶多项式(y = a + b * x^2)最小二乘拟合-----------%
clc; clear all;
%% 数据定义
X = [3 4 5 6 7 8 9];
F = [2.01 2.98 3.50 5.02 5.47 6.02 7.05];
m = length(X);
%% phi0,phi0
phi0_0 = 0;
for i = 1:m
    phi0_0 = phi0_0 + 1 * 1;
end
%% phi1,phi0 = phi0,phi1
phi0_1 = 0;
for i = 1:m
    phi0_1 = phi0_1 + 1 * X(i)^2;
end
phi1_0 = phi0_1;
%% phi1,phi1
phi1_1 = 0;
for i = 1:m
    phi1_1 = phi1_1 + X(i)^2 * X(i)^2;
end
%% phi0_f
phi0_f = 0;
for i = 1:m
    phi0_f = phi0_f + 1 * F(i);
end
%% phi1_f
phi1_f = 0;
for i = 1:m
    phi1_f = phi1_f + X(i)^2 * F(i);
end
%% 矩阵运算求解系数
result = inv([phi0_0 phi0_1; phi1_0 phi1_1]) * [phi0_f; phi1_f];
x = [3:0.001:9];
y = result(1) + result(2) * x.^2;
plot(x, y, '-r', X, F, '.b')
grid on



