function val = IntegracionSimpson(points, varargin)
%IntegracionSimpson - Integra una función o un conjunto de puntos 
%   con las reglas de Simpson (1/3 o 3/8, según se pida)
%
% Syntax: val = IntegracionSimpson(points, varargin)
%
% Input:
%   points: conjunto de puntos o función que los genera
%   a: requerido si se pasa una función. Extremo inferior del intervalo.
%   b: requerido si se pasa una función. Extremo superior del intervalo.
%   metodo: 1/3 o 3/8, según lo que se pretenda calcular. Default: 1/3.
%   n: opcional. Cantidad de subintervalos a utilizar.
%
% Output:
%   val: valor aproximado de la integral.

    isValidMetodo = @(x) x == 1/3 || x == 3/8;
    parser = inputParser();
    addRequired(parser, 'points');
    addOptional(parser, 'a', NaN);
    addOptional(parser, 'b', NaN);
    addParameter(parser, 'metodo', 1/3, isValidMetodo);
    addParameter(parser, 'n', NaN);
    parse(parser, points, varargin{:});

    points = parser.Results.points;
    a = parser.Results.a;
    b = parser.Results.b;
    metodo = parser.Results.metodo;
    n = parser.Results.n;

    if isa(points, 'function_handle')
        % Me pasaron una función
        if isnan(a) || isnan(b)
            error('Faltan parámetros a o b.')
        end
        if metodo == 1/3
            if isnan(n)
                % 1/3 simple
                X = [a; (a + b) / 2; b];
            else
                % 1/3 compuesto
                if mod(n, 2) ~= 0
                    error('n debe ser par para aplicar 1/3 compuesto.')
                end
                X = linspace(a, b, n + 1).';
            end
        else
            if isnan(n)
                % 3/8 simple
                X = [a; (2 * a + b) / 3; (a + 2 * b) / 3; b];
            else
                % 3/8 compuesto
                if mod(n, 3) ~= 0
                    error('n debe ser múltiplo de 3 para aplicar 3/8 compuesto.')
                end
                X = linspace(a, b, n + 1).';
            end
        end

        Y = points(X);
        points = [X, Y];
    else
        % Me pasaron un conjunto de puntos
        n = size(points, 1) - 1;
        a = points(1, 1);
        b = points(n + 1, 1);
        if metodo == 1/3 && mod(n, 2) ~= 0
            error('n debe ser par para aplicar 1/3 compuesto.')
        elseif metodo == 3/8 && mod(n, 3) ~= 0
            error('n debe ser múltiplo de 3 para aplicar 3/8 compuesto.')
        end
    end

    if metodo == 1/3
        if isnan(n)
            val = s13s();
        else
            val = s13c();
        end
    else
        if isnan(n)
            val = s38s();
        else
            val = s38c();
        end
    end

    function val = s13s()
        val = (b - a) / (2 * 3) ...
            * (points(1, 2) + 4 * points(2, 2) + points(3, 2));
    end

    function val = s13c()
        val = (b - a) / (3 * n) ...
            * (points(1, 2) + points(n + 1, 2) ...
            + 4 * sum(points(2:2:n, 2)) + 2 * sum(points(3:2:n-1, 2)));
    end

    function val = s38s()
        val = (b - a) / 8 * (points(1, 2) + 3 * points(2, 2) ...
            + 3 * points(3, 2) + points(4, 2));
    end

    function val = s38c()
        val = 3 * (b - a) / (n * 8) * (points(1, 2) + points(n + 1, 2) ...
            + 3 * sum(points(2:3:n - 1, 2)) ...
            + 3 * sum(points(3:3:n, 2)) ...
            + 2 * sum(points(4:3:n - 2, 2)));
    end
end
