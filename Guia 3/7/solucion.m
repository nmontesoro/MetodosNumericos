subplot(2, 2, 1);

% 7.a --------------------------------------------------------------------------
f = @(x) cos(x) + 1 - x;
fplot(f);
title('a');

% 7.a.1
c = @(opt) (opt.n == 10000) || (abs(opt.f_x) < 1e-3);
[x, f_x, n, e] = CalcRaizBiseccion2(f, 1, 2, c);
dispFormatted('7.a.1 B', n, f_x, e, x);

[x, f_x, n, e] = CalcRaizPosFalsa2(f, -pi/2, 3*pi/2, c);
dispFormatted('7.a.1 P', n, f_x, e, x);

% 7.a.2
c = @(opt) (opt.n == 10000) || (abs(opt.x - opt.x_a) < 1e-2);
[x, f_x, n, e] = CalcRaizBiseccion2(f, -pi, 3*pi, c);
dispFormatted('7.a.2 B', n, f_x, e, x);

[x, f_x, n, e] = CalcRaizPosFalsa2(f, -pi, 3*pi, c);
dispFormatted('7.a.2 P', n, f_x, e, x);

% 7.b --------------------------------------------------------------------------
f = @(x) x*exp(x);
subplot(2, 2, 2);
fplot(f);
title('b');
% Conozco el valor exacto de la raíz: x = 0

% 7.b.1
c = @(opt) (opt.n == 10000) || (abs(opt.f_x) < 1e-5 && abs(opt.x - opt.x_a) < 1e-2);
[x, f_x, n, e] = CalcRaizBiseccion2(f, -1, 2, c);
dispFormatted('7.b.1 B', n, f_x, e, x);

[x, f_x, n, e] = CalcRaizPosFalsa2(f, -1, 2, c);
dispFormatted('7.b.1 P', n, f_x, e, x);

% 7.c --------------------------------------------------------------------------
f = @(x) x^3 - x - 3;
subplot(2, 2, 3);
fplot(f);
title('c');
% Es polinomio -> Conozco el valor exacto de la raíz: x = 1.671699881657161

% 7.c.1
c = @(opt) (opt.n == 10000) || (abs(opt.f_x) < 1e-5 || abs(1.671699881657161 - opt.x) < 1e-2);
[x, f_x, n, e] = CalcRaizBiseccion2(f, -100, 100, c);
dispFormatted('7.c.1 B', n, f_x, e, x);

[x, f_x, n, e] = CalcRaizPosFalsa2(f, -100, 100, c);
dispFormatted('7.c.1 P', n, f_x, e, x);

% 7.d --------------------------------------------------------------------------
f = @(x) atan(x);
subplot(2, 2, 4);
fplot(f);
title('d');
% Conozco el valor exacto de la raíz: x = 0

% 7.d.1
c = @(opt) (opt.n == 10000) || (abs(opt.f_x) < 1e-5);
[x, f_x, n, e] = CalcRaizBiseccion2(f, -1, 1, c);
dispFormatted('7.d.1 B', n, f_x, e, x);

[x, f_x, n, e] = CalcRaizPosFalsa2(f, -1, 1, c);
dispFormatted('7.d.1 P', n, f_x, e, x);


function dispFormatted(inciso, n, f_x, e, x)
    disp([inciso, ') x = ', num2str(x), '. Iteraciones: ', num2str(n), ...,
    ', err_f(x): ', num2str(f_x) ', cota err x: ', num2str(e)]);
end