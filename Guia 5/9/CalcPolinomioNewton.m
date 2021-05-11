function f = CalcPolinomioNewton(points, varargin)
%CalcPolinomioNewton - Devuelve el polinomio de interpolación de Newton.
%   ** REQUIERE SYMBOLIC TOOLBOX **
%
% Uso:
%   syms f(x)
%   f(x) = CalcPolinomioNewton(points, varargin)
%
% Input:
%   points: puntos mediante los cuales interpolar. Formato:
%       [x1, y1; x2, y2; ...; xn, yn]
%   n: (opcional) int. indica si calcular p1, p2, ..., pn (default: n)
%   regresivo: (opcional) boolean indicando si se precisa el polinomio 
%       regresivo.
%   coefs: (opcional) matriz de coeficientes a utilizar.
%
% Output:
%   f: función simbólica del polinomio interpolante de Newton
    
    parser = inputParser;
    validPoints = @(points) size(points, 2) == 2 && size(points, 1) > 1;
    validGrado = @(n) n > 0 && n < size(points, 1);
    addRequired(parser, 'points', validPoints); 
    addOptional(parser, 'regresivo', false);
    addParameter(parser, 'n', size(points, 1) - 1, validGrado);
    addParameter(parser, 'coefs', NaN)
    parse(parser, points, varargin{:});

    coefs = parser.Results.coefs;
    regresivo = parser.Results.regresivo;
    n = parser.Results.n + 1;
    
    if isnan(coefs)
        coefs = CoeficientesPolinomioNewton(points, regresivo);
    end

    if regresivo
        points = points(n:-1:1, :);
    end

    syms p(x) t(x)
    p(x) = 0;

    for i = 1:n
        t(x) = coefs(i);
        
        if (i ~= 1)
            for j = 1:i-1
                t(x) = t(x) * (x - points(j, 1));
            end
        end

        p(x) = p(x) + t(x);
    end

    f = p(x);
end