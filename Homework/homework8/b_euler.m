function vals = b_euler(dt, T, f)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
vals = zeros(T/dt, 1);
vals(1) = f(0);
for k = 1:T/dt
    vals(k+1) = fzero(@(x)(x - 5*sin(x) - vals(k)), 3);
end
end

