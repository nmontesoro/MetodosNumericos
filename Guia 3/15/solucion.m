% Solución:
%   Raíz: x = -1.8815 (3 iteraciones)
%   Raíz: x = 0.083333 (1 iteraciones)
%   Raíz: x = 1.8398 (3 iteraciones)

% Posibles puntos fijos: -2, 0, 2
% La función es un polinomio, entonces es fácil encontrar su derivada.
%   Por lo tanto, el método de Newton es ideal.
% Voy a aprovechar la función CalcRaicesPolinomio del ejercicio 13.

c = @(opt) opt.n == 10 || abs(opt.f_x) < 1e-3;
[x, ~, n, ~] = CalcRaicesPolinomio([1,0,0,0,-12,1], [-2,0,2], c);

for i = 1:3
    dispFormatted(x(i), n(i));
end

function dispFormatted(x, n)
    disp(['Raíz: x = ', num2str(x), ' (', num2str(n), ' iteraciones)']);
end