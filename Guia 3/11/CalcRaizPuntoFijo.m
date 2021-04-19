function [x, f_x, n, e] = CalcRaizPuntoFijo(f, g, x_0, c)
%CalcRaizPuntoFijo - Calcula la raíz de una función f mediante el método
%   de punto fijo, hasta que se cumpla la condición c
%
% Syntax: [x, f_x, n, e] = CalcRaizPuntoFijo(f, g, x_0, c)
%
% Cuidado! No comprueba la convergencia antes de empezar a iterar. Debe
%   comprobarse manualmente antes, o limitarse mediante c utilizando opt.n.
%
% Input:
%   f: función a evaluar (puede ser inline o anonymous)
%   g: función de iteración de punto fijo (x = g(x))
%   x_0: valor inicial
%   c: función anónima que contiene la condición. Se le pasará un struct
%       llamado opt con los siguientes parámetros:
%           opt.x: valor de x en la iteración actual
%           opt.x_a: valor de x en la iteración anterior
%           opt.f_x: f(x)
%           opt.g_x: g(x)
%           opt.n: índice de la iteración actual (comienza en 1)
%
% Output:
%   x: raíz encontrada
%   f_x: f(x)
%   n: número de iteraciones realizadas
%   e: error absoluto entre los valores de x de la iteración final y la
%       anterior

    opt.x = x_0;
    opt.x_a = 9e10;
    opt.n = 1;

    while 1
        if opt.n ~= 1
            opt.x_a = opt.x;
            opt.x = opt.g_x;
        end

        opt.f_x = f(opt.x);
        opt.g_x = g(opt.x);

        if c(opt)
            break
        end

        opt.n = opt.n + 1;
    end
    
    x = opt.x;
    f_x = opt.f_x;
    n = opt.n;
    e = abs(x - opt.x_a);
end