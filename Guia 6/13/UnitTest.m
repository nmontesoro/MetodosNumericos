f = @(x) x.^4;
X = [0:6:96];
Y = [37.2, 40.2, 44.4, 46.8, 44.1, 39.9, 36.3, 32.7, 29.7, 25.5, 23.4, 26.7, ...
     31.2, 34.8, 36.9, 38.7, 39.6];
points = [X.', Y.'];
err_abs = @(x, y) abs(x - y);

%% Test 1: Ejemplo de cátedra
% Calcular la integral de x^4 entre x = -1 y x = 1 hasta obtener R3,3
R11 = IntegracionRomberg(f, 1, 1, -1, 1);
R21 = IntegracionRomberg(f, 2, 1, -1, 1);
R22 = IntegracionRomberg(f, 2, 2, -1, 1);
R31 = IntegracionRomberg(f, 3, 1, -1, 1);
R32 = IntegracionRomberg(f, 3, 2, -1, 1);
R33 = IntegracionRomberg(f, 3, 3, -1, 1);

assert(R11 == 2);
assert(R21 == 1);
assert(R22 == 2/3);
assert(R31 == 9/16);
assert(R32 == 5/12);
assert(R33 == 2/5);

%% Test 2: Ejercicio 12.a hasta R33
R11 = IntegracionRomberg(points(1:5, :), 1, 1);
R21 = IntegracionRomberg(points(1:5, :), 2, 1);
R22 = IntegracionRomberg(points(1:5, :), 2, 2);
R31 = IntegracionRomberg(points(1:5, :), 3, 1);
R32 = IntegracionRomberg(points(1:5, :), 3, 2);
R33 = IntegracionRomberg(points(1:5, :), 3, 3);

assert(err_abs(R11, 975.6) < 1e-6);
assert(err_abs(R21, 1020.6) < 1e-6);
assert(err_abs(R22, 1035.6) < 1e-6);
assert(err_abs(R31, 1032.3) < 1e-6);
assert(err_abs(R32, 1036.2) < 1e-6);
assert(err_abs(R33, 1036.24) < 1e-6);

%% Test 3: Ejercicio 12.b hasta R22. R31 debería requerir al menos f(9).
errored = false;

R11 = IntegracionRomberg(points(1:7, :), 1, 1);
R21 = IntegracionRomberg(points(1:7, :), 2, 1);
R22 = IntegracionRomberg(points(1:7, :), 2, 2);

try
    R31 = IntegracionRomberg(points(1:7, :), 3, 1);    
catch
    errored = true;
end

assert(err_abs(R11, 1323) < 1e-6);
assert(err_abs(R21, 1503.9) < 1e-6);
assert(err_abs(R22, 1564.2) < 1e-6);
assert(errored);

%% Test 4: Comprobación de condiciones iniciales
errored = false;

try
    % Cantidad de puntos
    val = IntegracionRomberg([], 6, 4);
catch
    errored = true;
end

try
    % i debe ser <= j
    val = IntegracionRomberg([], 4, 5);
catch
    errored = errored && true;
end

assert(errored);
