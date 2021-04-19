function [x, f_x, n, e] = CalcRaizSecante(f, x_0, x_1, c)
%CalcRaizSecante - Calcula la raíz de una función f mediante el método
%   de la secante, hasta que se cumpla la condición c
%
% Syntax: [x, f_x, n, e] = CalcRaizSecante(f, x_0, x_1, c)
%
% Cuidado! No comprueba la convergencia antes de empezar a iterar. Debe
%   comprobarse manualmente antes, o limitarse mediante c utilizando opt.n.
%
% Input:
%   f: función a evaluar (puede ser inline o anonymous)
%   x_0: valor de x en la iteración 0
%   x_1: valor de x en la iteración 1
%   c: función anónima que contiene la condición. Se le pasará un struct
%       llamado opt con los siguientes parámetros:
%           opt.x: valor de x en la iteración actual
%           opt.x_a: valor de x en la iteración n-1
%           opt.x_aa: valor de x en la iteración n-2
%           opt.f_aa: f evaluada en x_(n-2)
%           opt.f_a: f evaluada en x_(n-1)
%           opt.f_x: f(x)
%           opt.n: índice de la iteración actual (comienza en 1)
%
% Output:
%   x: raíz encontrada
%   f_x: f(x)
%   n: número de iteraciones realizadas
%   e: error absoluto entre los valores de x de la iteración final y la
%       anterior

    opt.x_aa = x_0;
    opt.x_a = x_1;
    opt.f_aa = f(x_0);
    opt.f_a = f(x_1);
    opt.n = 2;

    while 1
        if opt.n ~= 2
            opt.x_aa = opt.x_a;
            opt.f_aa = opt.f_a;
            opt.x_a = opt.x;
            opt.f_a = opt.f_x;
        end

        opt.x = opt.x_a - ...
            ((opt.x_a - opt.x_aa) / (opt.f_a - opt.f_aa) * (opt.f_a));
        opt.f_x = f(opt.x);

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