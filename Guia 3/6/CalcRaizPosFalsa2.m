function [x, f_x, n, e] = CalcRaizPosFalsa2(f, a, b, c)
%CalcRaizPosFalsa2 - Calcula la raíz de una función f en un
%   intervalo [a,b] hasta que se cumpla cierta condición c.
%
% Syntax: [x, f_x, n, e] = CalcRaizPosFalsa2(f, a, b, c)
%
% Input:
%   f: función a evaluar (puede ser inline o anonymous)
%   a: inicio del intervalo
%   b: fin del intervalo
%   c: función anónima que contiene la condición. Se le pasará un struct
%       llamado opt con los siguientes parámetros:
%           opt.a: inicio del intervalo de la iteración actual
%           opt.b: fin del intervalo de la iteración actual
%           opt.x: valor de x en la iteración actual
%           opt.x_a: valor de x en la iteración anterior
%           opt.f_x: f(x)
%           opt.n: índice de la iteración actual (comienza en 1)
%           opt.f_a: f(a)
%           opt.f_b: f(b)
%
% Output:
%   x: raíz encontrada
%   f_x: f(x)
%   n: número de iteraciones realizadas
%   e: error absoluto entre los valores de x de la iteración final y la
%       anterior
        
        if f(a) * f(b) >= 0
            error('f no cumple la condición de Bolzano en este intervalo');
        end

        opt.a = a;
        opt.b = b;
        opt.f_a = f(opt.a);
        opt.f_b = f(opt.b);
        opt.x = (opt.a*opt.f_b - opt.b*opt.f_a)/(opt.f_b - opt.f_a);
        opt.x_a = 9e10;
        opt.f_x = f(opt.x);
        opt.n = 1;
    
        while 1
            if opt.n ~= 1
                opt.x_a = opt.x;
            end
            
            opt.f_a = f(opt.a);
            opt.f_b = f(opt.b);
            opt.x = (opt.a*opt.f_b - opt.b*opt.f_a)/(opt.f_b - opt.f_a);
            opt.f_x = f(opt.x);

            if c(opt)
                break
            end
    
            if opt.f_x > 0
                opt.b = opt.x;
            else
                opt.a = opt.x;
            end
            opt.n = opt.n + 1;
        end
        
        x = opt.x;
        f_x = opt.f_x;
        n = opt.n - 1;
        e = abs(x - opt.x_a);
    end