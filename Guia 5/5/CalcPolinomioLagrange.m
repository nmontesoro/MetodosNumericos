function f = CalcPolinomioLagrange(points)
%CalcPolinomioLagrange - Calcula el polinomio interpolante de Lagrange 
% ** REQUIERE SYMBOLIC TOOLBOX **
%
% Uso: 
%   syms f(x)
%   f(x) = CalcPolinomioLagrange(points)
%
% Input:
%   points: matriz con los puntos de interpolación. Formato: 
%       [x0, y0; x1, y1; ...; xn, yn].
%
% Output:
%   f(x): función simbólica del polinomio interpolante de Lagrange.

    n = size(points, 1);
    coef = ones(n, 1);

    syms f(x) t(x)
    f(x) = 0;

    for i = 1:n
        t(x) = 1;

        for k = 1:n
            if i ~= k
                t(x) = t(x) * (x - points(k, 1));
                coef(i) = coef(i) / (points(i, 1) - points(k, 1));
            end
        end

        coef(i) = coef(i) * points(i, 2);
        f(x) = f(x) + t(x) * coef(i);
    end

    f = f(x);
end