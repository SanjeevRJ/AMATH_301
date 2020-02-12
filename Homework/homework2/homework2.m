%% Problem 1
clc; clear all; close all;
low = 0;
high = 1.2;
f = @(x)(x^5 - 2*x^4 + 3*x^3 - 2*x^2 + x - 1 - cos(30*x));
tolerance = 10^(-10);
for steps = 1:1000
    steps
    x = (low + high)/2;
    fx = f(x);
    if abs(fx) < tolerance
        break
    end
    if sign(fx) == sign(f(low))
        low = x;
    else
        high = x;
    end
end
ans1 = f(0) * f(1.2);
save('A1.dat', 'ans1', '-ascii');
ans2 = x;
save('A2.dat', 'ans2', '-ascii');
ans3 = steps;
save('A3.dat', 'ans3', '-ascii');

%% Problem 2
clc; clear all; close all;
startPop = 10;
K = 50;
x = logistic(startPop, 2.5, K, 101);
y = logistic(startPop, 3.2, K, 101);
z = logistic(startPop, 3.5, K, 101);
ans4 = [x(end - 2) x(end - 1) x(end); y(end - 2) y(end - 1) y(end); 
     z(end - 2) z(end - 1) z(end)];
save('A4.dat', 'ans4', '-ascii');
tolerance = 10e-8;
is_equilibrium = 1:1:15;
equilibrium_value = 1:1:15;
counter = 1;
for steps = 2:0.1:3.4
    cur = logistic(startPop, steps, K, 501);
    check = eqCheck(cur, tolerance); 
    is_equilibrium(counter) = check;
    if is_equilibrium(counter) == 0
        equilibrium_value(counter) = 0;
    else 
        equilibrium_value(counter) = cur(end);
    end
    counter = counter + 1;
end
save('A5.dat', 'is_equilibrium', '-ascii');
save('A6.dat', 'equilibrium_value', '-ascii');

%% Problem 3
clc; clear all; close all;    
p0 = [1 0 0 0];
save('A7.dat', 'p0', '-ascii');
P = [.99 0 .01 0; 0 .56 .25 .19; .10 .22 .42 .26; 0 .36 .15 .49];
for t = 1:1000
    newP = p0 * P;
    if newP(1) < .8
        break
    end
    p0 = newP;
end
save('A8.dat', 't', '-ascii');
save('A9.dat', 'newP', '-ascii');
p0 = [1 0 0 0];
for t = 1:10000
    newP = p0 * P;
    p0 = newP;
end
save('A10.dat', 'newP', '-ascii');