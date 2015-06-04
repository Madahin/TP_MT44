function [ Pnx, Pny, Pnz ] = CastelJau( Px, Py, Pz, t )
%CASTELJAU - Calcule un point d'une courbe de bezier pour un poid t
%suivant l'algorithme de CastelJau

% On determine n
n = numel(Px) - 1;
% On alloue de la memoire aux differents vecteurs de coordonnees des points de
% sorties
Pnx = zeros(1, numel(t));
Pny = zeros(1, numel(t));
Pnz = zeros(1, numel(t));
% On alloue de la memoire a la matrice de castlejau
Ptmp = zeros(3, n+1, n+1);

for j=1:numel(t)
    % On met les points de base dans la matrice
    for i=1:n+1
        Ptmp(1, i, 1) = Px(i);
        Ptmp(2, i, 1) = Py(i);
        Ptmp(3, i, 1) = Pz(i);
    end
    
    % On calcule les coordonnees du point suivant grace aux points precedent
    % et a t
    for r=0:n-1
        for i=r:n-1
            Ptmp(1, 1 + i + 1, 1 + r + 1) = (1 - t(j)) * Ptmp(1, 1 + i, 1 + r) + t(j) * Ptmp(1, 1 + i + 1, 1 + r);
            Ptmp(2, 1 + i + 1, 1 + r + 1) = (1 - t(j)) * Ptmp(2, 1 + i, 1 + r) + t(j) * Ptmp(2, 1 + i + 1, 1 + r);
            Ptmp(3, 1 + i + 1, 1 + r + 1) = (1 - t(j)) * Ptmp(3, 1 + i, 1 + r) + t(j) * Ptmp(3, 1 + i + 1, 1 + r);
        end
    end
    % On assigne les coordonnees du point final aux matrices de sorties
    Pnx(j) = Ptmp(1, n+1, n+1);
    Pny(j) = Ptmp(2, n+1, n+1);
    Pnz(j) = Ptmp(3, n+1, n+1);
end

end

