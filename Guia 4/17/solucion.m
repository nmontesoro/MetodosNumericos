% Solución:
% 1)
% Jacobi (18 iteraciones):
%    -0.1411
%     1.5623
%    -1.0937
%     0.3021
% 
% Gauss-Seidel (11 iteraciones):
%    -0.1411
%     1.5623
%    -1.0937
%     0.3021
% --------------------------------------------------------------------------------
% 3) Gauss-Seidel (20 iteraciones):
%     1.9352
%     1.3258
%    10.5499
%     5.4804
% --------------------------------------------------------------------------------

% 1 - Converge por Jacobi y Gauss-Seidel

A = [  0.5, 0.25,    0,    0;
       0.3,  0.8,  0.4,    0;
         0,  0.2,    1,  0.6;
         0,    0,    1,   -3];

b = [ 0.32;
      0.77;
      -0.6;
      -2.0];

c = @(opt) norm(opt.X - opt.X_a) <= 1e-5 || opt.n == 100;

[X, n] = SistJacobi(A, [0; 0; 0], b, c);

fprintf('1)\nJacobi (%d iteraciones):\n', n)
disp([X]);

[X, n] = SistGaussSeidel(A, [0; 0; 0; 0], b, c);

fprintf('Gauss-Seidel (%d iteraciones):\n', n)
disp([X]);
fprintf('--------------------------------------------------------------------------------\n');

% 3 - Converge por Gauss-Seidel
A = [   6.532,       7,       0,      -4;
       -4.102,       6,       0,     1.2;
           -1, -5.7012,  1.2222,       0;
        2.156,   4.102, -2.3217,       6];

b = [      0;
      6.5931;
         3.4;
          18];

[X, n] = SistGaussSeidel(A, [0; 0; 0; 0], b, c);

fprintf('3) Gauss-Seidel (%d iteraciones):\n', n)
disp([X]);
fprintf('--------------------------------------------------------------------------------\n');