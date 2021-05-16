% No sé si hay una forma de determinar los índices i y j para cierta 
%   tolerancia, por eso lo hago a lo bruto.
% a)  R3,3 = 0.4309641 (err: 0.0000003)
% b) R12,2 = 0.6666658 (err: 0.0000009)

[val, err, i, j] = RombergBruto(0.5, 1);
fprintf('a) R%d,%d = %8.7f (err: %8.7f)\n', i, j, val, err);

[val, err, i, j] = RombergBruto(0, 1);
fprintf('b) R%d,%d = %8.7f (err: %8.7f)\n', i, j, val, err);

function [val, err, i, j] = RombergBruto(a, b)
    f = @(x) sqrt(x);
    err_abs = @(x, y) abs(x - y);
    i = 0;
    while true
        i = i + 1;
        for j = 1:i
            val = IntegracionRomberg(f, i, j, a, b);
            err = err_abs(val, 2/3 * (b^(3/2) - a^(3/2)));
            if err < 1e-6
                break;
            end
        end
        if err < 1e-6
            break;
        end
    end
end
