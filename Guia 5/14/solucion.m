% (a) A partir de los datos del ejercicio 6 obtenga la aproximación de
%   mínimos cuadrados para valores de n = 1, 2, ..., m - 1.
points = [  1,  56.5;
            2,  78.6;
            5, 113.0;
           10, 144.5;
           20, 181.0;
           30, 205.0;
           40, 214.5];

% n = size(points, 1);
% syms p(x)

% figure
% hold on

% scatter(points(:, 1), points(:, 2), 'filled', 'DisplayName', 'Datos');

% for i = 1:n - 1
%     p = FuncionRegresionPolinomial(points, i);
%     values = double(subs(p, x, points(:, 1)));
%     varianza = ErrorRegresion(points, values, i, 'varianza');
%     %fplot(p, 'DisplayName', ...
%     %      sprintf('$p_{%d}(x)\\ (\\sigma^2 = %4.3f)$', i, varianza));
%     fprintf('%d) Varianza = %5.4f\n', i, varianza);
% end

% legend('Interpreter', 'latex', 'Location', 'northwest')
% hold off
% xlim([-10, 50])
% ylim([40, 300])

% (b) ¿Cuál de ellas es la aproximación de mínimos cuadrados de varianza 
%   mínima?
% p_5(x)

% (c) Compare la curva obtenida, para la aproximación de varianza mínima,
%   con la correspondiente a la solución del ejercicio 6.

syms p(x) pl(x)

p = FuncionRegresionPolinomial(points, 5);
pl = CalcPolinomioLagrange(points);

fplot(p, 'r', 'DisplayName', '$p_5(x)$');
hold on
fplot(pl, 'b', 'DisplayName', '$p_L(x)$');
scatter(points(:, 1), points(:, 2), 'filled', 'DisplayName', 'Datos')
legend('Interpreter', 'latex', 'Location', 'northwest')
xlim([0, 41])
ylim([50, 300])

% El polinomio se ajusta mucho mejor a los puntos dados, comparado con 
%   el polinomio de Lagrange calculado en (6).
