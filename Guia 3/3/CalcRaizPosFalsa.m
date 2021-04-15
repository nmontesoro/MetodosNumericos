function [x, f_x, n, e] = CalcRaizPosFalsa(f, a, b, c)
%CalcRaizPosFalsa - Calcula una raíz de la función f en el intervalo
%   [a,b] especificado, con n iteraciones, mediante el método de
%   posición falsa/regula falsi/interpolación lineal inversa.
%
% Syntax: [x, f_x, n, e] = CalcRaizPosFalsa(f, a, b, c)
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
    x = 0;
    n = 0;
    f_x = 0;
    e = abs(b - a) / 2;

    if f(a) * f(b) >= 0
        error('f no cumple la condición de Bolzano en este intervalo');
    end

    while e > c
        n = n + 1;
        e = abs(b - a) / 2;
        f_a = f(a);
        f_b = f(b);
        x = (a*f_b - b*f_a)/(f_b - f_a);
        f_x = f(x);

        if f_x > 0
            b = x;
        else
            a = x;
        end
    end
end