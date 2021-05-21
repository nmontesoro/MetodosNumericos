%   1.164040 (Euler simple, h = 0.04)
%   1.190364 (Euler mejorado, h = 0.04)
%   1.190476 (Runge-Kutta orden 4, h = 0.04)
%   
%   1.176876 (Euler simple, h = 0.02)
%   1.190453 (Euler mejorado, h = 0.02)
%   1.190476 (Runge-Kutta orden 4, h = 0.02)
%   
%   1.183574 (Euler simple, h = 0.01)
%   1.190471 (Euler mejorado, h = 0.01)
%   1.190476 (Runge-Kutta orden 4, h = 0.01)

f = @(t, y) 2 .* t .* y .^ 2;

for h = [0.04, 0.02, 0.01]
    Y = EDOEuler(f, [0, 0.4], h, 1);
    m = size(Y, 1);
    fprintf('%7.6f (Euler simple, h = %3.2f)\n', Y(m), h);
    Y = EDOEuler(f, [0, 0.4], h, 1, true);
    fprintf('%7.6f (Euler mejorado, h = %3.2f)\n', Y(m), h);
    Y = EDORungeKutta(4, f, [0, 0.4], h, 1);
    fprintf('%7.6f (Runge-Kutta orden 4, h = %3.2f)\n\n', Y(m), h);
end
