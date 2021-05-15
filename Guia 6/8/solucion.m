% a) 0.430963953 (err. abs.: 0.000000453)
% b) n = 1876. 0.666665668 (err. abs.: 0.000000999)

% a) Calculé n = 6
f = @(x) sqrt(x);
val = IntegracionSimpson(f, 'a', 0.5, 'b', 1, 'n', 6);
err_abs = abs(val - 0.4309644063);
fprintf('a) %11.9f (err. abs.: %11.9f)\n', val, err_abs);

% b) No se puede calcular n (la derivada tiende a infinito). Lo hago a
%   lo bruto y obtengo n = 1876:
for i = 2:2:2000
    val = IntegracionSimpson(f, 'a', 0, 'b', 1, 'n', i);
    err_abs = abs(val - 2/3);
    if err_abs < 1e-6
        fprintf('b) n = %d. %11.9f (err. abs.: %11.9f)\n', i, val, err_abs);
        break;
    end
end
