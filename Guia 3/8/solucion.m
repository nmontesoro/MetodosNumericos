M = 5;
G = 9.81;
f = @(v) 1.4*v^1.5 + 1.15*v^2 - M*G*10^5;
c = @(opt) abs(opt.f_x) <= 1e-4;

% Mediante gráficos, determiné a = 1900, b = 2100.

[x, f_x, n, ~] = CalcRaizBiseccion2(f, 1900, 2100, c);
dispFormatted('Bisección', x, f_x, n);
% Bisección: 32 iteraciones. x = 2037.9444, f(x) = 1.1446e-06

[x, f_x, n, ~] = CalcRaizPosFalsa2(f, 1900, 2100, c);
dispFormatted('Pos. Falsa', x, f_x, n);
% Pos. Falsa: 6 iteraciones. x = 2037.9444, f(x) = -7.3202e-06

function dispFormatted(mode, x, f_x, n)
    disp([mode, ': ', num2str(n), ' iteraciones. x = ', num2str(x), ...
         ', f(x) = ', num2str(f_x)]);
end