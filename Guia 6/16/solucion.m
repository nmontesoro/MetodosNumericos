% 0.882005075528020
a = 0;
b = 2;
f = @(x) exp(-x.^2);

val = IntegracionAdaptativa(f, @(opt) abs(opt.R - opt.Ra) < 1e-3, a, b);
