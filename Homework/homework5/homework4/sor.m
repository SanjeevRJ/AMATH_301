function [P, T] = sor(L, D, U, w)
P = (1/w)*D + L;
T = ((w-1)/w)*D + U;
end

