% Solución:
%   Utilizando sólo 10 iteraciones, con la fórmula común se encuentra
%   x = 0.00057942 y con la optimizada x = 5.1944e-09 (mucho más pequeño).
%
%   Velocidad de convergencia:
%       i |     x1     |     x2
%      =============================
%       1 |    0.27075 |    0.041494
%       2 |    0.14147 |  0.00028695
%       3 |   0.072405 |  1.3724e-08
%       4 |   0.036639 | -1.8636e-08
%       5 |   0.018431 |  5.1944e-09
%       6 |   0.009244 |  5.1944e-09
%       7 |  0.0046291 |  5.1944e-09
%       8 |  0.0023164 |  5.1944e-09
%       9 |  0.0011586 |  5.1944e-09
%      10 | 0.00057942 |  5.1944e-09

f = @(x) exp(x) - x - 1;
g = @(x) exp(x) - 1;

% Para no tener que reescribir ninguna función, cambio la condición de parada
for i = 1:10
    c = @(opt) opt.n == i;
    [x1, ~, ~, ~] = CalcRaizNewton(f, g, 0.5, c);
    [x2, ~, ~, ~] = CalcRaizNewton(f, g, 0.5, c, 2);
    dispFormatted(i, x1, x2);
end

function dispFormatted(n, x1, x2)
    err = abs(x1 - x2);

    disp([num2str(n), ': x1 = ', num2str(x1), ', x2 = ', num2str(x2), ...
         ' (', num2str(err), ')']);
end
