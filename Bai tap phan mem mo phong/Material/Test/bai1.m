clc
clear
close

a = input('Nhap he so a = ');
b = input('Nhap he so b = ');
c = input('Nhap he so c = ');

if a == 0
    if b == 0
        if c == 0
            disp('Phuong trinh co vo so nghiem');
        else
            disp('Phuong trinh khong co nghiem');
        end
    else
        x = -c / b;
        fprintf('Phuong trinh co 1 nghiem x = %.2f\n', x);
        x_plot = linspace(x-5, x+5, 200);
        y_plot = a*x_plot.^2 + b*x_plot + c;
        plot(x_plot, y_plot, 'b', 'LineWidth', 1.5);
        grid on;
        hold on;
        plot(x, 0, 'ro', 'MarkerFaceColor', 'r');
        xlabel('x');
        ylabel('f(x)');
        title('Do thi ham bac nhat f(x) = bx + c');
        hold off;
    end
    return;
end
delta = b^2 - 4*a*c;
fprintf("Delta = ", delta);
if delta < 0
    disp('Phuong trinh vo nghiem thuc');
elseif delta == 0
    x1 = -b / (2*a);
    fprintf('Phuong trinh co nghiem kep x = %.2f\n', x);
    x_plot = linspace(x1-5, x1+5, 200);
    y_plot = a*x_plot.^2 + b*x_plot + c;
    plot(x_plot, y_plot, 'b', 'LineWidth', 1.5);
    grid on;
    hold on;
    plot(x1, 0, 'ro', 'MarkerFaceColor', 'r');
    xlabel('x');
    ylabel('f(x)');
    title('Do thi ham bac 2 f(x) = ax^2 + bx + c');
    hold off;
elseif delta > 0
    x1 = (-b - delta) / (2*a);
    x2 = (-b + delta) / (2*a);
    disp('Phuong trinh co 2 nghiem: \n');
    fprintf('x1 = %.2f\n', x1);
    fprintf('x2 = %.2f\n', x2);
    if x1 > x2
        xmin = x2;
        xmax = x1;
    else
        xmin = x1;
        xmax = x2;
    end
    x_plot = linspace(xmin-5, xmax+5, 200);
    y_plot = a*x_plot.^2 + b*x_plot + c;
    plot(x_plot, y_plot, 'b', 'LineWidth', 1.5);
    grid on;
    hold on;
    plot(x1, 0, 'ro', 'MarkerFaceColor', 'r');
    plot(x2, 0, 'ro', 'MarkerFaceColor', 'r');
    hold off;
end

