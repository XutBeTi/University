clear;
clc;

grid on;
hold on;

a = input('Nhap gia tri cho bien a: ');
b = input('Nhap gia tri cho bien b: ');
c = input('Nhap gia tri cho bien c: ');
 
delta=b*b-4*a*c;
 
if (delta<0)
    
    disp('Phuong trinh vo nghiem');
    x1=-b/(2*a);
     
    x = x1-3:0.01:x1+3;
    
elseif (delta==0)
    x1=-b/(2*a);
    disp (['phuong trinh co 1 nghiem kep x= ', num2str(x1)]);
    x= x1-3:0.01:x1+3;
     
    plot ( [x1],[0], 'ro' , 'markersize' , 8, 'markerfacecolor', 'r' );
      
else
    x1=(-b-sqrt(delta))/(2*a);
    x2=(-b+sqrt(delta))/(2*a);
    disp (['phuong trinh co 2 nghiem x1= ', num2str(x1),' va x2= ', num2str(x2)]);
     
    x= x1-3:0.01:x2+3;
    
    plot ( [x1 x2],[0 0], 'ro' , 'markersize' , 8, 'markerfacecolor', 'r' );
        
end
 
 hold on;
 
 y = a*x.^2 + b*x + c;   
 plot(x, y, 'b-', 'LineWidth', 2);
 
   
  
 hold on;
 
 y=x.*0;
 
 plot( x  , y , 'k-', 'LineWidth', 2);
 
