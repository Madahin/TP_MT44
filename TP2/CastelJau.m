function [ Px Py ] = CastelJau( Points, t )
%CASTELJAU Summary of this function goes here
%   Detailed explanation goes here

n = numel(Points)/2 -1;
Pn = zeros(n+1, numel(Points));
Px = zeros(1, numel(t));
Py = zeros(1, numel(t));
for j=1:numel(t)
    for p=1:numel(Points)
        Pn(1, p) = Points(p);
    end
    for r=1:n
        for i=1:numel(Points)-r-1 - (r-1)
            Pn(r+1, i) = (1 - t(j)) * Pn(r, i) + t(j) * Pn(r, i+2);
        end
    end
    Px(j) = Pn(n+1, 1);
    Py(j) = Pn(n+1, 2);
end

end

