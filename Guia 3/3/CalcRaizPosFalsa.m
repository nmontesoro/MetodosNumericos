function [x, f_x] = CalcRaizPosFalsa(f, a, b, n)
%CalcRaizPosFalsa - Calcula una raíz de la función f en el intervalo
%   [a,b] especificado, con n iteraciones, mediante el método de
%   posición falsa/regula falsi/interpolación lineal inversa.
%
% Syntax: [x, f_x] = CalcRaizPosFalsa(f, a, b, n)
%
% Input:
%   f: string de función a evaluar
%   a: inicio del intervalo
%   b: cierre del intervalo
%   n: cantidad de iteraciones a realizar
% Output:
%   x: raíz calculada
% f_x: valor de la función en ese punto

    f = inline(f, 'x');
    x = 0;
    f_x = 0;

    if f(a) * f(b) >= 0
        error('f no cumple la condición de Bolzano en este intervalo');
    end

    for i = 1:n
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