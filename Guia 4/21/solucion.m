% Solución:
%   1) x = -1.8163, y = 0.8374 (3 iteraciones)
%   2) x = -0.8920, y = 3.0797 (49 iteraciones)
%   3) x = -1.8229, y = -0.8229 (3 iteraciones)

% Limito hasta 100 iteraciones
c = @(opt) norm(opt.X - opt.X_a) < 1e-3 || opt.n == 100;

[X1, n1] = SistNewtonRaphson(@F1, @J1, [-2; 1], c);
[X2, n2] = SistNewtonRaphson(@F2, @J2, [0; 1], c);
[X3, n3] = SistNewtonRaphson(@F3, @J3, [-1.5; -1], c);

fprintf('%d) x = %5.4f, y = %5.4f (%d iteraciones)\n', 1, X1(1), X1(2), n1);
fprintf('%d) x = %5.4f, y = %5.4f (%d iteraciones)\n', 2, X2(1), X2(2), n2);
fprintf('%d) x = %5.4f, y = %5.4f (%d iteraciones)\n', 3, X3(1), X3(2), n3);


function F = F1(X)
    F = zeros(2, 1);
    F(1) = X(1)^2 + X(2)^2 - 4;
    F(2) = exp(X(1)) + X(2) - 1;
end

function J = J1(X)
    J = zeros(2, 2);
    J(1, 1) = 2*X(1);
    J(1, 2) = 2*X(2);
    J(2, 1) = exp(X(1));
    J(2, 2) = 1;
end

function F = F2(X)
    F = zeros(2, 1);
    F(1) = X(1)^2 - 2*X(1) - X(2) + 0.5;
    F(2) = X(1)^2 + 4*X(1)^2 - 4;
end

function J = J2(X)
    J = zeros(2, 2);
    J(1, 1) = 2*X(1) - 2;
    J(1, 2) = -1;
    J(2, 1) = 2*X(1);
    J(2, 2) = 8*X(2);
end

function F = F3(X)
    F = zeros(2, 1);
    F(1) = X(1) - X(2) + 1;
    F(2) = X(1)^2 + X(2)^2 - 4;
end

function J = J3(X)
    J = zeros(2, 2);
    J(1, 1) = 1;
    J(1, 2) = -1;
    J(2, 1) = 2*X(1);
    J(2, 2) = 2*X(2);
end