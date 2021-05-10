function f = FuncionRegresionPolinomial(points, m)
%FuncionRegresionPolinomial - Devuelve una función simbólica del 
% polinomio de regresión de grado m. ** REQUIERE SYMBOLIC TOOLBOX **
%
% Syntax: coef = FuncionRegresionPolinomial(points, m)
%
% Input:
%   points: puntos mediante los cuales interpolar. Formato:
%       [x1, y1; x2, y2; ...; xn, yn]
%   m: grado del polinomio (1: lineal, 2: cuadrático, ...)
% Output:
%   f: función simbólica del polinomio

    coef = CoeficientesRegresionPolinomial(points, m);
    syms f(x)
    f(x) = 0;
    
    for i = 1:m + 1
        f(x) = f(x) + coef(i) * x ^ (i - 1);
    end

    f = f(x);
end