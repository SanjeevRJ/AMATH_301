%% Problem 1
clc; clear all; close all;
mainDiag = ones(1, 100) * 2;
subDiag = ones(1, 99) * -1;
D = diag(mainDiag, 0);
U = diag(subDiag, 1);
L = diag(subDiag, -1);
A = D + U + L;
p = zeros(100, 1);
cosVal = (56*pi)/101;
for k = 1:100
    sinVal = (56*pi*k)/101;
    p(k) = 2*(1 - cos(cosVal))*sin(sinVal);
end
P = diag(diag(A));
T = A - P;
[maxEig, X, k] = iterator (P, T, p); 
ans1 = maxEig;
save('A1.dat', 'ans1', '-ascii');
ans2 = k;
save('A2.dat', 'ans2', '-ascii');
exactAns = A\p;
iterAns = X(:, k);
ans3 = norm(iterAns - exactAns, Inf);
save('A3.dat', 'ans3', '-ascii');
P = A - U;
T = A - P;
[seidEig, seidX, seidk] = iterator(P, T, p);
save('A4.dat', 'seidEig', '-ascii');
ans5 = seidk;
save('A5.dat', 'ans5', '-ascii');
seidIterAns = seidX(:, seidk);
ans6 = norm(seidIterAns - exactAns, Inf);
save('A6.dat', 'ans6', '-ascii');

%% Problem 2
[P, T] = sor(L, D, U, 1.5);
M = -P\T;
lambdas = abs(eig(M));
sorEig = max(lambdas);
save('A7.dat', 'sorEig', '-ascii');
allEigs = zeros(99, 2);
k = 1;
for w = 1:0.01:1.99
    [P, T] = sor(L, D, U, w);
    M = -P\T;
    lambdas = abs(eig(M));
    allEigs(k, 1) = max(lambdas);
    allEigs(k, 2) = w;
    k = k+1;
end
[minEig, minInd] = min(allEigs);
wMin = allEigs(minInd(1), 2);
save('A8.dat', 'wMin', '-ascii');
[P, T] = sor(L, D, U, wMin);
[sorEig, sorX, sork] = iterator(P, T, p);
ans9 = sork;
save('A9.dat', 'ans9', '-ascii');
sorIterAns = sorX(:, sork);
ans10 = norm(sorIterAns - exactAns, Inf);
save('A10.dat', 'ans10', '-ascii');

