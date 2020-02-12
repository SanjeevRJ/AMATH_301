function [df] = gradient(xs)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
df_x1 = -2*(1 - xs(1)) - 40*xs(1)*(xs(2) - xs(1).^2);
df_x2 = 20*(xs(2) - xs(1).^2);
df = [df_x1; df_x2];
end

