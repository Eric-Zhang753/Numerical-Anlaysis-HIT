clc;
clear all;
%% ������ʼ��
syms x;
f(x) = sin(x) - 0.5 .* x^2;
min = 1;
max = 2;
epsilon = 5e-6;
while f(min) * f(max) < 0
    %% ���ַ�
    middle = (max + min) / 2;
    if f(middle) * f(min) < 0
        max = middle;
    elseif f(middle) * f(max) < 0
        min = middle;
    elseif f(middle) == 0
        fprintf("�÷����ڹ涨�����ڵľ�ȷ��Ϊ%d \n", middle);
        break;
    end
    %% ���ƾ����ж�
    if (max - min) < epsilon
        fprintf("�÷����ڹ涨�����ڵĽ��ƽ�Ϊ%d \n", middle);
        break;
    end
end
