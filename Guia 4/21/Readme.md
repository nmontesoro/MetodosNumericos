# Documentación adicional para `SistNewtonRaphson.m`

La función `SistNewtonRaphson` busca resolver un sistema de ecuaciones no
lineal mediante el método de Newton-Raphson.

Sea un sistema de la forma

```
f1(x1, x2, ..., xn) = 0
f2(x1, x2, ..., xn) = 0
.
.
.
fn(x1, x2, ..., xn) = 0
```

Puede reescribirse como `F(X) = 0`, donde `F` es un vector columna de 
forma `F = [f1; f2; ...; fn]`, y `X` es también un vector columna de 
forma `X = [x1; x2; ...; xn]`.

## Parámetros de entrada
La función `SistNewtonRaphson` acepta cuatro parámetros: `F`, `J`, `X0` y `c`.

`F` es un *puntero* a una función que acepta un parámetro vector columna `X` y
devuelve otro vector columna con los valores de la matriz `F` ya calculados.

`J` es un *puntero* a una función que acepta un parámetro vector columna `X` y
devuelve otro vector columna con los valores de la matriz `J` (el *Jacobiano*
de `F`) ya calculados.

Los otros parámetros son `X0`, el punto inicial desde donde comenzar a iterar,
y `c`, una función anónima que contiene las condiciones a evaluar para dejar de 
iterar.

## Ejemplo de implementación

*Lo siguiente es un análisis del archivo `solucion.m`*

Se tiene el sistema 

```
x^2 + y^2 - 4 = 0
exp(x) + y - 1 = 0
```

Definimos en Matlab las funciones que nos devolverán las matrices `F` y `J`,
ambas evaluadas en el punto `X`.

```
function F = F1(X)
    F = zeros(2, 1);
    F(1) = X(1)^2 + X(2)^2 - 4;
    F(2) = exp(X(1)) + X(2) - 1;
end

function J = J1(X)
    J = zeros(2, 2);
    J(1, 1) = 2*X(1);
    J(1, 2) = 2*X(2);
    J(2, 1) = exp(X(1));
    J(2, 2) = 1;
end
```

*Observación: El parámetro de entrada `X` es un vector columna, por eso
uso `X(1)` para referirme a `x` y `X(2)` para referirme a `y`.*

Establezco en la función anónima `c` la condición de parada del algoritmo:

```
c = @(opt) norm(opt.X - opt.X_a) < 1e-3 || opt.n == 100;
```

Finalmente, hago el llamado a la función `SistNewtonRaphson` y muestro la solución 
en pantalla mediante `fprintf`:

```
[X1, n1] = SistNewtonRaphson(@F1, @J1, [-2; 1], c);
fprintf('%d) x = %5.4f, y = %5.4f (%d iteraciones)\n', 1, X1(1), X1(2), n1);
```
