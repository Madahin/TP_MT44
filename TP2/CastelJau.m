function [ Pnx, Pny, Pnz ] = CastelJau( Px, Py, Pz, t )
%CASTELJAU Summary of this function goes here
%   Detailed explanation goes here

Pnx = zeros(1, numel(t));
Pny = zeros(1, numel(t));
Pnz = zeros(1, numel(t));

n = numel(Px) -1;

Ptmp = zeros(3, n+1, n+1);

for j=1:numel(t)
    for i=1:n+1
        Ptmp(1, i, 1) = Px(i);
        Ptmp(2, i, 1) = Py(i);
        Ptmp(3, i, 1) = Pz(i);
    end
    
    for r=0:n-1
        for i=r:n-1
            Ptmp(1, 1 + i + 1, 1 + r + 1) = (1 - t(j)) * Ptmp(1, 1 + i, 1 + r) + t(j) * Ptmp(1, 1 + i + 1, 1 + r);
            Ptmp(2, 1 + i + 1, 1 + r + 1) = (1 - t(j)) * Ptmp(2, 1 + i, 1 + r) + t(j) * Ptmp(2, 1 + i + 1, 1 + r);
            Ptmp(3, 1 + i + 1, 1 + r + 1) = (1 - t(j)) * Ptmp(3, 1 + i, 1 + r) + t(j) * Ptmp(3, 1 + i + 1, 1 + r);
        end
    end
    
    Pnx(j) = Ptmp(1, n+1, n+1);
    Pny(j) = Ptmp(2, n+1, n+1);
    Pnz(j) = Ptmp(3, n+1, n+1);
end

end

