% Dada la ED u" = u, con u(1) = 1.175201 y u(3) = 10.017875

% (a) Resolver por el método de las diferencias finitas, usando h = 1 y
%   h = 0.5
X1 = ResolverPVF([1, 3], 1, [1.175201, 10.017875], 'dif_finitas', ...
     'coef', {@(x) 1, @(x) 0, @(x) -1});

X2 = ResolverPVF([1, 3], 0.5, [1.175201, 10.017875], 'dif_finitas', ...
     'coef', {@(x) 1, @(x) 0, @(x) -1});

% (b) Comparar la solución obtenida en todos los puntos con la solución
%   analítica u = sh(x)
% El error promedio con h =   1 es 0.03472
% El error promedio con h = 0.5 es 0.01440
Xe1 = sinh([1:1:3]);
Xe2 = sinh([1:0.5:3]);

err = @(X, Xe) abs(Xe.' - X(:, 2));
err1 = err(X1, Xe1);
err2 = err(X2, Xe2);

fprintf('El error promedio con h =   1 es %6.5f\n', mean(err1));
fprintf('El error promedio con h = 0.5 es %6.5f\n', mean(err2));

figure
hold on

plot(X1(:, 1), X1(:, 2), '--x', 'DisplayName', '$h = 1$')
plot(X2(:, 1), X2(:, 2), '--x', 'DisplayName', '$h = 0.5$')
fplot(@(X) sinh(X), [1, 3], '-', 'DisplayName', "Anal\'itico")
legend('interpreter', 'latex', 'location', 'northwest')

hold off

% (c) ¿En qué punto x se genera el mayor error absoluto respecto de la 
%   solución analítica?
% El mayor error absoluto con h =   1 se da en x = 2.00000 (0.10416)
% El mayor error absoluto con h = 0.5 se da en x = 2.00000 (0.02802)
% No sé si pide esto, con los puntos que acabo de generar, o con toda la
%   función generada. Si fuera este último caso, gráficamente me doy 
%   cuenta que el mayor error absoluto se comete en x = 2.5 (h = 1) y en
%   x = 2.75 (h = 0.5).
[err_max_1, i1] = max(err1);
[err_max_2, i2] = max(err2);

fprintf('El mayor error absoluto con h =   1 se da en x = %6.5f (%6.5f)\n', ...
        X1(i1, 1), err_max_1)
fprintf('El mayor error absoluto con h = 0.5 se da en x = %6.5f (%6.5f)\n', ...
        X2(i2, 1), err_max_2)

% (d) ¿Cómo se comporta el error con respecto a la disminución por la 
%   mitad del intervalo h (en el punto x = 2)?
% Se reduce en un 73% aproximadamente.
