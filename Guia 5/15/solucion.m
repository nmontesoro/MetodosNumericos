% Al medir la velocidad (por medio de un tubo de Pitot) en una tubería 
%   circular de 20 cm de díametro interior, se obtuvieron los siguientes
%   datos:

points = [ 0, 600;
           3, 550;
           4, 450;
           7, 312;
           8, 240];

% (a) Obtenga los coeficientes del polinomio aproximante de primer grado
%   65394/103
%   -4787/103
coef = CoeficientesRegresionPolinomial(points, 1);

% (b) Obtenga los coeficientes del polinomio aproximante de segundo 
%   grado.
%    5315868395418027/8796093022208
%    -302681017147109/17592186044416
%                        -21919/6158
coef = CoeficientesRegresionPolinomial(points, 2);

% (c) Grafique ambos polinomios aproximantes, junto a los valores de la
%   tabla.
p1 = FuncionRegresionPolinomial(points, 1);
p2 = FuncionRegresionPolinomial(points, 2);

figure
hold on

scatter(points(:, 1), points(:, 2), 'filled', 'DisplayName', 'Datos')
fplot(p1, 'DisplayName', '$p_1(x)$')
fplot(p2, 'DisplayName', '$p_2(x)$')
xlim([-2, 10])
ylim([140, 700])
legend('Interpreter', 'latex')

hold off

% (d) Calcule el valor de la velocidad correspondiente a r = 4 cm para
%   ambas soluciones.
% d) p1(4) = 448.99, p2(4) = 478.57
v1 = double(subs(p1, 4));
v2 = double(subs(p2, 4));
fprintf('d) p1(4) = %5.2f, p2(4) = %5.2f\n', v1, v2)

% (e) Calcule el error y la varianza de la regresión para ambas 
%   soluciones.
%   e) err1 = 4731.4757, var1 = 1577.1586
%      err2 = 1701.6018, var2 = 850.8009
values1 = subs(p1, points(:, 1));
values2 = subs(p2, points(:, 1));
err1 = ErrorRegresion(points, values1, 1);
var1 = ErrorRegresion(points, values1, 1, 'varianza');
err2 = ErrorRegresion(points, values2, 2);
var2 = ErrorRegresion(points, values2, 2, 'varianza');
fprintf('e) err1 = %5.4f, var1 = %5.4f\n   err2 = %5.4f, var2 = %5.4f\n', ...
        err1, var1, err2, var2)

% (f) En función del error, ¿cuál de las dos soluciones es preferible?
% (e) En función de la varianza, ¿cuál de las dos soluciones es 
%   preferible?
% En ambos casos es preferible el polinomio de segundo grado.
