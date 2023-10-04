clc; clear all;
syms x;
f(x) = x * exp(x) - 1;
%% 参数设置
x0 = 0.4;
x1 = 0.6;
epsilon = 5e-6; %规定收敛精度
episode = 1000; %规定最大迭代次数

for i = 1:episode
    %% 割线法迭代
    x2 = x1 - f(x1)/(f(x1) - f(x0)) * (x1 - x0);
    if abs(x2 - x1) < epsilon
        fprintf("该方程的近似解为%d \n", double(x2));
        break;
    end
    x0 = x1;
    x1 = x2;
    %% 无法收敛判定
    if i == episode
        print("该方程在规定最大迭代次数范围内无法收敛.");
    end
end