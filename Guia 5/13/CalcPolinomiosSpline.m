function pols = CalcPolinomiosSpline(points, varargin)
%CalcPolinomiosSpline - Encuentra los polinomios del spline (trazador 
%   cúbico) según los puntos de interpolación.
%
% Syntax: pols = CalcPolinomiosSpline(points, sujeta, varargin)
%
% Input:
%   points: puntos a interpolar. Formato: [x1, y1; x2, y2; ...; xn, yn]
%   sujeta: opcional. Bool indicando si se utilizan condiciones de 
%       frontera sujeta (default = false).
%   f_0, f_n: necesarios si sujeta == true. Valor de la derivada primera
%       de f en x_0 y x_n.
%   coefs: opcional. Matriz de coeficientes personalizada.
%
% Output:
%   pols: array de funciones simbólicas, cada una con el polinomio

    parser = inputParser;
    validPoints = @(points) size(points, 2) == 2 && size(points, 1) > 1;
    addRequired(parser, 'points', validPoints);
    addParameter(parser, 'sujeta', false);
    addParameter(parser, 'f_0', NaN);
    addParameter(parser, 'f_n', NaN);
    addParameter(parser, 'coefs', NaN);
    parse(parser, points, varargin{:});

    points = parser.Results.points;
    sujeta = parser.Results.sujeta;
    f_0 = parser.Results.f_0;
    f_n = parser.Results.f_n;
    coefs = parser.Results.coefs;

    [n, m] = size(points);

    if m == 2
        points = CalcDistanciasSpline(points);
    end

    if sujeta && any(isnan([f_0, f_n]))
        error('Se requieren los valores de la derivada en x_0 y x_n.');
    end

    if isnan(coefs)
        coefs = CoeficientesSpline(points, sujeta, f_0, f_n);
    end

    pols = sym('p%d', [n - 1, 1]);
    syms x

    for i = 1:n - 1
        xk = points(i, 1);

        p(x) = coefs(i, 1) ...
             + coefs(i, 2) * (x - xk) ...
             + coefs(i, 3) * (x - xk) ^ 2 ...
             + coefs(i, 4) * (x - xk) ^ 3;

        pols(i) = p(x);
    end
end
