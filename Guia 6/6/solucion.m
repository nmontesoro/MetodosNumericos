% b) 1514.0250
% c) 3181.2750

X = [0:6:96];
Y = [37.2, 40.2, 44.4, 46.8, 44.1, 39.9, 36.3, 32.7, 29.7, 25.5, 23.4, 26.7, ...
     31.2, 34.8, 36.9, 38.7, 39.6];
points = [X.', Y.'];

% (b) Desde t = 0 hasta t = 36 s
ej2 = IntegracionSimpson(points(1:7, :), 'metodo', 3/8);

% (c) Desde t = 0 hasta t = 90 s
ej3 = IntegracionSimpson(points(1:16, :), 'metodo', 3/8);

fprintf('b) %5.4f\nc) %5.4f\n', ej2, ej3);
