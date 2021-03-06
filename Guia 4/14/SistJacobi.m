function [X, n] = SistJacobi(A, X, b, c)
%SistJacobi - Calcula las soluciones de un sistema de ecuaciones
%   mediante el método Jacobi, hasta que se cumpla una condición c.
%
% Syntax: [X, n] = SistJacobi(A, X, b, c)
%
% Input:
%   A: matriz de coeficientes
%   X: matriz columna de x iniciales
%   b: matriz columna con términos independientes
%   c: función anónima que contiene la condición. Se le pasará un struct
%       llamado opt con los siguientes parámetros:
%           opt.X: matriz X en la iteración actual
%           opt.X_a: matrix X en la iteración anterior
%           opt.B: matriz B
%           opt.c: matriz c
%           opt.n: índice de la iteración actual (comienza en 1)
%
% Output:
%   X: matriz columna con las soluciones del sistema
%   n: número de iteraciones requeridas
    
    size_A = size(A);
    size_X = size(X);

    if size_A(1) ~= size_A(2)
        error('La matriz A no es cuadrada - el sistema no tiene solución')
    end

    if size_X(2) ~= 1
        error('X no es un vector columna')
    end

    if size_X(1) ~= size_A(1)
        error('El tamaño de X no coincide con el de A')
    end
    
    opt.B = CalcMatrizBJacobi(A);
    opt.c = CalcMatrizCJacobi(A, b);
    opt.X_a = X;
    opt.n = 1;

    if ~ConvergeJacobi(opt.B)
        error('El sistema diverge - cambiar filas A?');
    end

    while 1
        if opt.n ~= 1
            opt.X_a = opt.X;
        end

        opt.X = opt.B * opt.X_a + opt.c;

        if c(opt)
            break;
        end

        opt.n = opt.n + 1;
    end
    
    X = opt.X;
    n = opt.n;
end