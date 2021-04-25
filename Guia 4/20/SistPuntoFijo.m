function [X, n] = SistPuntoFijo(G, X0, c)
%SistPuntoFijo - Resuelve un sistema de ecuaciones no lineal mediante el
%   método de iteración de Punto Fijo, hasta que se cumpla una condición
%   c. *No comprueba convergencia antes de iterar!*
%
% Syntax: [X, n] = SistPuntoFijo(G, X0, c)
%
% Input:
%   G: vector columna de forma [g1; g2; ...; gn] de las derivadas de las
%       funciones fi. Ver documentación adicional.
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

        opt.X = G(opt.X_a);

        if c(opt)
            break;
        end

        opt.n = opt.n + 1;
    end

    X = opt.X;
    n = opt.n;
end