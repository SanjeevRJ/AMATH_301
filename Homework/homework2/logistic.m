function populations = logistic(startPop, r, K, years)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
populations = (1:1:years);
populations(1) = startPop;
for k = 2:years
    newPop = r * startPop * (1 - (startPop/K));
    populations(k) = newPop;
    startPop = newPop;
end
end

