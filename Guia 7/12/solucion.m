f = @(X) X(3);
g = @(X) X(1) + (1 - X(1) / 5) * X(2);
X = ResolverPVF([1, 4], 1, [2, -1], 'disparo', 'f', {f, g}, ...
    'metodo_integracion', 'euler')

% TODO: Documentar y agregar la solución del inciso (b)
