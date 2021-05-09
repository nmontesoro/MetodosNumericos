function coef = CoeficientesSpline(points, sujeta, f_0, f_n)
%CoeficientesSpline - Calcula los coeficientes a_k, b_k, c_k y 
%   d_k del trazador cúbico.
%
% Input:
%   points: puntos a interpolar. Formato: [x1, y1; x2, y2; ...; xn, yn]
%   sujeta: opcional. Bool indicando si se utilizan condiciones de 
%       frontera sujeta (default = false).
%   f_0, f_n: necesarios si sujeta == true. Valor de la derivada primera
%       de f en x_0 y x_n.
%
% Output:
%   coef: matriz con los coeficientes. Formato: [a_k, b_k, c_k, d_k]

    [n, m] = size(points);
    coef = zeros(n, 4);
    coef(:, 1) = points(1:n, 2);

    if m == 2
        points = CalcDistanciasSpline(points);
    end

    if ~exist('sujeta', 'var')
        sujeta = false;
    end

    if sujeta
        if ~exist('f_0', 'var') || ~exist('f_n', 'var')
            error('Se requieren los valores de la derivada en x_0 y x_n.');
        end
        A = MatrizASpline(points, true);
        b = MatrizBSpline(points, true, f_0, f_n);
    else
        A = MatrizASpline(points);
        b = MatrizBSpline(points);
    end
    
    coef(:, 3) = A \ b;
    
    for i = 1:n-1
        coef(i, 2) = (coef(i + 1, 1) - coef(i, 1)) / points(i, 3) ...
                   - points(i, 3) / 3 * (2 * coef(i, 3) + coef(i + 1, 3));
        coef(i, 4) = (coef(i + 1, 3) - coef(i, 3)) / (3 * points(i, 3));
    end

    coef = coef(1:n-1, :);
end