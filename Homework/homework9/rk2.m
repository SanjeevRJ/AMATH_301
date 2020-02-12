function v = rk2(v0, f, dt, T)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
size = T/dt;
v = zeros(2, size + 1);
v(:, 1) = v0;
for k = 1:size 
    t = (k-1)*dt;
    yk = v(:, k);
    v(:, k + 1) = yk + dt*f(t + (dt/2),...
                            yk + (dt/2)*f(t, yk));
                                                          
end

