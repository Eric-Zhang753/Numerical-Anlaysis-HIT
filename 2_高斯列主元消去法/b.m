%-------------��˹����Ԫ��ȥ��-------------%
clc; clear all;
%% ����1
% A = [1e-8 2 3; -1 3.712 4.623; -2 1.072 5.643];
% B = [1; 2; 3];
%% ����2
A = [4 -2 4; -2 17 10; -4 10 9];
B = [10; 3; 7];

A_b = [A B]; %�������
%% ��˹����Ԫ��ȥѭ��
[m, n] = size(A_b);
sub = zeros(1, n);
for i = 1:m
    %% �滻��Ԫ��
    [p, q] = max(abs(A_b(:, 1))); %qΪ��ǰ������Ԫ�����ֵ��λ�ã�������
    if q > i
        sub = A_b(i, :);
        A_b(i, :) = A_b(q, :);
        A_b(q, :) = sub;
    end
    %% ��Ԫ
    for j = 1:m-i
        k = A_b(j+i, i)/A_b(i, i);
        A_b(j+i, :) = A_b(j+i, :) - k .* A_b(i, :);
    end
end
%% ��������ѭ��
X = zeros(3,1);
for i = m:-1:1
    total = 0;
    for j = 1:m
        total = total + X(j)*A_b(i, j);
    end
    X(i) = (A_b(i, n) - total)/A_b(i, i);
end
double(X)