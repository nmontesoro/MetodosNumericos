X = [0:6:96];
Y = [37.2, 40.2, 44.4, 46.8, 44.1, 39.9, 36.3, 32.7, 29.7, 25.5, 23.4, 26.7, ...
     31.2, 34.8, 36.9, 38.7, 39.6];

a1 = IntegracionTrapecios('points', [X(1:5).', Y(1:5).'], 'n', 1);
b1 = IntegracionTrapecios('points', [X(1:7).', Y(1:7).'], 'n', 1);
c1 = IntegracionTrapecios('points', [X(1:16).', Y(1:16).'], 'n', 1);
d1 = IntegracionTrapecios('points', [X.', Y.'], 'n', 1);

fprintf('n = 1) %5.2f %5.2f %5.2f %5.2f\n', a1, b1, c1, d1);

a2 = IntegracionTrapecios('points', [X(1:5).', Y(1:5).']);
b2 = IntegracionTrapecios('points', [X(1:7).', Y(1:7).']);
c2 = IntegracionTrapecios('points', [X(1:16).', Y(1:16).']);
d2 = IntegracionTrapecios('points', [X.', Y.']);

fprintf('n = n) %5.2f %5.2f %5.2f %5.2f\n', a2, b2, c2, d2);

if any(abs([a1 b1 c1 d1 a2 b2 c2 d2] - ...
     [975.6 1323 3415.5 3686.4 1032.3 1512.9 3183.3 3418.2]) > 1e-6)
     fprintf('Algo salió mal!\n')
else
     fprintf('Todas las pruebas se completaron correctamente.\n')
end