clc; clear all;
syms x;
f(x) = x * exp(x) - 1;
%% ��������
x0 = 0.4;
x1 = 0.6;
epsilon = 5e-6; %�涨��������
episode = 1000; %�涨����������

for i = 1:episode
    %% ���߷�����
    x2 = x1 - f(x1)/(f(x1) - f(x0)) * (x1 - x0);
    if abs(x2 - x1) < epsilon
        fprintf("�÷��̵Ľ��ƽ�Ϊ%d \n", double(x2));
        break;
    end
    x0 = x1;
    x1 = x2;
    %% �޷������ж�
    if i == episode
        print("�÷����ڹ涨������������Χ���޷�����.");
    end
end