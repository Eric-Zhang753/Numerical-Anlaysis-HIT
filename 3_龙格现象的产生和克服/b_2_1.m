%------------------------����������ֵ����һ�߽�������-----------------------%
clc; clear all;
%% ��������
n = 11; %��ֵ�����
%% ��������
syms x k;
f(x) = 1/(1 + 25 * x^2);
diff_f(x) = diff(f);
xi(k) = -1 + 2*k/(n-1);
Xi = zeros(n, 1);
Fi = zeros(n, 1);
Hi = zeros(n-1, 1);
Lam_i = zeros(n-2, 1);
Mu_i = zeros(n-2, 1);
F1 = zeros(n-1, 1); %һ�ײ���
F2 = zeros(n-2 ,1); %���ײ���
Di = zeros(n, 1);
% Mi = zeros(n, 1);
phi(x) = x;
%% ����Xi
for i = 1:n
    Xi(i) = xi(i-1);
end
%% ����Fi
for i = 1:n
    Fi(i) = f(Xi(i));
end
%% ����Hi
for i = 1:n-1
    Hi(i) = Xi(i+1) - Xi(i);
end
%% ����lambda_i��Mu_i
for i = 1:n-2
    Lam_i(i) = Hi(i+1)/(Hi(i)+Hi(i+1));
    Mu_i(i) = 1 - Lam_i(i);
end
%% ����һ�ײ���
for i = 1:n-1
    F1(i) = (Fi(i+1) - Fi(i))/(Xi(i+1) - Xi(i));
end
%% ���ɶ��ײ���
for i = 1:n-2
    F2(i) = (F1(i+1) - F1(i))/(Xi(i+2) - Xi(i));
end
%% Di
for i = 1:n
    if i == 1
        Di(i) = 6/Hi(i) * ((Fi(i+1) - Fi(i))/Hi(i) - diff_f(Xi(i)));
    elseif i == n
        Di(i) = 6/Hi(i-1) * (diff_f(Xi(i)) - (Fi(i) - Fi(i-1))/Hi(i-1));
    else
        Di(i) = 6 * F2(i-1);
    end
end
%% ���ɵ�һ�߽�����ϵ�����󲢼���M
A = 2 * eye(n, n);
A(1,2) = 1;
A(n, n-1) = 1;
for i = 1:n-2
    A(i+1, i) = Mu_i(i);
    A(i+1, i+2) = Lam_i(i);
end
M = inv(A) * Di;
%% ���ɷֶβ�ֵ������ֵ�б�
p = [-1.:0.001:1.];
s = zeros(size(p));
for i = 1:length(p)
    for j = 1:n-1
        if (p(i) >= Xi(j)) && (p(i) <= Xi(j+1))
            s(i) = (Xi(j+1) - p(i))^3/(6 * Hi(j)) * M(j) + (p(i) - Xi(j))^3/(6 * Hi(j)) * M(j+1) + (p(i) - Xi(j))/Hi(j) * (Fi(j+1) - Fi(j) - Hi(j)^2/6 * (M(j+1) - M(j))) + Fi(j) - Hi(j)^2/6 * M(j);
        end
    end
end
%% ��ͼ
plot(p, s, '-r', p, f(p), '-b')
grid on

