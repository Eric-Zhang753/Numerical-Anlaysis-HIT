clc; clear all;
syms x;
%% function1
% f(x) = x * exp(x) - 1;
% f_diff(x) = diff(f(x));
% x = 0.5;
%% function2
% f(x) = x^3 - x - 1;
% f_diff(x) = diff(f(x));
% x = 1;
%% function3
f(x) = (x - 1)^2 * (2*x - 1);
f_diff(x) = diff(f(x));
% x = 0.45;
x = 0.65;
%% ��������
epsilon = 5e-6; %�涨��������
episode = 1000; %�涨����������

for i = 1:episode
    %% ţ�ٵ���
    x_ = x - f(x)/f_diff(x);
    if abs(x - x_) < epsilon
        fprintf("�÷��̵Ľ��ƽ�Ϊ%d \n", double(x));
        break;
    end
    x = x_;
    %% �޷������ж�
    if i == episode
        print("�÷����ڹ涨������������Χ���޷�����.");
    end
end
