f = @(x) tan(0.1*x) - 9.2*exp(-x);

% Graficando, parece haber dos raices. Una entre 0 y 15, y la otra entre 16 y 30.
% La menor raíz positiva, entonces, va a estar entre 0 y 15.

% No especifican condición de parada, así que digo que |f(x)| <= 10^-4.
c = @(opt) abs(opt.f_x) <= 1e-4;

[x, f_x, n, ~] = CalcRaizBiseccion2(f, 0, 15, c);
dispFormatted('Bisección', x, f_x, n);
% Bisección: x = 3.2929, f(x) = -7.4417e-07, n = 16

[x, f_x, n, ~] = CalcRaizPosFalsa2(f, 0, 15, c);
dispFormatted('Pos. Falsa', x, f_x, n);
% Pos. Falsa: x = 3.2931, f(x) = 8.7965e-05, n = 56

function dispFormatted(mode, x, f_x, n)
    disp([mode, ': x = ', num2str(x), ', f(x) = ', num2str(f_x), ...
         ', n = ', num2str(n)]);
end
