function results = InterpolarLagrange(points, X)
%InterpolarLagrange - Realiza la interpolación por el método de Lagrange
% 
%
% Syntax: results = InterpolarLagrange(points, X)
%
% Input:
%   points: puntos que usar para interpolar
%   X: vector con los valores de x a estimar
%
% Output:
%   results: matriz con los puntos estimados. Formato: 
%       [x1, y1; x2, y2; ...; xn, yn]

    syms f(x)
    f(x) = CalcPolinomioLagrange(points);
    
    n = size(X, 1);
    if n == 1
        % X es vector fila
        X = X.';
        n = size(X, 1);
    end
    
    results = zeros(n, 2);
    results(:, 1) = X;
    results(:, 2) = double(f(X));
end