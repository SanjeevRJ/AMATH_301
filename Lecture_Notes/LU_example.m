clear all; close all; clc; 

% Matlab has several builtin ways to solve a system of equations.  In this
% script we will solve the system described in the .pdf notes.  Remember
% that we enter a system of equations into Matlab by writing it in the
% matrix form Ax = b and defining A and b.  
A = [2 1 1; 4 3 3; 8 7 9];
b = [1; 1; -1];
% We already found the solution by hand: x_1 = 1, x_2 = 0 and x_3 = -1.
% The easiest way to find this solution in Matlab is with the backslash
% command: 
x = A\b;            % This is O(n^3)
% Unless you know something special about A, you should assume that Matlab
% solves the system with Gaussian elimination followed by back
% substitution.  (Technically, it uses LU decomposition, but there is
% essentially no difference between the methods in this case.)  In
% particular, you should keep in mind that this is an O(n^3) method, where
% n is the number of rows/columns of A.  
% 
% We can also implement LU decomposition more explicitly in Matlab by
% calculating the matrices L, U and P with the lu command.  Once we find
% these systems, we can then solve the two systems Ly = Pb and Ux = y.  
[L, U, P] = lu(A);  % This is O(n^3)
y = L\(P*b);        % This is O(n^2)
x = U\y;            % This is O(n^2)
% This produces exactly the same answer as line 12.  Whenever you are asked
% to use LU decomposition to solve a problem, you need to use this method
% (lines 23-25).  In particular, note that Matlab does not require you to
% ask for the permutation matrix P.  That is, it is possible to write [L,
% U] = lu(A); y = L\b; x = U\y;  YOU SHOULD NOT DO SO.  If you don't
% explicitly use the matrix P, then your answer is not correct.  
% 
% The big advantage of LU decomposition comes when we try to solve a
% similar system of equations with the same matrix A but a different right
% hand side b.  For example, suppose we now want to solve Ax = c, where 
c = [0; 2; 8]; 
% We could, of course, just use the backslash command again: 
x = A\c;            % This is still O(n^3)
% But it is much more efficient to use LU decomposition: 
y = L\(P*c);        % This is still O(n^2)
x = U\y;            % This is still O(n^2)
% Notice that we do not need to recalculate L, U or P because they only
% depend on the matrix A, which has not changed.  We therefore get to skip
% the O(n^3) step.  For large systems, the O(n^3) step takes almost all of
% the time for this algorithm, so we essentially get to solve Ax = c for
% free.  
% 
% It is important to note that the backslash command checks to see if a
% matrix is triangular.  If the matrix is triangular, then Matlab uses
% forward/back substitution instead of Gaussian elimination.  That is why
% the lines "y = L\(P*b)" and "x = U\y" only take O(n^2) flops.  