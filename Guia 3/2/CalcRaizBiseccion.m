function [x, f_x, n, e] = CalcRaizBiseccion(f, a, b, c)
%CalcRaizBiseccion - Calcula una raíz de la función f en el intervalo
%   [a,b] especificado, con tolerancia c, mediante el método de
%   bisección.
%
% Syntax: [x, n, e] = CalcRaizBiseccion(f, a, b, c)
%
% Input:
%   f: string de función a evaluar
%   a: inicio del intervalo
%   b: cierre del intervalo
%   c: cota para el error ( |b-a| / 2 )
% Output:
%   x: raíz calculada
% f_x: valor de la función en ese punto
%   n: número de iteraciones utilizadas
%   e: cota de error en el n-ésimo término

    f = inline(f, 'x');
    f_x = 0;
    x = 0;
    n = 0;
    e = abs(b - a) / 2;

    if f(a) * f(b) >= 0
        error('f no cumple la condición de Bolzano en este intervalo');
    end

    while e > c
        n = n + 1;
        x = (a + b) / 2;
        f_x = f(x);
        e = abs(b - a) / 2;

        if f_x > 0
            b = x;
        else
            a = x;
        end
    end
    
end