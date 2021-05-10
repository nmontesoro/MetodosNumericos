function err = ErrorRegresion(points, values, m, metodo)
%ErrorRegresion - Calcula el error pedido para el ajuste de un polinomio 
% de grado m por mínimos cuadrados.
%
% Syntax: err = ErrorRegresion(points, values, m, metodo)
%
% Input:
%   points: puntos a interpolar. Formato: [x1, y1; x2, y2; ...; xn, yn]
%   values: vector columna de valores del polinomio en x1, x2, ..., xn.
%   m: grado del polinomio utilizado.
%   metodo: 'error', 'rms' o 'varianza' según se requiera. 
%       (default: 'error').

    n = size(points, 1);

    if ~exist('metodo', 'var')
        metodo = 'error';
    end

    err = sum((values(:) - points(:, 2)) .^ 2);

    if strcmp(metodo, 'rms')
        err = sqrt(err / n);
    elseif strcmp(metodo, 'varianza')
        err = err / (n - m - 1);
    end
end