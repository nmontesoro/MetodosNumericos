%   1.375000 (Euler simple, h = 1.00)
%   1.732422 (Euler mejorado, h = 1.00)
%   1.670186 (Runge-Kutta orden 4, h = 1.00)
%   
%   1.533936 (Euler simple, h = 0.50)
%   1.682121 (Euler mejorado, h = 0.50)
%   1.669431 (Runge-Kutta orden 4, h = 0.50)
%   
%   1.604252 (Euler simple, h = 0.25)
%   1.672269 (Euler mejorado, h = 0.25)
%   1.669393 (Runge-Kutta orden 4, h = 0.25)


f = @(t, y) (t - y) / 2;

for h = [1, 0.5, 0.25]
    Y = EDOEuler(f, [0, 3], h, 1);
    m = size(Y, 1);
    fprintf('%7.6f (Euler simple, h = %3.2f)\n', Y(m), h);
    Y = EDOEuler(f, [0, 3], h, 1, true);
    fprintf('%7.6f (Euler mejorado, h = %3.2f)\n', Y(m), h);
    Y = EDORungeKutta(4, f, [0, 3], h, 1);
    fprintf('%7.6f (Runge-Kutta orden 4, h = %3.2f)\n\n', Y(m), h);
end
