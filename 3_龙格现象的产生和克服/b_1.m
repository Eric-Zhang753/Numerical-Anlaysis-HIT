%------------------------�ֶ����Բ�ֵ-----------------------%
clc; clear all;
%% ��������
n = 21; %��ֵ�����
%% ��������
syms x k;
f(x) = 1/(1 + 25 * x^2);
xi(k) = -1 + 2*k/(n-1);
Xi = zeros(n, 1);
Fi = zeros(n, 1);

p = [-1.:0.001:1.];
phi = zeros(size(p));

%% ����Xi
for i = 1:n
    Xi(i) = xi(i-1);
end
%% ����Fi
for i = 1:n
    Fi(i) = f(Xi(i));
end

%% ���ɷֶβ�ֵ������ֵ�б�
for i = 1:length(p)
    for j = 1:n-1
        if (p(i) >= Xi(j)) && (p(i) <= Xi(j+1))
            phi(i) = (p(i) - Xi(j+1))/(Xi(j) - Xi(j+1)) * Fi(j) + (p(i) - Xi(j))/(Xi(j+1) - Xi(j)) * Fi(j+1);
        end
    end
end
%% ��ͼ
plot(p, phi, '-r', p, f(p), '-b')
grid on
