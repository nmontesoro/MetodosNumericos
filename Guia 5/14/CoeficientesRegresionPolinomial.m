function coef = CoeficientesRegresionPolinomial(points, m)
%CoeficientesRegresionPolinomial - Devuelve los coeficientes del 
% polinomio de regresión de grado m
%
% Syntax: coef = CoeficientesRegresionPolinomial(points, m)
%
% Input:
%   points: puntos mediante los cuales interpolar. Formato:
%       [x1, y1; x2, y2; ...; xn, yn]
%   m: grado del polinomio (1: lineal, 2: cuadrático, ...)
% Output:
%   coef: vector con los coeficientes del polinomio

    n = size(points, 1);

    if m >= n
        error(...
            'El grado del polinomio pedido es mayor que la cantidad de datos.');
    end
    
    % Construyo el sistema
    A = zeros(m + 1);
    b = zeros(m + 1, 1);

    for j = 1:m + 1
        for i = 1:m + 1
            A(i, j) = sum(points(:, 1) .^ (i + j - 2));
        end
        b(j) = sum((points(:, 1) .^ (j - 1) .* points(:, 2)));
    end

    % Resuelvo el sistema de ecuaciones
    coef = A \ b;
end