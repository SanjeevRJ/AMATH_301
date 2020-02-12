%% Problem 1
clc; clear all; close all;
%wdot = @(w, v)((0.7 + v - 0.8*w) / 12.5);
%vdot = @(v, w, t)(v - ((v^3)/3) - w + I(t));
I = @(t)((5 + sin((pi*t)/10)) / 10);
f = @(t, v)([v(1) - ((v(1)^3)/3) - v(2) + I(t); 
            (0.7 + v(1) - 0.8.*v(2))/ 12.5]);
v0 = [1; 0];
dt = 0.5;
T = 100;
v_05 = rk2(v0, f, dt, T);
ans1 = v_05(1, end);
save('A1.dat', 'ans1', '-ascii');
[max_0_10, t1] = max(v_05(1, 1:1:21));
[min_10_20, t2] = min(v_05(1, 21:1:41));
[max_40_50, t3] = max(v_05(1, 81:1:101));
t3 = (t3 + 79) * dt;
t1 = (t1 - 1) * dt;
amp = max_0_10 - min_10_20;
save('A2.dat', 'amp', '-ascii');
period = t3 - t1;
save('A3.dat', 'period', '-ascii');
v_rk4 = rk4(v0, f, dt, T);
ans4 = v_rk4(1, end);
save('A4.dat', 'ans4', '-ascii');
[max_rk4_0_10, t1_rk4] = max(v_rk4(1, 1:1:21));
[min_rk4_10_20, t2_rk4] = min(v_rk4(1, 21:1:41));
[max_rk4_40_50, t3_rk4] = max(v_rk4(1, 81:1:101));
t3_rk4 = (t3_rk4 + 79) * dt;
t1_rk4 = (t1_rk4 - 1) * dt;
amp_rk4 = max_rk4_0_10 - min_rk4_10_20;
save('A5.dat', 'amp_rk4', '-ascii');
period_rk4 = t3_rk4 - t1_rk4;
save('A6.dat', 'period_rk4', '-ascii');

%% Problem 2
clc; clear all; close all;
x0 = 1;
xT = 2;
dt = 0.01;
T = 6;
size = T/dt;
N = size - 1;
save('A7.dat', 'N', '-ascii');
v1 = ones(size-2, 1);
v2 = -2 * ones(size-1, 1);
A = diag(v2) + diag(v1, 1) + diag(v1, -1);
A = (1/(dt^2)) * A;
A = A + eye(size-1);
b = zeros(size-1, 1);
f = @(t)(4*cos(5*t));
b(1) = f(dt)- (x0/(dt^2));
b(end) = f(T-dt)- (xT/(dt^2));
for k = 2:size-2
    b(k) = f(k*dt);
end
x_int = A\b;
x_int = x_int.';
x = [x0 x_int xT];
ans8 = x(301);
save('A8.dat', 'ans8', '-ascii');
[max, t_max] = max(x);
t_max = (t_max - 1) * dt;
save('A9.dat', 't_max', '-ascii');
[min, t_min] = min(x);
t_min = (t_min - 1) * dt;
save('A10.dat', 't_min', '-ascii');
    