function val = IntegracionAdaptativa(points, c, varargin)
%IntegracionAdaptativa - Aplica el método adaptativo para calcular la
%   integral de una función en el intervalo [a, b].
%
% Syntax: val = IntegracionAdaptativa(points, c, a, b, ajuste)
%
% Input:
%   points: función o conjunto de puntos.
%   c: función de condición de parada (devuelve true cuando se cumple).
%       Se le pasará un struct con los siguientes parámetros:
%           n: índice de la iteración actual.
%           R: valor de la estimación actual.
%           Ra: valor de la iteración anterior.
%           val: valor luego de aplicar ajuste de Richardson.
%           vala: ídem, de la iteración anterior.
%   ajuste: indica si aplicar o no el ajuste de Richardson al final.
%       (default: true)
%   a: necesario si se pasa una función. Extremo inferior del intervalo.
%   b: necesario si se pasa una función. Extremo superior del intervalo.
%
% Output:
%   val: estimación de la integral definida.

    parser = inputParser();
    isValidCondition = @(c) isa(c, 'function_handle');
    addRequired(parser, 'points');
    addRequired(parser, 'c', isValidCondition);
    addOptional(parser, 'a', NaN);
    addOptional(parser, 'b', NaN);
    addOptional(parser, 'ajuste', true);
    parse(parser, points, c, varargin{:})

    points = parser.Results.points;
    c = parser.Results.c;
    a = parser.Results.a;
    b = parser.Results.b;
    ajuste = parser.Results.ajuste;

    k = 1;
    opt.R = IntegracionRomberg(points, k, 1, a, b);
    opt.vala = NaN;
    
    while true
        opt.n = k;
        k = k + 1;
        opt.Ra = opt.R;
        opt.R = IntegracionRomberg(points, k, 1, a, b);
        opt.val = (16 * opt.R - opt.Ra) / 15;
        if c(opt)
            break;
        end
    end

    if ajuste
        val = opt.val;
    else
        val = R;
    end
end