%% Problem 1
clc; clear all; close all;
g = @(t)(2*atan(exp(5*t) / (1 + sqrt(2)))); 
f = @(t)(5*sin(t));
x0 = pi/4;
[reals_01, vals_01] = f_euler(.1, 1, f, x0, g); %%
ans1 = vals_01(end);
save('A1.dat', 'ans1', '-ascii');
max_err_01 = norm(vals_01 - reals_01, Inf);
save('A2.dat', 'max_err_01', '-ascii');
[reals_001, vals_001] = f_euler(.01, 1, f, x0, g); %%
ans3 = vals_001(end);
save('A3.dat', 'ans3', '-ascii');
max_err_001 = norm(vals_001 - reals_001, Inf);
save('A4.dat', 'max_err_001', '-ascii');
ratio = max_err_01 / max_err_001;
save('A5.dat', 'ratio', '-ascii');
[reals_1, vals_1] = f_euler(1, 100, f, x0, g); %%
ans6 = vals_1(end);
save('A6.dat', 'ans6', '-ascii');
b_vals_1 = b_euler(1, 100, f);
ans7 = b_vals_1(end);
save('A7.dat', 'ans7', '-ascii');

%% Problem 2
clc; clear all; close all;
dt = 0.05;
T = 10;
g = -9.8;
L = 2;
n = -0.5;
A = [0 1; g/L n];
vals_f = zeros(2, T/dt);
vals_f(:, 1) = [1; 0];
for k = 1:T/dt
   vals_f(:, k + 1) = (eye(2) + dt*A)*vals_f(:, k);
end
ans8 = vals_f(1, end);
save('A8.dat', 'ans8', '-ascii');
vals_b = zeros(2, T/dt);
vals_b(:, 1) = [1; 0];
for k = 1:T/dt
    vals_b(:, k + 1) = inv(eye(2) - A*dt)*vals_b(:, k);
end
ans9 = vals_b(1, end);
save('A9.dat', 'ans9', '-ascii');
[rkt, rkx] = ode45(@(t,x)(A*x), 0:dt:T, [1; 0]);
ans10 = rkx(end, 1);
save('A10.dat', 'ans10', '-ascii');