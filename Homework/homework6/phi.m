function [out] = phi(t)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
x1 = -1;
x2 = 8;
df_x1 = -2*(1 - x1) - 40*x1*(x2 - x1.^2);
df_x2 = 20*(x2 - x1.^2);
out1 = x1 - t*df_x1;
out2 = x2 - t*df_x2;
out = [out1; out2];
end

