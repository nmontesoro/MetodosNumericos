function [cds_ac, cds_rc, cds_aa, cds_ra] = CalcCDS(a,b)
% CalcCDS Calcula la cantidad de cifras decimales significativas
%   Input:
%       a: valor exacto
%       b: aproximación
%   Output:
%       cds_ac: CDS usando error absoluto y corte
%       cds_rc: CDS usando error relativo y corte
%       cds_aa: CDS usando error absoluto y aproximación
%       cds_ra: CDS usando error relativo y aproximación

err_abs = abs(a-b);
err_rel = err_abs / abs(a);

cds_ac = 0;
cds_rc = 0;
cds_aa = 0;
cds_ra = 0;


% cds_ac. |x-x_| < 10^(-d)
d = 1;
while (err_abs < 10^(-d))
    d = d + 1;
end
cds_ac = d - 1;

% cds_rc. |x-x_| / |x| < 10^(-d)
d = 1;
while (err_rel < 10^(-d))
    d = d + 1;
end
cds_rc = d - 1;

% cds_aa. |x-x_| < 5x10^-(d+1)
d = 1;
while (err_abs < 5*10^(-d-1))
    d = d + 1;
end
cds_aa = d - 1;

% cds_ra. |x-x_| / |x| < 5x10^-(d+1)
d = 1;
while (err_rel < 5*10^(-d-1))
    d = d + 1;
end
cds_ra = d - 1;

end

