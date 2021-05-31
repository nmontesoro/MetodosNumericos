k1 = 0.4;
k2 = 0.02;
k3 = 0.001;
k4 = 0.03;

% f(t, p, c)
f = @(X) k1 * X(2) - k2 * X(3) * X(2);
g = @(X) k3 * X(3) * X(2) - k4 * X(3);

% No sé qué valor tomar para el final del intervalo
% Tomo 0.5 y h = 0.005 (100 puntos)
X = ResolverEDO({f, g}, [0, 20], 0.05, [30, 3]);

figure
hold on
plot(X(:, 1), X(:, 2), 'DisplayName', '$p$')
plot(X(:, 1), X(:, 3), 'DisplayName', '$c$')

xlabel('Tiempo', 'interpreter', 'latex')
ylabel("Poblaci\'{o}n", 'interpreter', 'latex')
legend('interpreter', 'latex')
hold off
