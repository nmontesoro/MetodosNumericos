points = [0,        2;
          1,   4.4366;
          2, 10.77811;
          3,  31.1711;
          4,  93.1963];

% (a) Calcular los coeficientes de un trazador cúbico natural para 
%   aproximar la función en base a los valores de la tabla.
%         a         b         c         d
%    2.0000    1.6509         0    0.7857
%    4.4366    4.0080    2.3571   -0.0237
%   10.7781    8.6513    2.2862    9.4555
%   31.1711   41.5901   30.6526  -10.2175

coefs_mio = CoeficientesSpline(points);
pols_mio = CalcPolinomiosSpline(points, 'coefs', coefs_mio);

% (b) Calcular los coeficientes usando la función spline de Matlab.
%         a         b         c         d
%    2.0000    2.4135   -0.9416    0.9647
%    4.4366    3.4244    1.9525    0.9647
%   10.7781   10.2233    4.8465    5.3232
%   31.1711   35.8859   20.8161    5.3232
coefs_spline = spline(points(:, 1), points(:, 2)).coefs;
coefs_spline = coefs_spline(:, 4:-1:1);
pols_spline = CalcPolinomiosSpline(points, 'coefs', coefs_spline);

% (c) Calcular el polinomio interpolante de Newton
pol_newton = CalcPolinomioNewton(points);

% (d) Graficar la función original y las tres aproximaciones obtenidas
%   en el intervalo [0, 4] y comparar los resultados.
% Son muy cercanos. Mi trazador se superpone con el de la función spline.
f = @(x) 2 .* exp(x) - x .^ 2;
figure
hold on

plotf = fplot(f, 'k'); % función original

plotmio = PlotSpline(points, pols_mio, false, 'r'); % trazador mío

plotsp = PlotSpline(points, pols_spline, false, 'b'); % trazador f. spline

plotn = fplot(pol_newton, 'g'); % Newton

markers = scatter(points(:, 1), points(:, 2), 'filled'); % puntos

legend([plotf, plotmio, plotsp, plotn, markers], {'Función original', ...
    'Trazador mío', 'Trazador spline', 'Newton', 'Datos'}, 'Location', ...
    'northwest')
title('Exactos')
xlim([0, 4])
hold off

% (e) Redondear los coeficientes de los tres casos para que tengan
%   solamente un dígito decimal. Graficar nuevamente las aproximaciones
%   y sacar conclusiones.
% Los gráficos quedan **muy** similares a los anteriores.
coefs_mio_r = round(coefs_mio, 1);
coefs_spline_r = round(coefs_spline, 1);
coefs_newton_r = round(CoeficientesPolinomioNewton(points), 1);

pols_mio_r = CalcPolinomiosSpline(points, 'coefs', coefs_mio_r);
pols_spline_r = CalcPolinomiosSpline(points, 'coefs', coefs_spline_r);
pol_newton_r = CalcPolinomioNewton(points, 'coefs', coefs_newton_r);

figure
hold on

plotfr = fplot(f, 'k'); % función original

plotmior = PlotSpline(points, pols_mio_r, false, 'r'); % trazador mío

plotspr = PlotSpline(points, pols_spline_r, false, 'b'); % trazador f. spline

plotnr = fplot(pol_newton_r, 'g'); % Newton

markersr = scatter(points(:, 1), points(:, 2), 'filled'); % puntos

legend([plotfr, plotmior, plotspr, plotnr, markersr], {'Función original', ...
    'Trazador mío', 'Trazador spline', 'Newton', 'Datos'}, 'Location', ...
    'northwest')
title('Redondeados')
xlim([0, 4])
hold off

% (f) Aplicar todas las aproximaciones al punto x = 1.25, calcular el 
%   error absoluto y relativo y sacar conclusiones.
%
%        Función  Error absoluto  Error relativo
%     Mío exacto 0.1673722937817 0.0308908362337
%  Spline exacto 0.0116113507013 0.0021430329050
%  Newton exacto 0.1393029522638 0.0257102569847
%      Mío aprox 0.1318140850763 0.0243280845556
%   Spline aprox 0.0275609149237 0.0050867421968
%   Newton aprox 0.0954859600763 0.0176232343400
%
% El error disminuyó ligeramente en mi trazador y en el polinomio de 
%   Newton, y aumentó ligeramente en el polinomio generado por la 
%   función spline. En ningún caso es una diferencia considerable.

err_abs = @(x, y) abs(x - y);
err_rel = @(x, y) err_abs(x, y) / abs(x);
x0 = 1.25;
exacto = f(x0);

data = cell(7, 3);
data(1, :) = {'Función', 'Error absoluto', 'Error relativo'};

aprox = double(subs(pols_mio(2), x0));
data(2, :) = {'Mío exacto', err_abs(exacto, aprox), err_rel(exacto, aprox)};

aprox = double(subs(pols_spline(2), x0));
data(3, :) = {'Spline exacto', err_abs(exacto, aprox), err_rel(exacto, aprox)};

aprox = double(subs(pol_newton, x0));
data(4, :) = {'Newton exacto', err_abs(exacto, aprox), err_rel(exacto, aprox)};

aprox = double(subs(pols_mio_r(2), x0));
data(5, :) = {'Mío aprox', err_abs(exacto, aprox), err_rel(exacto, aprox)};

aprox = double(subs(pols_spline_r(2), x0));
data(6, :) = {'Spline aprox', err_abs(exacto, aprox), err_rel(exacto, aprox)};

aprox = double(subs(pol_newton_r, x0));
data(7, :) = {'Newton aprox', err_abs(exacto, aprox), err_rel(exacto, aprox)};

fprintf('%15s %15s %15s\n', data{1, 1}, data{1, 2}, data{1, 3})
for i = 2:7
    fprintf('%15s %14.13f %14.13f\n', data{i, 1}, data{i, 2}, data{i, 3})
end
