function bool = eqCheck(populations, tolerance)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
check = populations(end) - populations(end - 1);
if abs(check) < tolerance
    bool = 1;
else 
    bool = 0;
end
end

