% Realice un programa en Matlab que, a partir de un conjunto de n 
%   puntos, aplique polinomio interpolante de Lagrange a un nuevo punto 
%   x. Aplique al problema del ejercicio 1 para comparar los resultados.

% Solución (sólo del inciso (b)):
%   P =  2 atm --> T =  72.7254 C
%   P = 10 atm --> T = 156.0253 C
%   P = 30 atm --> T = 178.7912 C

points = [  1,  56.5;
            5, 113.0;
           20, 181.0;
           40, 214.5];

X = [2, 10, 30];

results = InterpolarLagrange(points, X);

for i = 1:size(results, 1)
    fprintf('P = %2d atm --> T = %8.4f C\n', results(i, 1), results(i, 2));
end