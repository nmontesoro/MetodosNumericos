% Copio la matriz Z del ejercicio 4.
Z = [   3,  12,   8,   9,  17;
       28,  37,  66,  21,  57;
       42,  11,   0, -25,  23;
       72, -24,  75,  68,  -9;
       63,  27, -43,  23,  77];

% 5.a: Un vector fila cuyos elementos varían desde 1.5 a 3.0 a pasos de
% 0.25.
[1.5:0.25:3.0];

% 5.b: Un vector fila cuyos elementos varían desde -2.0 a 1.0 a pasos de
% 0.3.
[-2.0:0.3:1.0];

% 5.c: Un vector fila de cinco elementos cuyos valores varían desde 1.76
% hasta -0.3.
[1.76:(-.3-1.76)/4:-0.3]; % linspace(1.76,-0.3,5) es más legible.

% 5.d: Un vector columna cuyos elementos pertenecen a la tercer fila de la
% matriz Z del ejercicio anterior.
Z(3,:)';

% 5.e: Un vector fila cuyos elementos pertenecen a los elementos pares
% (posición par) de la cuarta columna de la matriz Z del ejercicio
% anterior, pero en orden inverso.
Z([4:-2:1],4)';