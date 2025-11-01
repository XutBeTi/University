clc;
clear;
close all;


% Thiết lập hệ phương trình [G] * [V] = [I]:
% Ẩn là: V = [V1; V2; V3; V4]

% Phương trình (1) tại Nút V1: V1(1/4 + 1/8) - V2(1/8) = 10
G11 = 1/4 + 1/8;
G12 = -1/8;
G13 = 0;
G14 = 0;
I1 = 10;

% Phương trình (2) tại Nút V2 (sau khi thay Vx = V4 - V3):
% V1/8 - V2(1/8 + 1/2 + 1/10) + 2*V3 - 1.5*V4 = 0
G21 = 1/8;
G22 = -(1/8 + 1/2 + 1/10);
G23 = 2;
G24 = -1.5;
I2 = 0;

% Phương trình (6) KCL cho Supernode V3-V4 (Sau khi thay Ix):
% V2(0.2) + V3(0.3) - V4(0.5) = -6
G31 = 0;
G32 = 0.2;
G33 = 0.3;
G34 = -0.5;
I3 = -6;

% Phương trình (7) Hạn chế Supernode V3-V4: V3 - V4 = 20
G41 = 0;
G42 = 0;
G43 = 1;
G44 = -1;
I4 = 20;

% Xây dựng ma trận dẫn nạp G và vector nguồn dòng I
G = [G11, G12, G13, G14;
     G21, G22, G23, G24;
     G31, G32, G33, G34;
     G41, G42, G43, G44];

I = [I1; I2; I3; I4];

% =========================================================================
% BƯỚC 2: GIẢI HỆ PHƯƠNG TRÌNH
% =========================================================================
V = G \ I; % Giải ma trận V = G^-1 * I

% Gán kết quả cho các biến nút
V1 = V(1);
V2 = V(2);
V3 = V(3);
V4 = V(4);

fprintf('====================================================\n');
fprintf('KẾT QUẢ ĐIỆN ÁP NÚT\n');
fprintf('----------------------------------------------------\n');
fprintf('V1 = %.4f V\n', V1);
fprintf('V2 = %.4f V\n', V2);
fprintf('V3 = %.4f V\n', V3);
fprintf('V4 = %.4f V\n', V4);
fprintf('====================================================\n\n');


% =========================================================================
% BƯỚC 3: TÍNH TOÁN CÁC THAM SỐ PHỤ
% =========================================================================

% Tính Vx và Ix
Vx = V4 - V3;
Ix = (V3 - V2) / 10; % Dòng Ix chảy từ V3 sang V2

% Kiểm tra Vx: V3 - V4 (Hạn chế nguồn 20V: V3-V4=20, nên Vx phải là -20V)
% V3 là cực dương, V4 là cực âm của Vx. Trong hình V4 là dương (+), V3 là âm (-) của Vx
% => Vx = V4 - V3

fprintf('Tham số phụ:\n');
fprintf('Vx = V4 - V3 = %.4f V\n', Vx);
fprintf('Ix = (V3 - V2) / 10 = %.4f A\n', Ix);
fprintf('----------------------------------------------------\n');

% =========================================================================
% BƯỚC 4: TÍNH CÔNG SUẤT PHÁT CỦA CÁC NGUỒN (POWER SUPPLIED)
% Ghi chú: Công suất Phát (Ps) < 0 nếu Ps > 0 (Dấu trừ công suất)
% Hoặc Công suất Phát (Ps) = V*I (dòng ra khỏi cực dương)
% =========================================================================

% 1. Nguồn dòng độc lập 10 A (Gắn giữa V1 và đất)
% Dòng 10A đi ra khỏi cực dương (V1)
P_10A = V1 * 10; % Ps > 0 => Phát

% 2. Nguồn dòng độc lập 6 A (Gắn giữa V3 và đất)
% Dòng 6A đi vào cực dương (V3)
P_6A = -V3 * 6; % Ps > 0 => Phát

% 3. Nguồn áp độc lập 20 V (Gắn giữa V4(-) và V3(+))
% Cần tìm dòng I_20V đi ra khỏi cực dương (V3)
% Từ phương trình (3) tại V3 (KCL): (V2 - V3)/10 + (V4 - V3)/5 + 6 - I_20V = 0
% I_20V = (V2 - V3)/10 + (V4 - V3)/5 + 6
I_20V = (V2 - V3)/10 + (V4 - V3)/5 + 6;
P_20V = V3 * I_20V; % Ps > 0 => Phát

% 4. Nguồn dòng phụ thuộc 4 Ix (Gắn giữa V4 và đất)
% Dòng 4Ix đi ra khỏi cực dương (V4)
P_4Ix = V4 * (4 * Ix); % Ps > 0 => Phát

% 5. Nguồn áp phụ thuộc 2 Vx (Gắn giữa V2 và đất)
% Cần tìm dòng I_2Vx đi ra khỏi cực dương (V2)
% Từ phương trình (2) tại V2 (trước khi thay Vx):
% (V1 - V2)/8 + (V4 - V2)/2 - V2/10 - I_2Vx = 0
% I_2Vx = (V1 - V2)/8 + (V4 - V2)/2 - V2/10
I_2Vx = (V1 - V2)/8 + (V4 - V2)/2 - V2/10;
P_2Vx = V2 * I_2Vx; % Ps > 0 => Phát

fprintf('CÔNG SUẤT PHÁT CỦA CÁC NGUỒN:\n');
fprintf('----------------------------------------------------\n');
fprintf('1. Nguồn dòng 10 A (P_10A) = %.4f W\n', P_10A);
fprintf('2. Nguồn dòng 6 A (P_6A)   = %.4f W\n', P_6A);
fprintf('3. Nguồn áp 20 V (P_20V)   = %.4f W\n', P_20V);
fprintf('4. Nguồn dòng phụ thuộc 4 Ix (P_4Ix) = %.4f W\n', P_4Ix);
fprintf('5. Nguồn áp phụ thuộc 2 Vx (P_2Vx) = %.4f W\n', P_2Vx);
fprintf('----------------------------------------------------\n');

% TỔNG CÔNG SUẤT PHÁT
P_Source_Total = P_10A + P_6A + P_20V + P_4Ix + P_2Vx;
fprintf('TỔNG CÔNG SUẤT PHÁT = %.4f W\n\n', P_Source_Total);

% =========================================================================
% BƯỚC 5: TÍNH CÔNG SUẤT TIÊU THỤ CỦA CÁC ĐIỆN TRỞ (POWER DISSIPATED)
% P_R = V^2 / R (luôn > 0)
% =========================================================================

P_4ohm = V1^2 / 4;
P_8ohm = (V1 - V2)^2 / 8;
P_2ohm = (V4 - V2)^2 / 2;
P_10ohm = V2^2 / 10; % Do dòng Ix chảy từ V3->V2, nhưng công thức tiêu thụ chỉ cần V^2/R

P_R_Total = P_4ohm + P_8ohm + P_2ohm + P_10ohm;

fprintf('CÔNG SUẤT TIÊU THỤ CỦA CÁC ĐIỆN TRỞ:\n');
fprintf('----------------------------------------------------\n');
fprintf('P_4ohm  = %.4f W\n', P_4ohm);
fprintf('P_8ohm  = %.4f W\n', P_8ohm);
fprintf('P_2ohm  = %.4f W\n', P_2ohm);
fprintf('P_10ohm = %.4f W\n', P_10ohm);
fprintf('----------------------------------------------------\n');
fprintf('TỔNG CÔNG SUẤT TIÊU THỤ = %.4f W\n\n', P_R_Total);


% =========================================================================
% BƯỚC 6: KIỂM TRA ĐỊNH LUẬT BẢO TOÀN CÔNG SUẤT
% =========================================================================

P_Check = P_Source_Total - P_R_Total;

fprintf('====================================================\n');
fprintf('KIỂM TRA ĐỊNH LUẬT BẢO TOÀN CÔNG SUẤT (P_phat - P_tieu_thu)\n');
fprintf('Sai số = %.4e W\n', P_Check);

if abs(P_Check) < 1e-6
    fprintf('ĐỊNH LUẬT BẢO TOÀN CÔNG SUẤT ĐƯỢC THỎA MÃN (Sai số nhỏ).\n');
else
    fprintf('CÓ SAI SỐ LỚN. CẦN KIỂM TRA LẠI CÁC PHƯƠNG TRÌNH NÚT.\n');
end
fprintf('====================================================\n');

