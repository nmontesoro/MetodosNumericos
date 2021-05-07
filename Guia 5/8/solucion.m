% points = [1, 120.8;
%           2,  94.0;
%           3,  82.1;
%           4,  75.2];
% syms p(x)
% p(x) = CalcPolinomioLagrange(points);

% (a) Calcule el polinomio interpolante de Lagrange de orden 3
pl = @(x) 188/15.*(x-1).*(x-2).*(x-3) - 821/20.*(x-1).*(x-2).*(x-4) ...
    + 47.*(x-1).*(x-3).*(x-4) - 302/15.*(x-2).*(x-3).*(x-4);

% (b) Calcule el polinomio interpolante de Newton con diferencias
%   progresivas, en forma manual
pnp = @(x) 604/5 - 134/5.*(x-1) + 149/20.*(x-1).*(x-2) ...
    - 4/3.*(x-1).*(x-2).*(x-3);

% (c) Calcule el polinomio interpolante de Newton con diferencias
%   regresivas, en forma manual
pnr = @(x) 376/5 - 69/10.*(x-4) + 5/3.*(x-4).*(x-3) ...
    - 33/20.*(x-4).*(x-3).*(x-2);

% (d) Compare en forma gráfica el resultado obtenido en los incisos 
%   anteriores con la fórmula empírica para puntos entre 1 y 4 con
%   intervalos de 0.1
f = @(x) 30.4 + 90.4.*x.^(-0.507);
fplot(f)
hold on

xvals = [1:0.1:4];
scatter(xvals, pl(xvals))
scatter(xvals, pnp(xvals))
scatter(xvals, pnr(xvals))
xlim([1,4])

% (e) Calcule v para i1 = 1.5 e i2 = 3.5 con las funciones anteriores.
% results = f, L, NP, NR
% 
%     1.5000  104.0021  104.9188  105.0375  101.7938
%     3.5000   78.2989   78.6437   79.2375   78.8521
results = zeros(2, 5);
results(:, 1) = [1.5; 3.5];
results(:, 2) = f(results(:, 1));
results(:, 3) = pl(results(:, 1));
results(:, 4) = pnp(results(:, 1));
results(:, 5) = pnr(results(:, 1));
results

% (f) Calcule el error absoluto y relativo entre el valor de la fórmula
%   empírica y los valores predichos por los polinomios interpolantes
%   en el ítem anterior.
% errs = L, NP, NR (abs y rel)
% 
%     1.5000    0.9167    0.0088    1.0354    0.0100    2.2083    0.0212
%     3.5000    0.3448    0.0044    0.9386    0.0120    0.5531    0.0071
err_abs = @(x, y) abs(x - y);
err_rel = @(x, y) abs(x - y) ./ abs(x);
errs = zeros(2, 7);
errs(:, 1) = [1.5; 3.5];
errs(:, 2) = err_abs(results(:, 2), results(:, 3));
errs(:, 3) = err_rel(results(:, 2), results(:, 3));
errs(:, 4) = err_abs(results(:, 2), results(:, 4));
errs(:, 5) = err_rel(results(:, 2), results(:, 4));
errs(:, 6) = err_abs(results(:, 2), results(:, 5));
errs(:, 7) = err_rel(results(:, 2), results(:, 5));
errs
