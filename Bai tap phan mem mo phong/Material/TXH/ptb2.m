clear;
clc;

a = input('Nhap gia tri cho bien a: ');
b = input('Nhap gia tri cho bien b: ');
c = input('Nhap gia tri cho bien c: ');

if a == 0
    if b == 0
        if c == 0
            disp('Phuong trinh vo so nghiem (0 = 0)');
            x = c - 5 : 0.01 : c + 5;
        else
            disp('Phuong trinh vo nghiem ( Const != 0)');
            x = c - 5 : 0.01 : c + 5;
        end

    else
        % Phuong trinh bac nhat: bx + c = 0
        x = -c/b;
        disp(['Phuong trinh co 1 nghiem x = ', num2str(x)]);

        plot ( [x],[0], 'ro' , 'markersize' , 8, 'markerfacecolor', 'r' );

        x = x - 5 : 0.01 : x + 5;
        
       
    end
else 

    delta=b*b-4*a*c;
     
    if (delta<0)
        
        disp('Phuong trinh vo nghiem');
        x1=-b/(2*a);
        x = x1-3:0.01:x1+3;
        
    elseif (delta==0)
        x1=-b/(2*a);
        disp (['Phuong trinh co 1 nghiem kep x= ', num2str(x1)]);
        x= x1-3:0.01:x1+3;
        plot ( [x1],[0], 'ro' , 'markersize' , 8, 'markerfacecolor', 'r' );
        hold on;
        plot ( [x1],[-(a*5)], 'wo' , 'markersize' , 1, 'markerfacecolor', 'w' );
          
    else
        x1=(-b-sqrt(delta))/(2*a);
        x2=(-b+sqrt(delta))/(2*a);
        disp (['Phuong trinh co 2 nghiem x1= ', num2str(x1),' va x2= ', num2str(x2)]);

        if (x1>x2)
            temp=x2;
            x2=x1;
            x1=temp;
        end 

        space=x2-x1;
        x= x1-space*0.3 : 0.01 : x2+space*0.3;
        plot ( [x1 x2],[0 0], 'ro' , 'markersize' , 8, 'markerfacecolor', 'r' );
            
    end
     
end

hold on;   

grid on;

hold on; 

y = a*x.^2 + b*x + c;   
plot(x, y, 'k-', 'LineWidth', 2);

hold on;

y=x.*0;
plot( x  , y , 'k--', 'LineWidth', 1);

hold on;
    