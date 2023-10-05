%------------------------Lagrange��ֵ-----------------------%
clc; clear all;
%% ��������
n = 11; %��ֵ�����
%% ��������
syms x k;
f(x) = 1/(1 + 25 * x^2);
xi(k) = -1 + 2*k/(n-1);
Xi = zeros(n, 1);
Fi = zeros(n, 1);
phi(x) = x;
%% ����Li�������
Li = [x];
for i = 1:n-1
    Li = [Li x];
end
%% ����Xi
for i = 1:n
    Xi(i) = xi(i-1);
end
%% ����Fi
for i = 1:n
    Fi(i) = f(Xi(i));
end
%% ����Li
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
%% ����Lagrange��ֵ����ʽ
for i = 1:n
    phi = phi + Fi(i) * Libody(i);
end
phi = phi - x;
%% ��ͼ
p = [-1.:0.001:1.];
plot(p, phi(p), '-r', p, f(p), '-b')
grid on

