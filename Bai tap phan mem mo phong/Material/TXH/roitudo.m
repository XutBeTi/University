clear;
clc;



v0=  input ('nhap van toc ban dau la: ');

vx=v0/sqrt(2);
vy=v0/sqrt(2);

h0=10;

hmax=vy^2/20+10;

t1=vy/10;
disp (t1);

x_hmax=vx*t1;

b=x_hmax*2;

vymax=sqrt (2*10*hmax);

t2=vymax/10;

xmax=vx*(t1+t2);

x=0:0.01:xmax;

y=-x.^2+b*x+h0;
 
grid on;
hold on;
plot (x,y);


