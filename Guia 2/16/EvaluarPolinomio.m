function result = EvaluarPolinomio(x, coef)
%EvaluarPolinomio - Evalúa un polinomio en cierto valor x
%
% Syntax: result = EvaluarPolinomio(x, coef)
%
% Input:
%   x: valor en el cual especializar el polinomio.
%   coef: vector que contiene los coeficientes del polinomio, comenzando
%       por el coeficiente de menor grado.
% Output: el resultado de la expresión.

result = 0;
for i = 1:length(coef)
    result = result + coef(i)*x^(i-1);
end

end