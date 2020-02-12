function [maxEig, X, k] = iterator(P, T, b)
M = -P\T;
lambdas = abs(eig(M));
maxEig = max(lambdas);
tolerance = 10^-4;
maxIter = 10000;
X = zeros(100, maxIter);
initial = ones(100, 1);
X(:, 1) = initial;
k = 0;
err = 1;
while err > tolerance && k < maxIter
    k = k + 1;
    X(:, k+1) = P\(-T*X(:, k) + b);
    err = norm(X(:, k+1) - X(:, k), Inf);
end
end

