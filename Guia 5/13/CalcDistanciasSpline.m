function results = CalcDistanciasSpline(points)
%CalcDistanciasSpline - Calcula las distancias h de los puntos a 
%   interpolar.
%
% Syntax: results = CalcDistanciasSpline(points)
%
% Input:
%   points: puntos a interpolar. Formato: [x1, y1; x2, y2; ...; xn, yn]
%
% Output:
%   results: puntos originales, con una columna agregada para los h.

    n = size(points, 1);
    results = zeros(n, 3);
    results(:, 1:2) = points;

    for i = 1:n-1
        results(i, 3) = results(i + 1, 1) - results(i, 1);
    end
    results(n, 3) = NaN;
end