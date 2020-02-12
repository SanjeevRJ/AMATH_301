%% Problem 1
clc; clear all; close all;
r1 = 15; r2 = 20; r3 = 6; r4 = 18; r5 = 25; r6 = 30;
A = [(r1 + r2 + r6) -r1 -r2;
     -r1 (r3 + r4 + r1) -r4;
     -r2 -r4 (r5 + r4 + r2)];
[L, U, P] = lu(A);
ans1 = U * P * L;
save('A1.dat', 'ans1', '-ascii');
v1 = 50;
v3 = 75;
i2 = 1:1:100;
b = [v1; 0; v3];
for v2 = 1:100
   b(2) = v2;
   y = L\b;
   x = U\y;
   i2(v2) = x(2);
end
save('A2.dat', 'i2', '-ascii');
i1 = 1:1:100;
for v2 = 1:100
   b(2) = v2;
   x = inv(A)*b;
   i1(v2) = x(1);
end
save('A3.dat', 'i1', '-ascii');

%% Problem 2
clc; clear all; close all;
s = sqrt(2)/2;
A = [-s 1 0 0 0 0 0 0 0 s 0 0 0;
     -s 0 0 0 0 0 0 0 -1 -s 0 0 0;
     0 -1 1 0 0 0 0 0 0 0 0 0 0;
     0 0 0 0 0 0 0 0  0 0 -1 0 0;
     0 0 -1 s 0 0 0 0 0 0 0 -s 0;
     0 0 0 -s 0 0 0 0 0 0 0 -s -1;
     0 0 0 -s -1 0 0 0 0 0 0 0 0;
     0 0 0 0 1 -1 0 0 0 0 0 0 0;
     0 0 0 0 0 0 0 0 0 0 0 0 1;
     0 0 0 0 0 1 -1 0 0 -s 0 s 0;
     0 0 0 0 0 0 0 0 0 s 1 s 0;
     0 0 0 0 0 0 1 -1 0 0 0 0 0 ;
     0 0 0 0 0 0 0 0 1 0 0 0 0];
b = [0; 0; 0; 0; 0; 0; 0; 0; 4; 0; 10; 0; 5];
[L, U, P] = lu(A);
y = L\(P*b);
save('A4.dat', 'y', '-ascii');
x = U\y;
save('A5.dat', 'x', '-ascii');
worseX = A\b;
save('A6.dat', 'worseX', '-ascii');
max = 0;
check = 0;
for counter = 1:100000
   b(9) = b(9) + 0.01;
   y = L\(P*b); 
   x = U\y;
   for j = x.'
      if abs(j) > 30
        check = 1;
      end
   end
   if check > 0
       break;
   end
end
weight = b(9);    
save('A7.dat', 'weight', '-ascii'); 
     
%% Problem 3
clc; clear all; close all;
A = [10^-20 1; 1 1];
condition = cond(A);
save('A8.dat', 'condition', '-ascii');
L = [1 0; 10^20 1];
U = [10^-20 1; 0 1-(10^20)];
ans1 = L * U;
save('A9.dat', 'ans1', '-ascii');
B = [1 1; 10^-20 1]
[L1, U1, P] = lu(B);
ans2 = L1 * U1;
save('A10.dat', 'ans2', '-ascii');