% Dado el sistema de ecuaciones lineales de los ejercicios 1, 3, 4 y 5,
%   calcule:
%       (a) Determinante de A
%       (b) Inversa de A
%       (c) Número de condición de A
%       (d) Qué conclusiones saca de los resultados obtenidos?
%
% Solución:
%
%   Ejercicio 1
%   Determinante: -24
%   Número de condición: 82.5 --> Muy grande; mal condicionado
%   Inversa: 
%       0.1250   -0.2083    0.0833
%      -0.2500   -2.2500    1.5000
%       0.1250    2.1250   -1.2500
%   ------------------------------
%   Ejercicio 3
%   Determinante: 1.1102e-15 --> Muy cercano a cero (analíticamente
%       es 0, error de almacenamiento) --> No es inversible
%   Número de condición: 2.882303761517117e+17 --> Extremadamente grande
%   Inversa: 
%      1.0e+15 *
%      -2.7022    4.5036   -1.8014
%       5.4043   -9.0072    3.6029
%      -2.7022    4.5036   -1.8014
%   ------------------------------
%   Ejercicio 4
%   Determinante: -7
%   Número de condición: 50
%   Inversa: 
%       1.0000    0.1429    3.0000
%            0    0.1429    1.0000
%            0         0   -1.0000
%   ------------------------------
%   Ejercicio 5
%   Determinante: -7
%   Número de condición: 18 --> 18 << 100, está bien condicionada
%   Inversa: 
%      -0.5714    0.7143    1.0000
%      -1.0000    1.0000    1.0000
%       0.8571   -0.5714   -1.0000

format compact

% 1 --------------------------------------------------------------------
A = [ 9, 2, 3;
      3, 4, 5;
      6, 7, 8];
dispFormatted(1, A);

% 3 --------------------------------------------------------------------
A = [ 1, 2, 3;
      3, 4, 5;
      6, 7, 8];
dispFormatted(3, A);

% 4 --------------------------------------------------------------------
A = [  1, -1,  2;
       0,  7,  7;
       0,  0, -1];
dispFormatted(4, A);

% 5 --------------------------------------------------------------------
A = [  3, -1,  2;
       1,  2,  3;
       2, -2, -1];
dispFormatted(5, A);

format

function dispFormatted(inciso, A)
    determ = det(A);
    invers = inv(A);
    condic = cond(A, 1);
    disp(['Ejercicio ', num2str(inciso)]);
    disp(['Determinante: ', num2str(determ)]);
    disp(['Número de condición: ', num2str(condic)]);
    disp(['Inversa: ']);
    disp(invers);
    disp('------------------------------');
end