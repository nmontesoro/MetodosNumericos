function [x, f_x, n, e] = CalcRaicesPolinomio(coef, r, c)
%CalcRaicesPolinomio - Calcula las raíces de un polinomio mediante el 
%   método de Newton-Raphson hasta que se cumpla una condición c.
%
% Syntax: [x, f_x, n, e] = CalcRaicesPolinomio(coef, r, c)
%
% Input:
%   coef: vector con los coeficientes del polinomio *completo*
%   r: aproximaciones a las raíces (ver gráfico primero)
%   c: condición a evaluar antes de seguir iterando
% Output:
%   x: vector con las raíces encontradas
%   f_x: vector con el polinomio evaluado en cada raíz encontrada
%   n: vector con número de iteraciones necesarias para cada raíz
%   e: vector con los errores absolutos entre los valores de x de la
%       iteración final y la anterior

    n_r = length(r);
    x = zeros(1, n_r);
    f_x = zeros(1, n_r);
    n = zeros(1, n_r);
    e = zeros(1, n_r);
    ord = length(coef); % Orden del polinomio original
    f = "";
    g = "";

    % Construyo las funciones
    for i = 1:ord
        f = f + " + " + num2str(coef(i)) + "*x^" + num2str(ord - i);
    end
    f = inline(f);

    for i = 1:ord-1
        g = g + " + " + num2str(coef(i) * (ord - i)) + "*x^" + ...
            num2str(ord - i - 1);
    end
    g = inline(g);

    % Hago el llamado a CalcRaizNewton para cada raíz requerida
    for i = 1:length(r)
        [x(i), f_x(i), n(i), e(i)] = CalcRaizNewton(f, g, r(i), c);
    end
end