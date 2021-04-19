% RESPUESTA:
% 12.a.1) x = 1.2839. Iteraciones: 148, err_f(x): -0.00098718, cota err x: 0.0010294
% 12.a.2) x = 1.2883. Iteraciones: 94, err_f(x): -0.0094705, cota err x: 0.0098758
%   12.b) g(x) ? --> No se puede resolver por punto fijo
%   12.c) x = Inf. Iteraciones: 1000, err_f(x): NaN, cota err x: NaN
%   12.d) g(x) = 0 --> No se puede resolver por punto fijo


% Para los valores iniciales me baso en las soluciones que encontré para el 
%   ejercicio 7.

% a ----------------------------------------------------------------------------
f = @(x) cos(x) + 1 - x;
g = @(x) cos(x) + 1;
c = @(opt) (opt.n == 1000) || (abs(opt.f_x) < 1e-3);
[x, f_x, n, e] = CalcRaizPuntoFijo(f, g, 1, c);
dispFormatted('12.a.1', n, f_x, e, x);

c = @(opt) (opt.n == 1000) || (abs(opt.x - opt.x_a) < 1e-2);
[x, f_x, n, e] = CalcRaizPuntoFijo(f, g, 1, c);
dispFormatted('12.a.2', n, f_x, e, x);

% b ----------------------------------------------------------------------------
% f = @(x) x*exp(x);
% g = @(x) exp(x) * (x + 1);
% c = @(opt) (opt.n == 1000) || (abs(opt.f_x) < 1e-5 && abs(opt.x - opt.x_a) < 1e-2);
% [x, f_x, n, e] = CalcRaizPuntoFijo(f, g, 0, c);
% dispFormatted('  12.b', n, f_x, e, x);
disp(['  12.b) g(x) ? --> No se puede resolver por punto fijo']);

% c ----------------------------------------------------------------------------
f = @(x) x^3 - x - 3;
g = @(x) x^3 - 3;
c = @(opt) (opt.n == 1000) || (abs(opt.f_x) < 1e-5 || abs(1.671699881657161 - opt.x) < 1e-2);
[x, f_x, n, e] = CalcRaizPuntoFijo(f, g, 2, c);
dispFormatted('  12.c', n, f_x, e, x);

% d ----------------------------------------------------------------------------
disp('  12.d) g(x) = 0 --> No se puede resolver por punto fijo');

function dispFormatted(inciso, n, f_x, e, x)
    disp([inciso, ') x = ', num2str(x), '. Iteraciones: ', num2str(n), ...,
    ', err_f(x): ', num2str(f_x) ', cota err x: ', num2str(e)]);
end