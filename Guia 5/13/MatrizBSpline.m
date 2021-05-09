function b = MatrizBSpline(points, sujeta, f_0, f_n)
%MatrizBSpline - Calcula la matriz b del sistema para calcular los c_k
%
% Input:
%   points: puntos a interpolar. Formato: [x1, y1; x2, y2; ...; xn, yn]
%   sujeta: opcional. Bool indicando si se utilizan condiciones de 
%       frontera sujeta (default = false).
%   f_0, f_n: necesarios si sujeta == true. Valor de la derivada primera
%       de f en x_0 y x_n.
%
% Output:
%   b: matriz b del sistema AX = b

    [n, m] = size(points);
    b = zeros(n, 1);

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
        b(1) = 3 / points(1, 3) * (points(2, 2) - points(1, 2)) - 3 * f_0;
        b(n) = 3 * f_n - 3 / points(n-1, 3) * (points(n, 2) - points(n-1, 2));
    else
        b(1) = 0;
        b(n) = 0;
    end

    for i = 2:n-1
        b(i) = 3 / points(i, 3) * (points(i + 1, 2) - points(i, 2)) ...
             - 3 / points(i - 1, 3) * (points(i, 2) - points(i - 1, 2));
    end
end
