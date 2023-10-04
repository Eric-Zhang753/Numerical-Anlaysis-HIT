clc; clear all;
syms x;
%% function1
% f(x) = x * exp(x) - 1;
% f_diff(x) = diff(f(x));
% x = 0.5;
%% function2
% f(x) = x^3 - x - 1;
% f_diff(x) = diff(f(x));
% x = 1;
%% function3
f(x) = (x - 1)^2 * (2*x - 1);
f_diff(x) = diff(f(x));
% x = 0.45;
x = 0.65;
%% 参数设置
epsilon = 5e-6; %规定收敛精度
episode = 1000; %规定最大迭代次数

for i = 1:episode
    %% 牛顿迭代
    x_ = x - f(x)/f_diff(x);
    if abs(x - x_) < epsilon
        fprintf("该方程的近似解为%d \n", double(x));
        break;
    end
    x = x_;
    %% 无法收敛判定
    if i == episode
        print("该方程在规定最大迭代次数范围内无法收敛.");
    end
end
