function f = CalcPolinomioNewton(points, regresivo)
%CalcPolinomioNewton - Devuelve el polinomio de interpolación de Newton.
%   ** REQUIERE SYMBOLIC TOOLBOX **
%
% Uso:
%   syms f(x)
%   f(x) = CalcPolinomioNewton(points, regresivo)
%
% Input:
%   points: puntos mediante los cuales interpolar. Formato:
%       [x1, y1; x2, y2; ...; xn, yn]
%   regresivo: (opcional) boolean indicando si se precisa el polinomio 
%       regresivo.
%
% Output:
%   f: función simbólica del polinomio interpolante de Newton
    
    if ~exist('regresivo', 'var')
        regresivo = false;
    end

    n = size(points, 1);
    
    if regresivo
        points = points(n:-1:1, :);
    end

    syms p(x) t(x)
    p(x) = 0;

    for i = 1:n
        t(x) = DiferenciaDividida(points(1:i, :));
        
        if (i ~= 1)
            for j = 1:i-1
                t(x) = t(x) * (x - points(j, 1));
            end
        end

        p(x) = p(x) + t(x);
    end

    f = p(x);
end