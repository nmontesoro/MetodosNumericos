function pols = CalcPolinomiosSpline(points, sujeta, f_0, f_n)
%CalcPolinomiosSpline - Encuentra los polinomios del spline (trazador 
%   cúbico) según los puntos de interpolación.
%
% Syntax: pols = CalcPolinomiosSpline(points, sujeta, f_0, f_n)
%
% Input:
%   points: puntos a interpolar. Formato: [x1, y1; x2, y2; ...; xn, yn]
%   sujeta: opcional. Bool indicando si se utilizan condiciones de 
%       frontera sujeta (default = false).
%   f_0, f_n: necesarios si sujeta == true. Valor de la derivada primera
%       de f en x_0 y x_n.
%
% Output:
%   pols: array de funciones simbólicas, cada una con el polinomio

    [n, m] = size(points);

    if m == 2
        points = CalcDistanciasSpline(points);
    end

    if ~exist('sujeta', 'var')
        sujeta = false;
    end

    if sujeta
        if ~exist('f_0', 'var') || ~exist('f_n', 'var')
            error('Se requieren los valores de la derivada en x_0 y x_n.');
        end
        coef = CoeficientesSpline(points, sujeta, f_0, f_n);
    else
        coef = CoeficientesSpline(points);
    end

    pols = sym('p%d', [n - 1, 1]);
    syms x

    for i = 1:n - 1
        xk = points(i, 1);

        p(x) = coef(i, 1) ...
             + coef(i, 2) * (x - xk) ...
             + coef(i, 3) * (x - xk) ^ 2 ...
             + coef(i, 4) * (x - xk) ^ 3;

        pols(i) = p(x);
    end
end
