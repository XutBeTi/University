clc
clear
close

alpha = 45;
h = 10;
v0 = input('Nhap van toc ban dau v0 = ');
g = 9.8;

goc = deg2rad(alpha);
t_bay = (v0*sin(goc) + sqrt((v0*sin(goc))^2 + 2*g*h)) / g;
t = linspace(0, t_bay, 200);
x = v0*cos(goc)*t;
y = h + v0*sin(goc)*t - 0.5*g*t.^2;

plot(x, y, 'b', 'LineWidth', 1.5);
xlabel('Khoang cach bay (m)');
ylabel('Do cao (m)');
title('Quy dao nem xien');
hold on;
plot(0, h, 'ro', 'MarkerFaceColor', 'r');
hold off;