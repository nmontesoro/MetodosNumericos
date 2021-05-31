# ResolverEDO
Ésta función permite resolver una ecuación diferencial ordinaria (o un sistema
de ecuaciones diferenciales ordinarias).

## Cómo se usa
Lo "complicado" es la definición de las funciones. `ResolverEDO` le pasa un
vector a cada función que conforma el sistema de ecuaciones, por lo que la 
sintaxis queda un poco incómoda (aunque te terminás acostumbrando). 
**El primer componente del vector es el valor de la variable independiente.**

Por ejemplo, si se tiene una ecuación diferencial de la forma 
`dy/dx = f(x, y) = 2*x + y`, el código para definir la función `f` quedaría:

```
f = @(X) 2 * X(1) + X(2);
```

## Ejemplos
### Ecuación diferencial
Para resolver el ejercicio 1 de la guía 7, se utiliza el siguiente código:

```
f = @(X) 2 * X(1) * X(2) ^ 2;
X = ResolverEDO({f}, [0, 0.4], 0.04, [1], 'euler')
```

Y la solución es:

| x   | y   |
| --- | --- |
| 0.00000 | 1.00000 |
| 0.04000 | 1.00000 |
| 0.08000 | 1.00320 |
| 0.12000 | 1.00964 |
| 0.16000 | 1.01943 |
| 0.20000 | 1.03273 |
| 0.24000 | 1.04979 |
| 0.28000 | 1.07095 |
| 0.32000 | 1.09664 |
| 0.36000 | 1.12743 |
| **0.40000** | **1.16404** |

### Sistema de ecuaciones
Para resolver el ejercicio 10 de la guía 7 por Runge-Kutta de orden 4, se 
utiliza el siguiente código:

```
% Ojo! El primer componente del vector X que se le pasa a estas funciones es la
% variable independiente (en este caso, t)
f = @(X) X(2) + 2 * X(3);
g = @(X) 3 * X(2) + 2 * X(3);

% No hace falta especificar el método, ya que Runge-Kutta de orden 4 es el que 
% se utiliza por defecto
X = ResolverEDO({f, g}, [0, 0.2], 0.02, [6, 4])
```

El resultado es:

| t | x | y |
| --- | --- | --- |
| 0.00000 | 6.00000 | 4.00000 |
| 0.02000 | 6.29355 | 4.53932 |
| 0.04000 | 6.61562 | 5.11949 |
| 0.06000 | 6.96853 | 5.74397 |
| 0.08000 | 7.35474 | 6.41653 |
| 0.10000 | 7.77697 | 7.14127 |
| 0.12000 | 8.23814 | 7.92260 |
| 0.14000 | 8.74141 | 8.76532 |
| 0.16000 | 9.29021 | 9.67460 |
| 0.18000 | 9.88827 | 10.65606 |
| **0.20000** | **10.53962** | **11.71578** |

### Ecuación diferencial de orden 2
#### Euler
El ejemplo dado por la cátedra consiste en calcular `y(0.6)`, siendo la 
ecuación diferencial `y'' + 5xy' - y = 20x`, utilizando un paso `h = 0.2`, 
mediante el método de Euler.

Siguiendo ese ejemplo, se define `u = y'`, por lo que `u' = du/dx = y''` y se
conforma el siguiente sistema de ecuaciones diferenciales:

```
u' = 20x - 5xu + y = f_1(x, y, u)
y' = u = f_2(x, y, u)
```

En Matlab, se definirían las funciones de esta manera:

```
f_1 = @(X) 20 * X(1) - 5 * X(1) * X(3) + X(2);
f_2 = @(X) X(3);
```

Y se resuelve con el siguiente comando:

```
X = ResolverEDO({f_2, f_1}, [0, 0.6], 0.2, [0, 2], 'euler')
```

Nótese que cambia el orden de F `{f_2, f_1}`, porque se sigue el orden de las
variables dependientes: `f(x, y, u) --> dy/dx, du/dx`. El resultado es:

|    x    |    y    |    u    |
| ------- | ------- | ------- |
| 0.00000 | 0.00000 | 2.00000 |
| 0.20000 | 0.40000 | 2.00000 |
| 0.40000 | 0.80000 | 2.48000 |
| 0.60000 | 1.29600 | 3.24800 |

#### Euler mejorado (h = 0.05)
Se utilizan las mismas definiciones del ejemplo anterior, pero cambiando el 
llamado a `ResolverEDO`:

```
X = ResolverEDO({f_2, f_1}, [0, 0.6], 0.05, [0, 2], 'eulerm')
```

El resultado es:

|    x    |    y    |    u    |
| ------- | ------- | ------- |
| 0.00000 | 0.00000 | 2.00000 |
| 0.05000 | 0.10000 | 2.01500 |
| 0.10000 | 0.20150 | 2.05936 |
| 0.15000 | 0.30593 | 2.13156 |
| 0.20000 | 0.41464 | 2.22913 |
| 0.25000 | 0.52883 | 2.34885 |
| 0.30000 | 0.64951 | 2.48688 |
| 0.35000 | 0.77751 | 2.63902 |
| 0.40000 | 0.91341 | 2.80089 |
| 0.45000 | 1.05759 | 2.96815 |
| 0.50000 | 1.21022 | 3.13671 |
| 0.55000 | 1.37127 | 3.30287 |
| 0.60000 | 1.54052 | 3.46344 |
