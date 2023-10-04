clc; clear all;
syms x y z;
F(x, y, z) = [x*y - z^2 - 1; x*y*z + y^2 - x^2 - 2; exp(x) + z - exp(y) - 3];
X0 = [0.9; 0.9; 0.95];
X1 = [1.; 1.; 1.];
%% 参数设置
epsilon = 5e-8; %规定收敛精度
episode = 1000; %规定最大迭代次数

for i = 1:episode
    %% 拟牛顿迭代
    
    X2 = X1 - (X1 - X0) ./ (F(X1(1), X1(2), X1(3)) - F(X0(1), X0(2), X0(3))) .* F(X1(1), X1(2), X1(3));
    X0 = double(X1);
    X1 = double(X2);
%     fprintf("当前为第%d轮迭代，当前x为%f \n", i, X1);
    if norm(X1 - X0) < epsilon
        fprintf("该方程的近似解为%d \n", double(X1));
        break;
    end
%     x = double(x_);
    %% 无法收敛判定
    if i == episode
        fprintf("该方程在规定最大迭代次数范围内无法收敛.");
    end
end
