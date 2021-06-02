% Dado el problema
%   u" - (1 - x/5)u = x
% con u(1) = 2, u(4) = -1 y h = 1
%
% (a) Resolver usando el método del disparo
f = @(X) X(3);
g = @(X) X(1) + (1 - X(1) / 5) * X(2);
X = ResolverPVF([1, 4], 1, [2, -1], 'disparo', 'f', {f, g}, ...
    'metodo_integracion', 'euler')
    
%         x         u        u'
%    1.0000    2.0000   -3.1667
%    2.0000   -1.1667   -0.5667
%    3.0000   -1.7333    0.7333
%    4.0000   -1.0000    3.0400

% (b) Resolver usando diferencias finitas
f = @(X) X;
X = ResolverPVF([1, 4], 1, [2, -1], 'dif_finitas', 'f', f, 'coef', ...
    {@(x) 1, @(x) 0, @(x) -(1 - x / 5)})

%         x         u
%    1.0000    2.0000
%    2.0000   -0.7634
%    3.0000   -1.9847
%    4.0000   -1.0000
