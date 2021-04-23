% Solución:
%   Jacobi:
%   	1) 2.2500 4.0000 3.7500
%   	2) 0.3125 1.9375 1.1875
%   	3) 1.4688 3.5469 2.7031
%   	4) 0.6875 2.5898 1.6094
%   	5) 1.2002 3.2539 2.2832
%   Gauss-Seidel:
%   	1) 2.2500 2.8750 1.7500
%   	2) 1.0938 3.0156 1.9688
%   	3) 1.0039 3.0059 1.9961
%   	4) 0.9995 3.0012 1.9995
%   	5) 0.9998 3.0002 1.9999

A = [ 4, 1, 1;
      2, 4, 1;
      1, 2, 4];

b = [  9;
      16;
      15];

fprintf('Jacobi:\n')
for i = 1:5
    c = @(opt) opt.n == i;
    X = SistJacobi(A, [0;0;0], b, c);
    fprintf('\t%d) %5.4f %5.4f %5.4f\n', i, X(1), X(2), X(3));
end

fprintf('Gauss-Seidel:\n')
for i = 1:5
    c = @(opt) opt.n == i;
    X = SistGaussSeidel(A, [0;0;0], b, c);
    fprintf('\t%d) %5.4f %5.4f %5.4f\n', i, X(1), X(2), X(3));
end