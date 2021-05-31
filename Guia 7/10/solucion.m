% Dado el sistema de ecuaciones ...

% (a) Usar los métodos de Euler y Runge-Kutta para resolver el sistema de 
%   ecuaciones para t = 0.20 con intervalo h = 0.02
% (b) Graficar y comparar el resultado con la solución exacta

f = @(X) X(2) + 2 * X(3);
g = @(X) 3 * X(2) + 2 * X(3);

exact_x = @(T) 4 * exp(4 * T) + 2 * exp(-T);
exact_y = @(T) 6 * exp(4 * T) - 2 * exp(-T);
T = [0:0.02:0.2].';

figure
hold on

exacto = [T, exact_x(T), exact_y(T)];
addToCfg(exacto, 'Exacto')

points = ResolverEDO({f, g}, [0, 0.2], 0.02, [6, 4], 'euler');
addToCfg(points, 'Euler')
fprintf('Error promedio de Euler: %3.2e\n', calcErrorPromedio(exacto, points))

points = ResolverEDO({f, g}, [0, 0.2], 0.02, [6, 4], 'rk2');
addToCfg(points, 'Runge-Kutta (2)')
fprintf('Error promedio de RK2: %3.2e\n', calcErrorPromedio(exacto, points))

points = ResolverEDO({f, g}, [0, 0.2], 0.02, [6, 4], 'rk4');
addToCfg(points, 'Runge-Kutta (4)')
fprintf('Error promedio de RK4: %3.2e\n', calcErrorPromedio(exacto, points))

legend('location', 'northwest')

hold off

% Error promedio de Euler: 1.59e-01
% Error promedio de RK2: 4.31e-03
% Error promedio de RK4: 1.37e-06
% En el gráfico se ven extremadamente cercanas. Sin embargo, el mejor 
%   método es el de Runge-Kutta de orden 4.

% TODO: (c) Comparar los resultados con el comando ode45 de Matlab

% Comparo sólo los de RK4
[t, y] = ode45(@ode45handle, [0, 0.2], [6, 4]);
ode45points = [t, y];
% ode45 usa h = 0.005 y creo que no se puede cambiar
% Hago esto para comparar con los mismos valores de x
ode45points = ode45points(1:4:size(ode45points, 1), :);
fprintf('Error promedio entre ODE45 y RK4: %3.2e\n', ...
       calcErrorPromedio(points, ode45points))

% Error promedio entre ODE45 y RK4: 1.37e-06. Es igual al que conseguí 
%   con ResolverEDO, lo que indica que mi función produce resultados
%   tan buenos como ode45.

function addToCfg(points, label)
    plot(points(:, 2), points(:, 3), 'DisplayName', label)
end

function val = calcErrorPromedio(points1, points2)
    val = sum(abs(points1(:, 3) - points2(:, 3)));
    n = size(points1, 1);
    val = val / n;
end

function val = ode45handle(~, Y)
    val = zeros(2, 1);
    val(1) = Y(1) + 2 * Y(2);
    val(2) = 3 * Y(1) + 2 * Y(2);
end
