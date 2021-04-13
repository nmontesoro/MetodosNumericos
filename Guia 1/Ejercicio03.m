%3.a: Una matriz nula de 7x3 elementos.
zeros(7,3);

%3.b: Una matriz identidad de orden 5.
eye(5);

%3.c: Una matriz de tamano 4x6 con todos sus elementos iguales a 1.
ones(4,6);

%3.d: Una matriz de orden 6 cuyos elementos sean valores enteros
%pseudo-aleatorios entre -23 y 57, con distribucion uniforme.
randi([-23,57],6)

%3.e: Una matriz de tamano 3x8 cuyos elementos sean positivos obtenidos a
%partir de un generador de numeros pseudo-aleatorios con distribucion
%normal.
abs(randn(3,8))

%3.f: Una matriz de Hilbert de orden 9.
hilb(9)

%3.g: Una matriz de orden 7 con la propiedad que la suma de todas sus filas
%es igual a la suma de todas sus columnas. Usar la matriz magica y
%compruebe que cumple con las propiedades.
M = magic(7);
if sum(sum(M)) == sum(sum(M'))
    disp(['Es una matriz magica'])
else
    disp(['No es una matriz magica'])
end
% sum devuelve un vector fila con la suma de las columnas de la matriz. Si
% se usa la traspuesta, el vector contiene la suma de las filas de la
% matriz.