function E = rms_er(a, b, c)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
load('salmon.mat');
sal_pred = exp(a*t.^2 + b*t + c);
E = sqrt(sum((sal_pred - salmon).^2) / length(salmon));
end

