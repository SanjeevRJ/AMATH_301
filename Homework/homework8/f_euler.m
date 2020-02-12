function [reals, vals] = f_euler(dt, T, f, x0, g)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
size = T/dt;
vals = zeros(size + 1, 1);
reals = zeros(size + 1, 1);
vals(1) = x0;
reals(1) = g(0);
for k = 1:size
    vals(k+1) = vals(k) + dt*f(vals(k));
end
for k = 1:size
    reals(k+1) = g(k*dt);
end
end

