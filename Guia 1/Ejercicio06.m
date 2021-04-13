M = [0.95, 0.76, 0.62, 0.40, 0.06;
0.23, 0.45, 0.79, 0.94, 0.35;
0.60, 0.02, 0.92, 0.92, 0.81;
0.49, 0.82, 0.74, 0.41, 0.01;
0.89, 0.44, 0.18, 0.89, 0.14];

% 6.a: Multiplique la matriz M cinco veces por sí misma.
M*M*M*M*M;

% 6.b: Multiplique los elementos de M por sí mismos cinco veces.
M.*M.*M.*M.*M;

% 6.c: Eleve la matriz M a la quinta potencia.
M^5;

% 6.d: Eleve los elementos de M a la quinta potencia.
M.^5;

% 6.e: Reste el valor obtenido en el inciso c del obtenido en el inciso a.
% El resultado obtenido concuerda con lo esperado? Por qué?
M*M*M*M*M-M^5;
% No concuerda por valores infinitesimales, debido a la forma que tiene la
% computadora de almacenar valores en memoria.

% 6.f: Obtenga la raíz cuadrada W de la matriz Z del ejercicio 4 (W*W=Z).
Z = [   3,  12,   8,   9,  17;
       28,  37,  66,  21,  57;
       42,  11,   0, -25,  23;
       72, -24,  75,  68,  -9;
       63,  27, -43,  23,  77];
W = Z^(1/2);

% 6.g: Obtenga la matriz traspuesta del inciso anterior. Concuerda con lo
% esperado?
W';
% No concuerda porque el operador  '  intercambia los signos de la parte
% imaginaria de los números complejos. Para obtener el resultado esperado
% habría que utilizar el operador  .'  .