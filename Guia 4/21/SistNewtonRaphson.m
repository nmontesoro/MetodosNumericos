function [X, n] = SistNewtonRaphson(F, J, X0, c)
%SistNewtonRaphson - Resuelve un sistema de ecuaciones no lineal mediante el
%   método de iteración de Newton-Raphson, hasta que se cumpla una condición
%   c. *No comprueba convergencia antes de iterar!*
%
% Syntax: [X, n] = SistNewtonRaphson(F, J, X0, c)
%
% Input:
%   F: vector columna de forma [f1; f2, ...; fn]. Ver documentación 
%       adicional.
%   J: matriz del Jacobiano. Ver documentación adicional.
%   X0: vector columna del punto inicial desde donde comenzar a iterar.
%   c: función anónima que contiene la condición. Se le pasará un struct
%       llamado opt con los siguientes parámetros:
%           opt.X: matriz X en la iteración actual
%           opt.X_a: matrix X en la iteración anterior
%           opt.n: índice de la iteración actual (comienza en 1)
%
% Output:
%   X: vector columna con la solución del sistema de ecuaciones.
%   n: número de iteraciones hechas hasta cumplir la condición.

    opt.X_a = X0;
    opt.n = 1;

    while 1
        if opt.n ~= 1
            opt.X_a = opt.X;
        end

        opt.X = opt.X_a - inv(J(opt.X_a))*F(opt.X_a);

        if c(opt)
            break;
        end

        opt.n = opt.n + 1;
    end

    X = opt.X;
    n = opt.n;
end