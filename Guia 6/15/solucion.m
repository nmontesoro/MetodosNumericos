% a) R6,2 = 4.000154360133406 (0.002010077362450)
% b) R6,6 = 4.000007330447382

f = @(x) x .^ (-2);

% Calcular mediante Simpson 1/3 es equivalente a calcular R_{i,2}
i = 1;
R = IntegracionRomberg(f, 1, 1, 0.2, 1);

while true
    i = i + 1;
    R_a = R;
    R = IntegracionRomberg(f, i, 2, 0.2, 1);
    tol = abs(R - R_a);
    if tol < 0.02
        break;
    end
end

fprintf('a) R%d,%d = %17.15f (%17.15f)\n', i, 2, R, tol);

R = IntegracionRomberg(f, 6, 6, 0.2, 1);
fprintf('b) R%d,%d = %17.15f\n', 6, 6, R);
