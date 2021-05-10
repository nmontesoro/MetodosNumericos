function strs = PolinomiosSplineAsLatex(points, copy, sujeta, f_0, f_n)   
%PolinomiosSplineAsLatex - Devuelve los polinomios de Spline en formato
%   LaTeX.
%
% Syntax: strs = PolinomiosSplineAsLatex(points, sujeta, f_0, f_n)  
%
% Input:
%   points: puntos a interpolar. Formato: [x1, y1; x2, y2; ...; xn, yn]
%   copy: bool. Indica si copiar el resultado al clipboard.
%   sujeta: opcional. Bool indicando si se utilizan condiciones de 
%       frontera sujeta (default = false).
%   f_0, f_n: necesarios si sujeta == true. Valor de la derivada primera
%       de f en x_0 y x_n.
%
% Output:
%   strs: array de strings, cada una con el polinomio

    [n, m] = size(points);

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
        coef = CoeficientesSpline(points, sujeta, f_0, f_n);
    else
        coef = CoeficientesSpline(points);
    end

    strs = strings(n - 1, 1);

    for i = 1:n - 1
        xk = points(i, 1);
        strs(i) = sprintf('p_{%d}(x) =', i - 1);

        if ~ coef(i, 1) == 0
            strs(i) = strs(i) + sprintf(' %+5.4f', coef(i, 1));
        end

        for j = 2:4
            if xk == 0
                formatstr = ' %1$+5.4f \\cdot x^%3$d';
            else
                formatstr = ' %1$+5.4f \\cdot (x %2$+5.4f)^%3$d';
            end

            if ~ coef(i, j) == 0
                strs(i) = strs(i) + sprintf(formatstr, coef(i, j), -xk, j - 1);
            end
        end

        strs(i) = strs(i) + sprintf(' &\\text{ si } %+5.4f < x < %+5.4f', ...
                points(i, 1), points(i + 1, 1));
    end

    if copy
        clipboard('copy', [sprintf('%s \\\\\n', strs(:, 1))]);
    end
end