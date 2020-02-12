%% Problem 1
clc; clear all; close all;
load('population.mat');
n = length(N);
dx = 1;
f_1810 = (-3*N(1) + 4*N(1 + dx) - N(1 + 2*dx)) / (2*10);
save('A1.dat', 'f_1810', '-ascii');
f_1910 = (N(11 + dx) - N(11 - dx)) / (2*10);
save('A2.dat', 'f_1910', '-ascii');
f_2010 = (3*N(21) - 4*N(21 - dx) + N(21 - 2*dx)) / (2*10);
save('A3.dat', 'f_2010', '-ascii');
dN_dt = zeros(n, 1);
dN_dt(1) = f_1810;
for k = 2:(n-1)
    dN_dt(k) = (N(k + dx) - N(k - dx)) / (2*10);
end
dN_dt(end) = f_2010;
growth = dN_dt ./ N;
avg_growth = mean(growth);
save('A4.dat', 'avg_growth', '-ascii');

%% Problem 2
clc; clear all; close all;
load('brake_pad.mat');
dr = r(2) - r(1);
n = length(T);
l_T_total = 0;
theta_p = 0.7051;
for k = 1:(n-1)
   l_T_total = l_T_total + r(k)*T(k)*theta_p*dr;
end
save('A5.dat', 'l_T_total', '-ascii');
l_A = 0;
for k = 1:(n-1)
   l_A = l_A + r(k)*theta_p*dr;
end
save('A6.dat', 'l_A', '-ascii');
l_T_ans = l_T_total ./ l_A;
save('A7.dat', 'l_T_ans', '-ascii');
t_T_total = 0;
for k = 1:n-1
   t_T_total = t_T_total + (dr/2)*(r(k)*T(k)*theta_p + r(k + 1)*T(k + 1)*theta_p);
end
save('A8.dat', 't_T_total', '-ascii');
t_A = 0;
for k = 1:n-1
   t_A = t_A + (dr/2)*(r(k)*theta_p + r(k + 1)*theta_p);
end
save('A9.dat', 't_A', '-ascii');
t_T_ans = t_T_total ./ t_A;
save('A10.dat', 't_T_ans', '-ascii');