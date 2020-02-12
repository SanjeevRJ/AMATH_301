%% Problem 1
clc; clear all; close all;
x = 10;
y = -2;
z = pi;

save('A1.dat', 'z', '-ascii');

ans2 = x + y - z;

save('A2.dat', 'ans2', '-ascii');

ans3 = x^3;

save('A3.dat', 'ans3', '-ascii');

ans4 = exp(-y);

save('A4.dat', 'ans4', '-ascii');

ans5 = cos(z*y);

save('A5.dat', 'ans5', '-ascii');

%% Problem2
clc; clear all; close all;
A = [-1 2 1; 3 1 -1];
x = [1; 2; -1];
y = [-2; 0; 1];

save('A6.dat', 'x', '-ascii');

ans6 = A(2,:);

save('A7.dat', 'ans6', '-ascii');

ans7 = x - y;

save('A8.dat', 'ans7', '-ascii');

ans8 = A*y;

save('A9.dat', 'ans8', '-ascii');

ans9 = A*(x + y);

save('A10.dat', 'ans9', '-ascii');