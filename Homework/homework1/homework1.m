%% Problem 1
clc; clear all; close all;
A = [1 2; -3 1];
B = [5 3; -1 3];
C = [1 2 3; -9 2 4];
D = [1 -2; -1 3; 2 3];
x = [-2; 0];
y = [0; 3];
z = [2; -3; 1];
ans1 = B - A;
save('A1.dat', 'ans1', '-ascii');
ans2 = -2*x + 4*y;
save('A2.dat', 'ans2', '-ascii');
ans3 = B*x;
save('A3.dat', 'ans3', '-ascii');
ans4 = A*(x-y);
save('A4.dat', 'ans4', '-ascii');
ans5 = C*z;
save('A5.dat', 'ans5', '-ascii');
ans6 = A*B;
save('A6.dat', 'ans6', '-ascii');
ans7 = B*A;
save('A7.dat', 'ans7', '-ascii');
ans8 = A*C;
save('A8.dat', 'ans8', '-ascii');
ans9 = C*D;
save('A9.dat', 'ans9', '-ascii');
ans10 = D(1:2, :);
save('A10.dat', 'ans10', '-ascii');
ans11 = C(:, 2)
save('A11.dat', 'ans11', '-ascii');
ans12 = C(1, 2:3);
save('A12.dat', 'ans12', '-ascii');

%% Problem2
clc; clear all; close all;
sum1 = 0;
for k = 1:800000
    sum1 = sum1 + 0.1;
end
x1 = abs(80000 - sum1);
save('A13.dat', 'x1', '-ascii');

sum2 = 0;
for k = 1:640000
    sum2 = sum2 + 0.125;
end
x2 = abs(80000 - sum2);
save('A14.dat', 'x2', '-ascii');

sum3 = 0;
for k = 1:400000
    sum3 = sum3 + 0.2;
end
x3 = abs(80000 - sum3);
save('A15.dat', 'x3', '-ascii');

sum4 = 0;
for k = 1:320000
    sum4 = sum4 + 0.25;
end
x4 = abs(80000 - sum4);
save('A16.dat', 'x4', '-ascii');

%% Problem 3
clc; clear all; close all;

save('A17.dat', 'startPop', '-ascii');