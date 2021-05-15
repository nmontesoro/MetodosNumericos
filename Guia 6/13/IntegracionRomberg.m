function val = IntegracionRomberg(points, i, j, varargin)
%IntegracionRomberg - Calcula la integral de una función o un conjunto de puntos
%   mediante el método de Romberg + Richardson.
%
% Syntax: val = IntegracionRomberg(points, i, j, varargin)
%
% Input:
%   points: función o conjunto de puntos.
%   i: índice i de la estimación (R_{ij}).
%   j: índice j de la estimación (R_{ij}).
%   a: necesario si se pasa una función. Extremo inferior del intervalo.
%   b: necesario si se pasa una función. Extremo superior del intervalo.
% Ouput:
%   val: estimación R_{ij}
    isValidPoints = @(x) isa(x, 'double') || isa(x, 'function_handle');
    isValidIndex = @(x) ~isinf(x) && floor(x) == x && x >= 1;
    parser = inputParser();
    addRequired(parser, 'points', isValidPoints);
    addRequired(parser, 'i', isValidIndex);
    addRequired(parser, 'j', isValidIndex);
    addOptional(parser, 'a', NaN);
    addOptional(parser, 'b', NaN);
    parse(parser, points, i, j, varargin{:});
    points = parser.Results.points;
    i = parser.Results.i;
    j = parser.Results.j;
    a = parser.Results.a;
    b = parser.Results.b;
    f = NaN;
    N = 0;

    if isa(points, 'function_handle')
        if isnan(a) || isnan(b)
            error('Faltan parámetros a o b.')
        else
            f = points;
            val = romberg_f(i, j);
        end
    else
        N = size(points, 1);
        a = points(1, 1);
        b = points(N, 1);
        val = romberg_p(i, j);
    end

    function val = romberg_f(i, j)
        if i == 1 && j == 1
            val = (b - a) / 2 * (f(a) + f(b));
        elseif j == 1
            val = 0;
            h_ = h(i - 1);
            for k = 1:2^(i - 2)
                val = val + f(a + (2 * k - 1) / 2 * h_);
            end
            val = 0.5 * (romberg_f(i - 1, 1) + h_ * val);
        else
            val = (4^(j-1) * romberg_f(i, j-1) - romberg_f(i-1, j-1)) ...
                / (4^(j-1) - 1);
        end
    end

    function val = romberg_p(i, j)
        % TODO: ver si es posible vectorizar.
        if i == 1 && j == 1
            val = (points(N, 1) - points(1, 1)) / 2 ...
                * (points(1, 2) + points(N, 2));
        elseif j == 1
            val = 0;
            for k = 1:2^(i - 2)
                h_ = h(i - 1);
                x = a + (2 * k - 1) / 2 * h_;
                idx = find(points == x, 1);
                if isempty(idx)
                    error('Necesito el valor de f(%d)!', x);
                else
                    val = val + points(idx, 2);
                end
            end
            val = 0.5 * (romberg_p(i - 1, 1) + h_ * val);
        else
            val = (4^(j-1) * romberg_p(i, j-1) - romberg_p(i-1, j-1)) ...
                / (4^(j-1) - 1);
        end
    end

    function hval = h(i)
        % No puede ser anónima porque Matlab hardcodea los valores de a 
        % y b al definir la función.
        hval = (b - a) / 2 ^ (i - 1);
    end
end