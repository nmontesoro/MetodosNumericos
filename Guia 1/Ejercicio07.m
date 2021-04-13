v = [1.32, -4.23, 7.25, 0.42, 9.38, -0.76, 3.54, 4.92, 2.17, -3.38];

% 7.a: Obtenga el valor y la posición del máximo del vector v.
v_max = max(v);
v_max_index = find(v == v_max);

% 7.b: Obtenga la suma de todos los elementos del vector v.
v_sum = sum(v);

% 7.c: Obtenga el vector suma acumulativa del vector v.
v_cumsum = cumsum(v);

% 7.d: Obtenga el valor medio (promedio) de todos los elementos del vector
% v.
v_mean = mean(v);

% 7.e: Obtenga la mediana de todos los elementos del vector v.
v_median = median(v);

% 7.f: Obtenga un vector con los valores de v ordenados de menor a mayor.
v_sorted = sort(v);