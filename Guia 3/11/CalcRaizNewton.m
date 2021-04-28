function [x, f_x, n, e] = CalcRaizNewton(f, g, x_0, c, m)
%CalcRaizNewton - Calcula la raíz de una función f mediante el método
%   de Newton-Raphson, hasta que se cumpla la condición c
%
% Syntax: [x, f_x, n, e] = CalcRaizNewton(f, g, x_0, c, m)
%
% Cuidado! No comprueba la convergencia antes de empezar a iterar. Debe
%   comprobarse manualmente antes, o limitarse mediante c utilizando opt.n.
%
% Input:
%   f: función a evaluar (puede ser inline o anonymous)
%   g: derivada de la función f
%   x_0: valor inicial
%   c: función anónima que contiene la condición. Se le pasará un struct
%       llamado opt con los siguientes parámetros:
%           opt.x: valor de x en la iteración actual
%           opt.x_a: valor de x en la iteración anterior
%           opt.f_x: f(x)
%           opt.g_x: g(x)
%           opt.n: índice de la iteración actual (comienza en 1)
%   m: (opcional) multiplicidad de la raíz a calcular, para utilizar la fórmula
%       acelerada para raíces múltiples
%
% Output:
%   x: raíz encontrada
%   f_x: f(x)
%   n: número de iteraciones realizadas
%   e: error absoluto entre los valores de x de la iteración final y la
%       anterior

    opt.x_a = NaN;
    opt.x = x_0;
    opt.f_x = f(x_0);
    opt.g_x = g(x_0);
    opt.n = 0;

    if ~exist('m', 'var')
        m = 0;
    end

    while ~c(opt)
        opt.x_a = opt.x;

        if m
            opt.x = opt.x_a - m * opt.f_x / opt.g_x;
        else
            opt.x = opt.x_a - opt.f_x / opt.g_x;
        end

        opt.f_x = f(opt.x);
        opt.g_x = g(opt.x);

        opt.n = opt.n + 1;
    end
    
    x = opt.x;
    f_x = opt.f_x;
    n = opt.n;
    e = abs(x - opt.x_a);
end