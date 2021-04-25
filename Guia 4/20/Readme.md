# Documentación adicional para `SistPuntoFijo.m`

La función `SistPuntoFijo` busca resolver un sistema de ecuaciones no
lineal mediante el método de Punto Fijo.

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

Si `gi` es la derivada respecto de `xi` de la función i-ésima `fi`, entonces se define `G = [g1; g2; ...; gn]`.

## Parámetros de entrada
La función `SistPuntoFijo` acepta tres parámetros: `G`, `X0` y `c`.

`G` es un *puntero* a una función que acepta un parámetro vector columna `X` y
devuelve otro vector columna con los valores de la matriz `G` ya calculados.

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

Se despejan las funciones `g1` y `g2`:

```
g1 = x^2 + y^2 - 4 + x
g2 = 1 - exp(x)
```

Con las funciones `g1` y `g2` despejadas, pasamos a definir en Matlab la
función que nos devolverá la matriz `G` evaluada en el punto `X`.

```
function G = G1(X)
    G = zeros(2, 1); % Optimiza el código
    G(1) = -(sqrt(4-X(2)^2)); % g1
    G(2) = 1 - exp(X(1)); % g2
end
```

*Observación: El parámetro de entrada `X` es un vector columna, por eso
uso `X(1)` para referirme a `x` y `X(2)` para referirme a `y`.*

Ahora consigo un *puntero* a la función `G1` que acabo de escribir:

```
G = @G1;
```

Asigno el punto inicial `X0`:

```
X0 = [ -1;
        1];
```

Y, como quiero que la función corte luego de 5 iteraciones, lo establezco en la
función anónima `c`:

```
c = @(opt) opt.n == 5;
```

Finalmente, hago el llamado a la función `SistPuntoFijo` y muestro la solución 
en pantalla mediante `fprintf`:

```
X = SistPuntoFijo(G, X0, c);
fprintf('19.1) 5 iteraciones. x = %5.4f, y = %5.4f\n', X(1), X(2));
```
