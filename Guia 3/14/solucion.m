% Solución:
%   Raíz: x = -4.8129 (9 iteraciones)
%   Raíz: x = -0.63477 (8 iteraciones)

f = @(s) 1 + ((s+1.75)/(s*(s+4.6)) * (6.15)/(s^2+1.7*s+3.4));
% fplot(f);

% Raíces cercanas a -5 y -1
c = @(opt) opt.n == 1000 || abs(opt.f_x) < 1e-3;
[x, ~, n, ~] = CalcRaizBiseccion2(f, -5, -4.8, c);
dispFormatted(x, n);

[x, ~, n, ~] = CalcRaizBiseccion2(f, -0.8, -0.5, c);
dispFormatted(x, n);

function dispFormatted(x, n)
    disp(['Raíz: x = ', num2str(x), ' (', num2str(n), ' iteraciones)']);
end