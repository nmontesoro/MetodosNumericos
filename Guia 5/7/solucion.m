% En una prueba de tiro oblicuo se obtuvieron los siguientes resultados:

points = [ 0.0, 0.000;
           4.0, 1.435;
           8.0, 2.265;
          12.0, 3.365;
          16.0, 3.838;
          20.0, 3.992;
          24.0, 3.842;
          28.0, 3.653;
          32.0, 2.555;
          36.0, 1.443;
          40.0, 0.000];

% (a) Evalúe el polinomio interpolante de Lagrange en los puntos de la 
%   tabla, usando el programa del ejercicio 5 para calcular los valores.
%   Grafique el resultado.

results = InterpolarLagrange(points, points(:, 1));

for i = 1:size(results, 1)
    fprintf('x = %4.1f h = %5.3f\n', results(i, 1), results(i, 2));
end

scatter(results(:, 1), results(:, 2));
xlabel('x (m)');
ylabel('h (m)');

% (b) ¿Se trata de una buena aproximación?
syms f(x)
f(x) = CalcPolinomioLagrange(points);
hold on
fplot(f)
% Por la forma que tiene el gráfico, parecería ser una buena 
%   aproximación para valores en el rango 5 < x < 35

% (c) Repita el gráfico redondeando los coeficientes (al calcularlos, 
%   en el programa) a 5 cifras significativas. ¿Qué sucede?
% El polinomio que devuelve mi función, redondeado a 5 cifras significativas, queda:
p = @(x) 3.0216e-11*x*(x - 4)*(x - 8)*(x - 12)*(x - 16)*(x - 20)*(x - 24)*(x - 28)*(x - 36)*(x - 40) ...
- 3.7923e-12*x*(x - 4)*(x - 8)*(x - 12)*(x - 16)*(x - 20)*(x - 24)*(x - 28)*(x - 32)*(x - 40) ...
- 1.1520e-10*x*(x - 4)*(x - 8)*(x - 12)*(x - 16)*(x - 20)*(x - 24)*(x - 32)*(x - 36)*(x - 40) ...
+ 2.1204e-10*x*(x - 4)*(x - 8)*(x - 12)*(x - 16)*(x - 20)*(x - 28)*(x - 32)*(x - 36)*(x - 40) ...
- 2.6438e-10*x*(x - 4)*(x - 8)*(x - 12)*(x - 16)*(x - 24)*(x - 28)*(x - 32)*(x - 36)*(x - 40) ...
+ 2.1182e-10*x*(x - 4)*(x - 8)*(x - 12)*(x - 20)*(x - 24)*(x - 28)*(x - 32)*(x - 36)*(x - 40) ...
- 1.0612e-10*x*(x - 4)*(x - 8)*(x - 16)*(x - 20)*(x - 24)*(x - 28)*(x - 32)*(x - 36)*(x - 40) ...
+ 2.6787e-11*x*(x - 4)*(x - 12)*(x - 16)*(x - 20)*(x - 24)*(x - 28)*(x - 32)*(x - 36)*(x - 40) ...
- 3.7713e-12*x*(x - 8)*(x - 12)*(x - 16)*(x - 20)*(x - 24)*(x - 28)*(x - 32)*(x - 36)*(x - 40);

fplot(p)
xlim([0, 40])
% Queda exactamente el mismo gráfico... Raro.
