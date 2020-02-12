function v = rk4(v0, f, dt, T)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
size = T/dt;
v = zeros(2, size + 1);
v(:, 1) = v0;
for k = 1:size
    t = (k-1)*dt;
    yk = v(:, k);
    dt2 = dt/2;
    f1 = f(t, yk);
    f2 = f(t + dt2, yk + dt2*f1);
    f3 = f(t + dt2, yk + dt2*f2);
    f4 = f(t + dt, yk + dt*f3);
    v(:, k+1) = yk + (dt/6)*(f1 + 2*f2 + 2*f3 + f4);
end
end

