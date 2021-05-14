f = @(x) sin(x) .^ 2;
g = @(x) exp(-x .^ 2);
err_abs = @(x, y) abs(x - y);
X = [0:6:96];
Y = [37.2, 40.2, 44.4, 46.8, 44.1, 39.9, 36.3, 32.7, 29.7, 25.5, 23.4, 26.7, ...
     31.2, 34.8, 36.9, 38.7, 39.6];
points = [X.', Y.'];

%% Test 1: Integracion de funciones - ejemplos de filminas
s13sf = IntegracionSimpson(f, 0, pi/3);
assert(err_abs(s13sf, 0.3054326) < 1e-6, 'Simpson 1/3 simple con función');

s38sf = IntegracionSimpson(f, 0, pi/3, 'metodo', 3/8);
assert(err_abs(s38sf, 0.3063656) < 1e-6, 'Simpson 3/8 simple con función');

s13cf = IntegracionSimpson(f, 'a', 0, 'b', pi/3, 'n', 6);
assert(err_abs(s13cf, 0.3070743) < 1e-6, 'Simpson 1/3 compuesto con función');

s38cf = IntegracionSimpson(f, 'a', 0, 'b', pi/3, 'n', 6, 'metodo', 3/8);
assert(err_abs(s38cf, 0.3070510) < 1e-6, 'Simpson 3/8 compuesto con función');

%% Test 2: Integracion de funciones - ejemplo de catedra
s13sf = IntegracionSimpson(g, 'a', -1, 'b', 1);
assert(err_abs(s13sf, 1.5786) < 1e-4, ...
    'Simpson 1/3 simple con función - cátedra');

s13cf = IntegracionSimpson(g, 'a', -1, 'b', 1, 'n', 4);
assert(err_abs(s13cf, 1.4943) < 1e-4, ...
    'Simpson 1/3 compuesto con función - cátedra (n = 4)');

s13cf = IntegracionSimpson(g, 'a', -1, 'b', 1, 'n', 100);
assert(err_abs(s13cf, 1.4936) < 1e-4, ...
    'Simpson 1/3 compuesto con función - cátedra (n = 100)');

%% Test 3: Integracion mediante puntos
s13cp = IntegracionSimpson(points(1:5, :));
assert(err_abs(s13cp, 1036.2) < 1e-6, 'Simpson 1/3 compuesto con puntos');

s38cp = IntegracionSimpson(points(1:7, :), 'metodo', 3/8);
assert(err_abs(s38cp, 1514.025) < 1e-6, 'Simpson 3/8 compuesto con puntos');

%% Test 4: Integracion de funciones - internet

% Sacado de https://www.aprendematematicas.org.mx/unit/integracion-aproximada-regla-simpson/
ej = IntegracionSimpson(@(x) 1 ./ x, 'a', 1, 'b', 2, 'n', 10);
assert(err_abs(ej, 0.693150) < 1e-6);

% Sacado de https://www.slideshare.net/LuisAguilarCruz/regla-de-simpson-tres-octavos
ej = IntegracionSimpson(@(x) 1 ./ x, 'a', 2, 'b', 7, 'metodo', 3/8);
assert(err_abs(ej, 1.26471) < 1e-5);

% Sacado de Chapra, ejemplo 21.4
f = @(x) 0.2 + 25.*x - 200.*x.^2 + 675.*x.^3 - 900.*x.^4 + 400.*x.^ 5;
ej = IntegracionSimpson(f, 'a', 0, 'b', 0.8);
assert(err_abs(ej, 1.367467) < 1e-6);

% ejemplo 21.5
ej = IntegracionSimpson(f, 'a', 0, 'b', 0.8, 'n', 4);
assert(err_abs(ej, 1.623467) < 1e-6);

% ejemplo 21.6 con n = 3 (simple)
ej = IntegracionSimpson(f, 'a', 0, 'b', 0.8, 'metodo', 3/8);
assert(err_abs(ej, 1.519170) < 1e-6);

% ejemplo 21.6
ej = IntegracionSimpson(f, 'a', 0, 'b', 0.32);
ej = ej + IntegracionSimpson(f, 'a', 0.32, 'b', 0.8, 'metodo', 3/8);
assert(err_abs(ej, 1.645077) < 1e-6);
