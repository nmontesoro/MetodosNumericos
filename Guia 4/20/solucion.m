% Solución:
%
% 19.1) 5 iteraciones. x = -1.8158, y = 0.8364
% 20.1.a) 6 iteraciones necesarias. x = -1.8167, y = 0.8373
%
% Según el análisis hecho a mano, 19.2 no converge mediante punto fijo
%   (al menos no con el despeje propuesto) y 19.3 no parece tener
%   solución mediante punto fijo.

% 19.1: Según el análisis, punto fijo converge (en una de las 
%   soluciones) para X0 = [-1; 1]
G = @G1;
X0 = [ -1;
        1];
c = @(opt) opt.n == 5;
X = SistPuntoFijo(G, X0, c);
fprintf('19.1) 5 iteraciones. x = %5.4f, y = %5.4f\n', X(1), X(2));

% ------ No había visto los incisos (a) y (b)

c = @(opt) norm(opt.X - opt.X_a, inf) < 1e-3;
[X, n] = SistPuntoFijo(G, X0, c);
fprintf('20.1.a) %d iteraciones necesarias. x = %5.4f, y = %5.4f\n', n, ...
        X(1), X(2));


function G = G1(X)
    G = zeros(2, 1);
    G(1) = -(sqrt(4-X(2)^2));
    G(2) = 1 - exp(X(1));
end