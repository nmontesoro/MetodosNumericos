%2a: La matriz C a partir de la matriz A.
C = A(:,1:2);

%2b: El producto matricial A*A.
M = A*A;

%2c: Una matriz cuyos valores sean el cuadrado de los valores de los
%elementos de A.
A.^2; %. es elemento por elemento. Tambien bsxfun().

%2d: El vector d a partir de la matriz A, usando operador ":".
d = A(2,:);

%2e: El vector t a partir de la matriz C.
t = flipud(C(:,2))'; %flipUpDown - Tambien esta fliplr.

%2f: Una matriz diagonal M a partir de la matriz A, conteniendo en la
%diagonal los mismos elementos de la diagonal de A (con una sola linea)
M = diag(diag(A));
% el primer llamado a diag devuelve un vector columna con los elementos de
% la diagonal de la matriz. El segundo llamado crea la matriz diagonal 
% en base a esos elementos.

%2g: Una matriz triangular inferior M a partir de la matriz A.
M = tril(A);
% tril: triangularLower; triu: triangularUpper

%2h: Una matriz cuadrada M con los elementos de C en las dos primeras
%columans, los elementos de b en la tercera columna, y los elementos de D
%en la ultima columna.
M = [C b d'];
% hay que transponer d porque es un vector fila.