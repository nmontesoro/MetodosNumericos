% Mediante la fórmula para el cálculo del error de Simpson 1/3 determino
%   que h debe ser menor que 0.625. Luego tomo h = 0.5 y, como 
%   h = (b - a) / n, n = 28 subintervalos.
% La respuesta es 4.355988847 s (err. abs.: 0.000031614).
% El n mínimo es 12 subintervalos (!!)

m = 10;
vi = 19;
vf = 5;
n = 28;
f = @(v) m ./ (-v .* sqrt(v));

val = IntegracionSimpson(f, 'a', vi, 'b', vf, 'n', 28);

err_abs = abs(val - 4.355957233); % Calculado analíticamente

fprintf('La respuesta es %11.9f s (err. abs.: %11.9f).\n', val, err_abs);

for i = 2:2:28
    val = IntegracionSimpson(f, 'a', vi, 'b', vf, 'n', i);
    err_abs = abs(val - 4.355957233); % Calculado analíticamente
    if err_abs < 1e-3
        fprintf('n mínimo: %d.\n', i);
        break;
    end
end
