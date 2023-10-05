%------------------------分段线性插值-----------------------%
clc; clear all;
%% 参数定义
n = 21; %插值点个数
%% 函数定义
syms x k;
f(x) = 1/(1 + 25 * x^2);
xi(k) = -1 + 2*k/(n-1);
Xi = zeros(n, 1);
Fi = zeros(n, 1);

p = [-1.:0.001:1.];
phi = zeros(size(p));

%% 生成Xi
for i = 1:n
    Xi(i) = xi(i-1);
end
%% 生成Fi
for i = 1:n
    Fi(i) = f(Xi(i));
end

%% 生成分段插值函数数值列表
for i = 1:length(p)
    for j = 1:n-1
        if (p(i) >= Xi(j)) && (p(i) <= Xi(j+1))
            phi(i) = (p(i) - Xi(j+1))/(Xi(j) - Xi(j+1)) * Fi(j) + (p(i) - Xi(j))/(Xi(j+1) - Xi(j)) * Fi(j+1);
        end
    end
end
%% 绘图
plot(p, phi, '-r', p, f(p), '-b')
grid on
