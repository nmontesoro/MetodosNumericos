function A = MatrizASpline(points, sujeta)
%MatrizASpline - Calcula la matriz A para resolver el sistema de 
%   ecuaciones que da como resultado los c_k.
%
% Syntax: A = MatrizASpline(points, sujeta)
%
% Input:
%   points: puntos a interpolar. Formato: [x1, y1; x2, y2; ...; xn, yn]
%   sujeta: opcional. Bool indicando si se utilizan condiciones de 
%       frontera sujeta (default = false).
%
% Output:
%   A: matriz A del sistema AX = b

    [n, m] = size(points);
    A = zeros(n);

    if ~exist('sujeta', 'var')
        sujeta = false;
    end

    if m == 2
        points = CalcDistanciasSpline(points);
    end

    if sujeta
        A(1, 1) = 2 * points(1, 3);
        A(1, 2) = points(1, 3);
        A(n, n - 1) = points(n - 1, 3);
        A(n, n) = 2 * points(n - 1, 3);
    else
        A(1, 1) = 1;
        A(n, n) = 1;
    end

    for i = 2:n-1
        j = i - 1;
        A(i, j) = points(i - 1, 3);
        A(i, j + 1) = 2 * (points(i - 1, 3) + points(i, 3));
        A(i, j + 2) = points(i, 3);
    end
end