% Ejercicio 6.a
f = @(x) x*sin(x) - 1;

% Inciso 1
c = @(opt) abs(opt.x - opt.x_a) <= 1e-2;
[x, f_x, n, e] = CalcRaizBiseccion2(f, 0, 2, c);
dispFormatted('6.a.1 - Biseccion', n, f_x, e);
% 6.a.1 - Biseccion) 8 iteraciones, err_f(x) = 0.004208, cota err x = 0.0039063

[x, f_x, n, e] = CalcRaizPosFalsa2(f, 0, 2, c);
dispFormatted('6.a.1 - Pos. Falsa', n, f_x, e);
% 6.a.1 - Pos. Falsa) 3 iteraciones, err_f(x) = 5.6304e-06, cota err x = 0.0035398

% Inciso 2
c = @(opt) abs(opt.f_x) <= 1e-5;
[x, f_x, n, e] = CalcRaizBiseccion2(f, 0, 2, c);
dispFormatted('6.a.2 - Biseccion', n, f_x, e);
% 6.a.2 - Biseccion) 17 iteraciones, err_f(x) = 8.5271e-06, cota err x = 7.6294e-06

[x, f_x, n, e] = CalcRaizPosFalsa2(f, 0, 2, c);
dispFormatted('6.a.2 - Pos. Falsa', n, f_x, e);
% 6.a.2 - Pos. Falsa) 3 iteraciones, err_f(x) = 5.6304e-06, cota err x = 0.0035398

% Ejercicio 6.b
f = @(x) 2*x^(1.5) + x^2 - x - 5e4;
c = @(opt) abs(opt.f_x) <= 1e-5 || abs(opt.x - opt.x_a) <= 1e-2;
[x, f_x, n, e] = CalcRaizBiseccion2(f, 200, 220, c);
dispFormatted('6.b.2 - Biseccion', n, f_x, e);
% 6.b.2 - Biseccion) 11 iteraciones, err_f(x) = 1.0375, cota err x = 0.0048828

[x, f_x, n, e] = CalcRaizPosFalsa2(f, 200, 220, c);
dispFormatted('6.b.2 - Pos. Falsa', n, f_x, e);
% 6.b.2 - Pos. Falsa) 3 iteraciones, err_f(x) = 0.051462, cota err x = 0.00246

function dispFormatted(inciso, n, f_x, e)
    disp([inciso, ') ', num2str(n), ' iteraciones, err_f(x) = ', ...
        num2str(abs(f_x)), ', cota err x = ', num2str(abs(e)/2)]);
end
