% 8: Grafique los siguientes gráficos bi-dimensionales.

% 8.a: Grafique los valores del vector v del ejercicio anterior.
v = [1.32, -4.23, 7.25, 0.42, 9.38, -0.76, 3.54, 4.92, 2.17, -3.38];
plot(v);

% 8.b: Idem inciso anterior, pero sólo marcando los valores con un
% asterisco.
plot(v, '*');

% 8.c: Grafique los siguientes valores, tomando x como abscisas e y como
% ordenadas.
x = [0.0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0];
y = [0.00, 0.48, 0.84, 1.00, 0.91, 0.60, 0.14];
plot(x, y, 'o');

% 8.d: Grafique los valores de la función coseno desde -pi hasta pi a pasos
% de pi/10.
x = [-pi:pi/10:pi];
plot(x, cos(x));

% 8.e: Agregue una cuadrícula y un título al gráfico anterior.
grid on;
title('$\cos x$', 'interpreter', 'latex');

% 8.f: Grafique la función log(x) desde 1 hasta 20 a pasos de 0.1. Agregue
% un título al gráfico y etiquetas a los ejes.
x = [1:0.1:20];
plot(x, log(x));
title('Función logaritmo base 10');
xlabel('$x$', 'interpreter', 'latex');
ylabel('$\log x$', 'interpreter', 'latex');

% 8.g: Superponga al gráfico anterior la función y = 3x + 1 y grafique.
hold on;
plot(x, 3*x+1);
hold off;

% 8.h: Grafique la función coseno del inciso d y a un costado la función
% log x del inciso f, agregue una cuadrícula a uno de los subgráficos y al
% otro no.
cfg;
subplot(1,2,1);
x = [-pi:pi/10:pi];
plot(x, cos(x));
grid on;
subplot(1,2,2);
x = [1:0.1:20];
plot(x, log(x));