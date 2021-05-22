function [Y, X] = EDOEuler(f, intervalo, h, cond_inic, varargin)
%EDOEuler - Calcula la solución de una Ecuación Diferencial Ordinaria
%   mediante el método de Euler (mejorado, si se especifica)
%
% Syntax: [Y, X] = EDOEuler(f, intervalo, h, cond_inic, [mejorado])
%
% Input:
%   f: función de la EDO (dy/dx = f(x, y))
%   intervalo: vector [a, b] (a < x < b)
%   h: paso
%   cond_inic: y(a)
%   mejorado: opcional. Boolean indicando si utilizar el método de Heun
%       (Euler mejorado) (default: false)
%
% Output:
%   Y: vector de las aproximaciones encontradas de la solución
%   X: vector de los valores utilizados de x

    validF = @(f) isa(f, 'function_handle');
    validIntervalo = @(intervalo) (all(size(intervalo) == [2, 1]) || ...
        all(size(intervalo) == [1, 2])) && intervalo(1) < intervalo(2);
    validH = @(h) h > 0;
    validMejorado = @(mejorado) isa(mejorado, 'logical');

    parser = inputParser();
    addRequired(parser, 'f', validF);
    addRequired(parser, 'intervalo', validIntervalo);
    addRequired(parser, 'h', validH);
    addRequired(parser, 'cond_inic');
    addOptional(parser, 'mejorado', false, validMejorado);
    parse(parser, f, intervalo, h, cond_inic, varargin{:})

    f = parser.Results.f;
    a = parser.Results.intervalo(1);
    b = parser.Results.intervalo(2);
    h = parser.Results.h;
    mejorado = parser.Results.mejorado;

    m = floor((b - a) / h) + 1;
    Y = zeros(m, 1);
    Y(1) = cond_inic;
    X = (a + h .* [0:m-1]).';

    if ~mejorado
        for i = 0:m - 2
            Y(i + 2) = Y(i + 1) + h * f(X(i + 1), Y(i + 1));
        end
    else
        for i = 1:m - 1
            Y(i + 1) = Y(i) + h / 2 * (f(X(i), Y(i)) ...
                     + f(X(i + 1), Y(i) + h * f(X(i), Y(i))));
        end
    end
end
