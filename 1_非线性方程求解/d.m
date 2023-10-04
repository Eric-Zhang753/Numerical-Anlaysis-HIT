clc; clear all;
syms x;
f(x) = (x - 1)^2 * (2*x - 1);
f_diff(x) = diff(f(x));
x = 0.55;
%% ��������
epsilon = 5e-6; %�涨��������
episode = 10000; %�涨����������

for i = 1:episode
    %% �Ľ�ţ�ٵ���
    x_ = x - 2 * f(x)/f_diff(x);
    fprintf("��ǰΪ��%d�ֵ�������ǰxΪ%f \n", i, x_);
    if abs(x - x_) < epsilon
        fprintf("�÷��̵Ľ��ƽ�Ϊ%d \n", double(x));
        break;
    end
    x = double(x_);
    %% �޷������ж�
    if i == episode
        fprintf("�÷����ڹ涨������������Χ���޷�����.");
    end
end
