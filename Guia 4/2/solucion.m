% Solución:
% x =
%     0.6667
%     5.0000
%    -4.0000
% R =
%    1.0e-14 *
%          0
%          0
%    -0.3553

format compact

A = [9, 2, 3;
     3, 4, 5;
     6, 7, 8];

b = [4; 2; 7];

x = A \ b

R = A * x - b

format