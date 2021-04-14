function [result] = MultiEvaluarPolinomio(x, coef)
%MultiEvaluarPolinomio - Evalúa un polinomio en varios valores de x.
%
% Syntax: [result] = MultiEvaluarPolinomio(x, coef)
%
% Input:
%   x: vector con los valores de x a considerar.
%   coef: vector que contiene los coeficientes del polinomio, comenzando
%       por el coeficiente de menor grado.
% Output: un vector con los valores pedidos.

result = [];
for i = 1:length(x)
    result = [result EvaluarPolinomio(x(i), coef)];
end

end