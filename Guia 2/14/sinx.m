% Calculo el valor exacto
exact = sin(3*pi/4);

% Calculo las aproximaciones
n1 = SinMcLaurin(3*pi/4, 1);
n2 = SinMcLaurin(3*pi/4, 2);
n3 = SinMcLaurin(3*pi/4, 3);
n4 = SinMcLaurin(3*pi/4, 4);
n5 = SinMcLaurin(3*pi/4, 5);

% Calculo los errores y los muestro al usuario
ea1 = abs(exact - n1)
er1 = ea1 / abs(exact)
ea2 = abs(exact - n2)
er2 = ea2 / abs(exact)
ea3 = abs(exact - n3)
er3 = ea3 / abs(exact)
ea4 = abs(exact - n4)
er4 = ea4 / abs(exact)
ea5 = abs(exact - n5)
er5 = ea5 / abs(exact)

function [sinx] = SinMcLaurin(x, n)
% SinMcLaurin Calcula la sumatoria que aproxima el seno de x mediante un
% polinomio de McLaurin hasta el n-ésimo término.

   sinx = 0;
   for k = 1:n
      sinx = sinx + ((-1)^(k-1)*x^(2*k-1))/(factorial(2*k-1));
   end

end
