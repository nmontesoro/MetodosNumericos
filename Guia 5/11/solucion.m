% (a) Calcular manualmente el polinomio interpolante de Newton en el intervalo
%   [-5, 5], usando aproximaciones progresivas, y como puntos de interpolación
%   los puntos ...
xk = @(k, n) -5 * cos(k./n*pi);
points = zeros(5, 2);
points(:, 1) = round(xk([0:4], 4), 4).';
f = @(x) 1 ./ (x.^2 + 1);
points(:, 2) = round(f(points(:, 1)), 4).';
format rat
disp('Coeficientes del inciso (a)')
CoeficientesPolinomioNewton(points)

% Queda el siguiente polinomio:
p = @(x) 77/2000 + 109/4484 .* (x + 5) + 175/3683 .* (x + 5) .* (x + 3.5355) ...
  - 501/35170 .* (x + 5) .* (x + 3.5355) .* x ...
  + 502/176201 .* (x + 5) .* (x + 3.5355) .* x .* (x - 3.5355);

% (b) Verificar el resultado graficando ambos f(x) y P(x) en el rango [x0, xn]
fplot(f, [points(1,1), points(5, 1)]) % f(x)
hold on
scatter(points(:, 1), points(:, 2)) % puntos de interpolación
fplot(p, [points(1,1), points(5, 1)]) % p(x)

% (c) Obtener manualmente el polinomio usando aproximaciones progresivas en los
%   3 puntos centrales x1, x2 y x3.
points2 = points(2:4, :);
disp('Coeficientes del inciso (c)')
CoeficientesPolinomioNewton(points2)
% Queda el polinomio:
p2 = @(x) 212/2861 + 347/1325 .* (x + 3.5355) - 4199/56687 .* (x + 3.5355) .* x;

% (d) Obtener manualmente el polinomio usando aproximaciones regresivas en los
%   3 puntos centrales x1, x2 y x3.
disp('Coeficientes del inciso (d)')
CoeficientesPolinomioNewton(points2, true)
% Queda el polinomio:
p3 = @(x) 212/2861 - 347/1325.*(x-3.5355) - 4199/56687.*(x-3.5355).*x;

% Grafico y compruebo que ambos polinomios son iguales.
fplot(p2, [points(1,1), points(5, 1)])
fplot(p3, [points(1,1), points(5, 1)])
