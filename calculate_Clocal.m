function [C_local, normal, ind] = calculate_Clocal(h)
%构造对于内部点的相应C矩阵,h为六边形网格的边长
% A = [(h^2) / 4, 3 * (h^2) / 4, -sqrt(3) * (h^2) / 4, -h / 2, sqrt(3) * h / 2, 1;...
%      (h^2) / 4, 3 * (h^2) / 4, sqrt(3) * (h^2) / 4, h / 2, sqrt(3) * h / 2, 1;...
%      (h^2), 0, 0, -h, 0, 1;...
%      0, 0, 0, 0, 0, 1;...
%      (h^2), 0, 0, h, 0, 1;...
%      (h^2) / 4, 3 * (h^2) / 4, sqrt(3) * (h^2) / 4, -h / 2, -sqrt(3) * h / 2, 1;...
%      (h^2) / 4, 3 * (h^2) / 4, -sqrt(3) * (h^2) / 4, h / 2, -sqrt(3) * h / 2, 1];
%B = linsolve((A' * A), A');
%B = (A'* A) \ (A');
%B = inv(A' * A) * (A');
B = ...
[                0,               0,      1/h^2, -2/h^2,      1/h^2,               0,                0;...
        2/(3*h^2),       2/(3*h^2), -1/(3*h^2), -2/h^2, -1/(3*h^2),       2/(3*h^2),        2/(3*h^2);...
 -3^(1/2)/(3*h^2), 3^(1/2)/(3*h^2),          0,      0,          0, 3^(1/2)/(3*h^2), -3^(1/2)/(3*h^2);...
         -1/(6*h),         1/(6*h),   -1/(3*h),      0,    1/(3*h),        -1/(6*h),          1/(6*h);...
    3^(1/2)/(6*h),   3^(1/2)/(6*h),          0,      0,          0,  -3^(1/2)/(6*h),   -3^(1/2)/(6*h);...
                0,               0,          0,      1,          0,               0,                0];
 
C_local = [B(1,:); B(2,:); B(3,:); B(3,:)];
normal = [B(4,:),B(5,:)];
ind = B(6,:);
end

