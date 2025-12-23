clc
clear
close

%% Khai báo biến
syms V1 V2 V4;

Ix = ((20 - V2) / 10);
Vx = (V4 - 20);

%% Tính toán
eq1 = V1/4 + (V1-V2)/8 + (V4-20)/5 + (V4-V2)/2 == 10; 
eq2 = 2*(V4 - 20) + (V1-V2)/8 + (20-V2)/10 + (V4-V2)/2 == 0;
eq3 = V1 - V4 == 4*((20 - V2) / 10);

sol = solve([eq1, eq2, eq3], [V1 V2 V4]);

V1 = double(sol.V1);
V2 = double(sol.V2);
V4 = double(sol.V4);
Ix = (20 - V2) / 10;
Vx = V4 - 20;

I1 = (20-V4)/5 + (V2-V4)/5;
I2 = (V2 - V1)/8 - V1/4 + 10;

%% Tính công suất các trở
P_R4 = (V1)^2 / 4;
P_R8 = (V1-V2)^2 / 8;
P_R2 = (V4-V2)^2 / 2;
P_R10 = (20-V2)^2 / 10;
P_R5 = (V4-20)^2 / 5;
Pt = P_R4 + P_R8 + P_R2 + P_R10 + P_R5;
fprintf('Cong suat cua R4 = %.2f V\n', P_R4);
fprintf('Cong suat cua R8 = %.2f V\n', P_R8);
fprintf('Cong suat cua R2 = %.2f V\n', P_R2);
fprintf('Cong suat cua R10  = %.2f V\n', P_R10 );
fprintf('Cong suat cua R5 = %.2f V\n', P_R5);
fprintf('Tong cong suat cac tro = %.2f V\n', Pt);

%% Tính công suất các nguồn
P_10A = 10*V1;
P_6A = 6*20;
P_20A = 20 * (((20 - V2)/10 + (20 - V4)/5) - 6);
P_2Vx = 2*Vx*V2;
P_4Ix = 4*Ix * (3*V1/8 - V2/8 - 10);
Pp = P_10A + P_6A + P_20A + P_2Vx + P_4Ix;

fprintf('Cong suat cua nguon 10A = %.2f V\n', P_10A);
fprintf('Cong suat cua nguon 6A = %.2f V\n', P_6A);
fprintf('Cong suat cua nguon 20A = %.2f V\n', P_20A);
fprintf('Cong suat cua nguon 2Vx = %.2f V\n', P_2Vx);
fprintf('Cong suat cua nguon 4Ix = %.2f V\n', P_4Ix);

fprintf('Tong cong suat cac tro = %.2f V\n', Pp);

%% So sánh
if abs(Pt-Pp) < 1e-3
    fprintf('Cong suat cua mach duoc bao toan\n');
else
    fprintf('Cong suat cua mach khong bao toan\n');
end

