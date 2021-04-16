% Ejercicio 6.a
f = @(x) x*sin(x) - 1;

% Inciso 1
c = @(opt) abs(opt.x - opt.x_a) <= 1e-2;
[x, f_x, n, e] = CalcRaizBiseccion2(f, 0, 2, c);
dispFormatted('6.a.1 - Biseccion', n, f_x, e);

[x, f_x, n, e] = CalcRaizPosFalsa2(f, 0, 2, c);
dispFormatted('6.a.1 - Pos. Falsa', n, f_x, e);

% Inciso 2
c = @(opt) abs(opt.f_x) <= 1e-5;
[x, f_x, n, e] = CalcRaizBiseccion2(f, 0, 2, c);
dispFormatted('6.a.2 - Biseccion', n, f_x, e);

[x, f_x, n, e] = CalcRaizPosFalsa2(f, 0, 2, c);
dispFormatted('6.a.2 - Pos. Falsa', n, f_x, e);

% Ejercicio 6.b
f = @(x) 2*x^(1.5) + x^2 - x - 5e4;
c = @(opt) abs(opt.f_x) <= 1e-5 || abs(opt.x - opt.x_a) <= 1e-2;
[x, f_x, n, e] = CalcRaizBiseccion2(f, 200, 220, c);
dispFormatted('6.b.2 - Biseccion', n, f_x, e);

[x, f_x, n, e] = CalcRaizPosFalsa2(f, 200, 220, c);
dispFormatted('6.b.2 - Pos. Falsa', n, f_x, e);

function dispFormatted(inciso, n, f_x, e)
    disp([inciso, ') ', num2str(n), ' iteraciones, err_f(x) = ', ...
        num2str(abs(f_x)), ', cota err x = ', num2str(abs(e)/2)]);
end
