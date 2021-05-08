points = [ 10, 0.63;
           60, 1.36;
           80, 2.18;
          100, 3.00;
          120, 3.93;
          140, 6.22;
          160, 8.59];

% (a) Calcule los coeficientes del polinomio interpolante de Newton 
%   usando diferencias divididas.
disp('Coeficientes - inciso (a):')
CoeficientesPolinomioNewton(points)

% No tengo ganas de armar el polinomio manualmente...
syms p(x)
p(x) = CalcPolinomioNewton(points);

% (b) Grafique el mismo y calcule la pérdida que sufre el motor cuando 
%   se le aplica una tensión e = 90 V.
fplot(p, [points(1, 1), points(7, 1)]);
hold on
scatter(points(:, 1), points(:, 2));
xlabel('e (V)');
ylabel('p (kW)');
perdida = double(p(90));
fprintf('p(90 V) = %3.2f\n', perdida);
