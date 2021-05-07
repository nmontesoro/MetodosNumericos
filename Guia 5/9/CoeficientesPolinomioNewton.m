function coef = CoeficientesPolinomioNewton(points, regresivo)
%CoeficientesPolinomioNewton - Calcula los coeficientes del polinomio de
%  interpolación de Newton
%
% Syntax: coef = CoeficientesPolinomioNewton(points)
%
% Input
%   points: puntos mediante los cuales interpolar. Formato:
%       [x1, y1; x2, y2; ...; xn, yn]
%   regresivo: (opcional) boolean indicando si se precisa el polinomio 
%       regresivo.
%
% Output:
%   coef: vector de coeficientes

    if ~exist('regresivo', 'var')
        regresivo = false;
    end

    n = size(points, 1);

    if regresivo
        points = points(n:-1:1, :);
    end

    coef = zeros(1, n);

    for i = 1:n
        coef(i) = DiferenciaDividida(points(1:i, :));
    end
end