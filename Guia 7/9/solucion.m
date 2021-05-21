% Un proyectil de masa m = 0.11 kg se lanza verticalmente hacia arriba
%   con una velocidad inicial de 80 m/s (...) La ED que rige la 
%   velocidad del proyectil es (...). Calcule por medio de Euler 
%   mejorado los diferentes valores de velocidad que toma el proyectil
%   hasta alcanzar su altura máxima. Considere g = 9.8 m/s^2 y 
%   k = 0.002 kg/m

g = 9.8;
k = 0.002;
m = 0.11;
v0 = 80;
f = @(t, v) - g - k ./ m .* v .^ 2;

% No sé cómo calcular tf. Lo aproximé primero y resulta que un valor 
%   cercano es tf = 3.00 s

% (a) Utilice un paso h = 0.1 s
[V, T] = EDOEuler(f, [0, 3], 0.1, v0, true);

% (b) Compare con los resultados obtenidos con h = 0.01 s

%  t      v (0.1)  v (0.01)  diff
%  0.00   80.000   80.000    0.000
%  0.10   69.074   68.981    0.093
%  0.20   60.547   60.419    0.128
%  0.30   53.690   53.552    0.138
%  0.40   48.041   47.905    0.136
%  0.50   43.293   43.163    0.130
%  0.60   39.233   39.111    0.122
%  0.70   35.711   35.598    0.113
%  0.80   32.616   32.512    0.105
%  0.90   29.867   29.770    0.097
%  1.00   27.400   27.310    0.090
%  1.10   25.167   25.084    0.084
%  1.20   23.129   23.051    0.078
%  1.30   21.255   21.182    0.073
%  1.40   19.520   19.452    0.068
%  1.50   17.904   17.840    0.064
%  1.60   16.390   16.330    0.061
%  1.70   14.963   14.906    0.057
%  1.80   13.612   13.558    0.054
%  1.90   12.326   12.275    0.052
%  2.00   11.097   11.047    0.050
%  2.10    9.916    9.868    0.048
%  2.20    8.777    8.731    0.046
%  2.30    7.674    7.629    0.044
%  2.40    6.601    6.558    0.043
%  2.50    5.553    5.511    0.042
%  2.60    4.527    4.486    0.041
%  2.70    3.517    3.477    0.040
%  2.80    2.520    2.481    0.039
%  2.90    1.532    1.493    0.039
%  3.00    0.549    0.511    0.038

A = [T V];
V = EDOEuler(f, [0, 3], 0.01, v0, true);
A = [A V(1:10:301)];
dif = @(X, Y) abs(X - Y);
A = [A dif(A(:, 2), A(:, 3))];

fprintf('t      v (0.1)  v (0.01)  diff\n');
for i = 1:size(A, 1)
    fprintf('%3.2f   %6.3f   %6.3f   %6.3f\n', A(i, 1), A(i, 2), A(i, 3), ...
           A(i, 4));
end
