% a) 1036.2000
% b) 1516.2000
% c) n impar!

X = [0:6:96];
Y = [37.2, 40.2, 44.4, 46.8, 44.1, 39.9, 36.3, 32.7, 29.7, 25.5, 23.4, 26.7, ...
     31.2, 34.8, 36.9, 38.7, 39.6];
points = [X.', Y.'];

% (a) Desde t = 0 hasta t = 24 s
ej1 = IntegracionSimpson(points(1:5, :));

% (b) Desde t = 0 hasta t = 36 s
ej2 = IntegracionSimpson(points(1:7, :));

% (c) Desde t = 0 hasta t = 90 s
% ej3 = IntegracionSimpson(points(1:16, :));
% No se puede: n es impar

% Muestro los resultados:
fprintf('a) %5.4f\nb) %5.4f\nc) n impar!\n', ej1, ej2);
