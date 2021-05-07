syms p1(x) p2(x)

points = [  1,  56.5;
            5, 113.0;
           20, 181.0;
           40, 214.5];
p1(x) = CalcPolinomioLagrange(points);

points = [  1,  56.5;
            2,  78.6;
            5, 113.0;
           10, 144.5;
           20, 181.0;
           30, 205.0;
           40, 214.5];

p2(x) = CalcPolinomioLagrange(points);

% (a) Grafique la solución obtenida, superpuesta con el resultado del 
%   inciso (b) del ejercicio 1.
% (b) Calcule el polinomio interpolante de Lagrange correspondiente a la 
%   misma.

% Supongo que se refiere a graficar los polinomios de Lagrange

fplot(p1);
hold on;
fplot(p2);
scatter(points(:, 1), points(:, 2))
xlim([1, 40])

% (c) Evalúe manualmente (??) P(x) en el punto x = 15.
fprintf('P(x=15) = %5.4f\n', double(p2(15)));
