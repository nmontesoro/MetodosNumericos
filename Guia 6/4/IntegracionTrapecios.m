function val = IntegracionTrapecios(varargin)
%IntegracionTrapecios - Aproxima la integral de una función o de una 
%   serie de puntos mediante el método de trapecios.
%
% Syntax: val = IntegracionTrapecios(params)
%
% Input:
%   a: valor inicial de x.
%   b: valor final de x.
%   f: función a la cual calcular la integral.
%   points: matriz de puntos. Formato: [x1, y1; ...; xn, yn].
%   n: (opcional) cantidad de subintervalos a utilizar. Si no se 
%       especifica, se utiliza (cant. de puntos) - 1, o 1 si se pasa una
%       función f como parámetro.
%
% Output:
%   val: valor aproximado de la integral.
    parser = inputParser;
    isValidN = @(n) ~isinf(n) && floor(n) == n && n >= 1;
    addParameter(parser, 'a', NaN);
    addParameter(parser, 'b', NaN);
    addParameter(parser, 'points', NaN);
    addParameter(parser, 'n', NaN);
    addParameter(parser, 'f', NaN);
    parse(parser, varargin{:});

    a = parser.Results.a;
    b = parser.Results.b;
    n = parser.Results.n;
    points = parser.Results.points;
    f = parser.Results.f;

    if ~isnan(points) & ~isnan(f)
        warning('Se pasaron parámetros para f y points - se ignora este último')
    end

    if isnan(points)
        if isnan(n)
            n = 1;
        end

        if ~isa(f, 'function_handle') || isnan(a) || isnan(b)
            error('Faltan parámetros')
        else
            X = linspace(a, b, n + 1);
            Y = f(X);
            points = [X.', Y.'];
        end
    else
        if isnan(n)
            n = size(points, 1) - 1;
        end
    end

    N = size(points, 1);
    if n >= N
        error('n debe ser < que la cantidad de puntos')
    end

    h = (points(N, 1) - points(1, 1)) / (2 * n);
    val = points(1, 2) + points(N, 2);
    if n ~= 1
        val = val + 2 * sum(points(2:N-1, 2));
    end
    val = h * val;
end
