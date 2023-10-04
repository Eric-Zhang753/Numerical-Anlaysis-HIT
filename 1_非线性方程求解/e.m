clc; clear all;
syms x y z;
F(x, y, z) = [x*y - z^2 - 1; x*y*z + y^2 - x^2 - 2; exp(x) + z - exp(y) - 3];
X0 = [0.9; 0.9; 0.95];
X1 = [1.; 1.; 1.];
%% ��������
epsilon = 5e-8; %�涨��������
episode = 1000; %�涨����������

for i = 1:episode
    %% ��ţ�ٵ���
    
    X2 = X1 - (X1 - X0) ./ (F(X1(1), X1(2), X1(3)) - F(X0(1), X0(2), X0(3))) .* F(X1(1), X1(2), X1(3));
    X0 = double(X1);
    X1 = double(X2);
%     fprintf("��ǰΪ��%d�ֵ�������ǰxΪ%f \n", i, X1);
    if norm(X1 - X0) < epsilon
        fprintf("�÷��̵Ľ��ƽ�Ϊ%d \n", double(X1));
        break;
    end
%     x = double(x_);
    %% �޷������ж�
    if i == episode
        fprintf("�÷����ڹ涨������������Χ���޷�����.");
    end
end
