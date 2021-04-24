% Solución:
% 1)
%    Matriz original:
%     0.5000    0.2500         0         0
%     0.3000    0.8000    0.4000         0
%          0    0.2000    1.0000    0.6000
%          0         0    1.0000   -3.0000
% 
% a) Jacobi:
%          0   -0.5000         0         0
%    -0.3750         0   -0.5000         0
%          0   -0.2000         0   -0.6000
%          0         0    0.3333         0
% 
%    Gauss-Seidel:
%          0   -0.5000         0         0
%          0    0.1875   -0.5000         0
%          0   -0.0375    0.1000   -0.6000
%          0   -0.0125    0.0333   -0.2000
% 
% b) Norma J: 0.8750. Norma GS: 0.7375
% c) Radio J: 0.4922. Radio GS: 0.2423
% d) Jacobi: converge. Gauss-Seidel: converge
% --------------------------------------------------------------------------------
% 2)
%    Matriz original:
%    1.0e+04 *
% 
%     0.0002    0.0017    0.0010
%     0.0003    1.6100   -0.0009
%     0.0002    0.0005    0.0002
% 
% a) Jacobi:
%          0   -8.5054   -4.8002
%    -0.0002         0    0.0006
%    -0.9412   -3.0588         0
% 
%    Gauss-Seidel:
%          0   -8.5054   -4.8002
%          0    0.0018    0.0016
%          0    7.9995    4.5130
% 
% b) Norma J: 13.3057. Norma GS: 13.3057
% c) Radio J: 2.1257. Radio GS: 4.5158
% d) Jacobi: diverge. Gauss-Seidel: diverge
% --------------------------------------------------------------------------------
% 3)
%    Matriz original:
%     6.5320    7.0000         0   -4.0000
%    -4.1020    6.0000         0    1.2000
%    -1.0000   -5.7012    1.2222         0
%     2.1560    4.1020   -2.3217    6.0000
% 
% a) Jacobi:
%          0   -1.0716         0    0.6124
%     0.6837         0         0   -0.2000
%     0.8182    4.6647         0         0
%    -0.3593   -0.6837    0.3869         0
% 
%    Gauss-Seidel:
%          0   -1.0716         0    0.6124
%          0   -0.7326         0    0.2187
%          0   -4.2944         0    1.5210
%          0   -0.7758         0    0.2190
% 
% b) Norma J: 5.4829. Norma GS: 5.8154
% c) Radio J: 1.2050. Radio GS: 0.4951
% d) Jacobi: diverge. Gauss-Seidel: converge
% --------------------------------------------------------------------------------
% 4)
%    Matriz original:
%     4.3000    3.4000    9.6250
%     2.5000    5.2000    9.6250
%     5.8000    3.2000   11.2400
% 
% a) Jacobi:
%          0   -0.7907   -2.2384
%    -0.4808         0   -1.8510
%    -0.5160   -0.2847         0
% 
%    Gauss-Seidel:
%          0   -0.7907   -2.2384
%          0    0.3801   -0.7748
%          0    0.2998    1.3756
% 
% b) Norma J: 3.0291. Norma GS: 3.0291
% c) Radio J: 1.6454. Radio GS: 1.0022
% d) Jacobi: diverge. Gauss-Seidel: diverge
% --------------------------------------------------------------------------------



% F1 <-> F2, F3 <-> F4
A = [  0.5, 0.25,    0,    0;
       0.3,  0.8,  0.4,    0;
         0,  0.2,    1,  0.6;
         0,    0,    1,   -3];

CalcAndDisp(A, 1);

% No importa qué filas cambie, jamás va a ser EDD porque los máximos
%   valores siempre están en la segunda columna.
% Haciendo F1 <-> F2 se consiguen números "lindos" (de otra forma quedan
%     determinantes 0)
A = [ 1.9999,  17.01,    9.6;
       3.444,  16100,   -9.1; 
         1.6,    5.2,    1.7];

CalcAndDisp(A, 2);

% F1 <-> F4 ?
A = [   6.532,       7,       0,      -4;
       -4.102,       6,       0,     1.2;
           -1, -5.7012,  1.2222,       0;
        2.156,   4.102, -2.3217,       6];

CalcAndDisp(A, 3);

% Idem 2. F1 <-> F3, F1 <-> F2
A = [   4.3,   3.4, 9.625;
        2.5,   5.2, 9.625;
        5.8,   3.2, 11.24];

CalcAndDisp(A, 4);


function CalcAndDisp(A, i)
    B_J = CalcMatrizBJacobi(A);
    B_GS = CalcMatrizBGaussSeidel(A);
    norm_BJ = norm(B_J, inf);
    norm_BGS = norm(B_GS, inf);
    respec_J = RadioEspectral(B_J);
    respec_GS = RadioEspectral(B_GS);
    converge_J = ConvergeJacobi(B_J);
    converge_GS = ConvergeGaussSeidel(B_GS);
    strLog = {'diverge', 'converge'};

    fprintf('%d)\n   Matriz original:\n', i);
    disp([A]);
    fprintf('a) Jacobi:\n');
    disp([B_J]);
    fprintf('   Gauss-Seidel:\n');
    disp([B_GS]);
    fprintf('b) Norma J: %5.4f. Norma GS: %5.4f\n', norm_BJ, norm_BGS);
    fprintf('c) Radio J: %5.4f. Radio GS: %5.4f\n', respec_J, respec_GS);
    fprintf('d) Jacobi: %s. Gauss-Seidel: %s\n', strLog{converge_J + 1}, ...
            strLog{converge_GS + 1});
    fprintf('--------------------------------------------------------------------------------\n');
end    