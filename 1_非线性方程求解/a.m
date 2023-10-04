clc;
clear all;
%% 参数初始化
syms x;
f(x) = sin(x) - 0.5 .* x^2;
min = 1;
max = 2;
epsilon = 5e-6;
while f(min) * f(max) < 0
    %% 二分法
    middle = (max + min) / 2;
    if f(middle) * f(min) < 0
        max = middle;
    elseif f(middle) * f(max) < 0
        min = middle;
    elseif f(middle) == 0
        fprintf("该方程在规定区间内的精确解为%d \n", middle);
        break;
    end
    %% 近似精度判定
    if (max - min) < epsilon
        fprintf("该方程在规定区间内的近似解为%d \n", middle);
        break;
    end
end
