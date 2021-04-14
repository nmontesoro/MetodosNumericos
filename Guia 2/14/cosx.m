% Calculo el valor exacto
exact = cos(3*pi/4);

% Calculo las aproximaciones
n1 = CosMcLaurin(3*pi/4, 1);
n2 = CosMcLaurin(3*pi/4, 2);
n3 = CosMcLaurin(3*pi/4, 3);
n4 = CosMcLaurin(3*pi/4, 4);
n5 = CosMcLaurin(3*pi/4, 5);

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

function [cosx] = CosMcLaurin(x, n)
% CosMcLaurin Calcula la sumatoria que aproxima el coseno de x mediante un
% polinomio de McLaurin hasta el n-ésimo término.

   cosx = 0;
   for k = 0:n
      cosx = cosx + ((-1)^k*x^(2*k))/(factorial(2*k));
   end

end
