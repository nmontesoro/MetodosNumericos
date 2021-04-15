% Aplico CalcRaizPosFalsa para encontrar las respuestas a los incisos
%   b y c del ejercicio 1.

% En cúantas iteraciones terminaría la búsqueda si el criterio es que la
%   cota de error sea menor a 10^-3?

[~, ~, n, ~] = CalcRaizPosFalsa('3*x+sin(x)-exp(x)', 0, 1, 10^(-3));
disp(['1.b) ', num2str(n), ' iteraciones']);

% En cuántas iteraciones terminaría la búsqueda si el criterio es que el
%   error en y sea menor a 10^-3

% Voy probando distintas cotas de error hasta cumplir la condición
i = -1;
while 1
    [~, f_x, n, ~] = CalcRaizPosFalsa('3*x+sin(x)-exp(x)', 0, 1, 10^i);

    if abs(f_x) < 10^(-3)
        break;
    else
        i = i - 1;
    end
end

disp(['1.c) ', num2str(n), ' iteraciones (f(x)=', num2str(f_x), ')']);
