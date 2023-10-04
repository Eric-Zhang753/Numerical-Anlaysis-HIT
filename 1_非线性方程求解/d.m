clc; clear all;
syms x;
f(x) = (x - 1)^2 * (2*x - 1);
f_diff(x) = diff(f(x));
x = 0.55;
%% 参数设置
epsilon = 5e-6; %规定收敛精度
episode = 10000; %规定最大迭代次数

for i = 1:episode
    %% 改进牛顿迭代
    x_ = x - 2 * f(x)/f_diff(x);
    fprintf("当前为第%d轮迭代，当前x为%f \n", i, x_);
    if abs(x - x_) < epsilon
        fprintf("该方程的近似解为%d \n", double(x));
        break;
    end
    x = double(x_);
    %% 无法收敛判定
    if i == episode
        fprintf("该方程在规定最大迭代次数范围内无法收敛.");
    end
end
