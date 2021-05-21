F = 10;
m = 5/1000; % masa en kg
f = @(t, x) F ./ m .* t; % Para la ecuación diferencial
g = @(t) F ./ (2 .* m) .* t .^ 2; % Para el gráfico exacto

[X, T] = EDOEuler(f, [0, 5], 1, 0);

plot(T, X, 'DisplayName', '$x(t)$ (aproximado)');
hold on;
fplot(g, [0, 5], 'DisplayName', '$x(t)$ (exacto)')
xlabel('$t$ (s)', 'interpreter', 'latex')
ylabel('$x$ (m)', 'interpreter', 'latex')
legend('interpreter', 'latex', 'location', 'southeast');
