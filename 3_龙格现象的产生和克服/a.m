%------------------------Lagrange插值-----------------------%
clc; clear all;
%% 参数定义
n = 11; %插值点个数
%% 函数定义
syms x k;
f(x) = 1/(1 + 25 * x^2);
xi(k) = -1 + 2*k/(n-1);
Xi = zeros(n, 1);
Fi = zeros(n, 1);
phi(x) = x;
%% 创建Li基本框架
Li = [x];
for i = 1:n-1
    Li = [Li x];
end
%% 生成Xi
for i = 1:n
    Xi(i) = xi(i-1);
end
%% 生成Fi
for i = 1:n
    Fi(i) = f(Xi(i));
end
%% 生成Li
for i = 1:n
    Li(i) = 1;
    for j = 1:(i - 1)
        Li(i) = Li(i) * (x - Xi(j)) / (Xi(i) - Xi(j));
    end 
    for j = (i + 1):n
        Li(i) = Li(i) * (x - Xi(j)) / (Xi(i) - Xi(j));
    end
end
Libody = formula(Li);
%% 生成Lagrange插值多项式
for i = 1:n
    phi = phi + Fi(i) * Libody(i);
end
phi = phi - x;
%% 绘图
p = [-1.:0.001:1.];
plot(p, phi(p), '-r', p, f(p), '-b')
grid on

