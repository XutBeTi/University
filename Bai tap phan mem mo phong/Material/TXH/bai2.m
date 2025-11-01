clear;
clc;
close all;

% Nhập vận tốc ban đầu (m/s)
v0 = input('Nhap van toc ban dau (m/s): '); 

% Độ cao ban đầu (m)
y0 = 10; 
alpha_rad = deg2rad(45);

% Gia tốc trọng trường (m/s^2)
g = 9.8; 

% Tính toán thời gian vật chạm đất (y = 0).
% Chọn chiều dương hướng xuống
% Giải phương trình bậc 2 theo t: (1/2)gt^2 - (v0*sin(alpha))*t - y0 = 0
% a = 0.5*g; b = -v0*sin(alpha_rad); c = -y0;

delta = (-v0*sin(alpha_rad))^2 - 4 * (0.5*g) * (-y0);

% Thời gian chạm đất (nghiệm dương phương trình bậc 2) 
t_max = (-(-v0*sin(alpha_rad)) + sqrt(delta)) / (2 * (0.5*g));

% Tạo vector thời gian
t = 0 : 0.01 : t_max; % Vector thời gian từ 0 đến khi chạm đất

% Vị trí theo trục ngang
x = v0 * cos(alpha_rad) * t;

% Vị trí theo trục dọc
y = y0 + v0 * sin(alpha_rad) * t - 0.5 * g * t.^2;

plot(x, y, 'k-', 'LineWidth', 2); % Vẽ quỹ đạo bằng nét liền màu đen
hold on;
grid on;

% Đánh dấu điểm bắt đầu (10m)
plot(0, y0, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r'); 
text( 0 , y0 -1, 'Diem nem (10m)', 'HorizontalAlignment', 'left');

% Đánh dấu điểm chạm đất
plot(x(end), 0 , 'rx', 'MarkerSize', 10, 'LineWidth', 2);
text(x(end), 0.5 , 'Cham dat', 'HorizontalAlignment', 'left');

plot(x(end)*1.1, 0 , 'wx', 'MarkerSize', 1);

% Vẽ trục hoành y=0 (mặt đất)
plot([min(x) x(end)], [0 0], 'k--', 'LineWidth', 1);

% Thiết lập nhãn và tiêu đề
xlabel('Khoang cach ngang (m)');
ylabel('Do cao (m)');
title(['Quy dao vat nem xien (v0 = ', num2str(v0), ' m/s, goc = ', num2str(45), ' do)']);
axis equal tight; % Đảm bảo tỷ lệ trục hợp lý và vừa khít dữ liệu