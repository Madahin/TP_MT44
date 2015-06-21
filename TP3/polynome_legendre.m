function [ legendre ] = polynome_legendre(k)
%POLYNOME_LEGENDRE Retourne un tableau contenant les polynomes de Legendre

% Nos polynomes dependent d'une variable symbolique
syms x;

% La polynome de degre 0 n'est pas symbolique (c'est 1), mais tous les autres le
% sont. Il faut donc un type de donnee capable de stocker aussi bien des
% symboliques que des reels
legendre = sym(zeros(1, k));

% On assigne les premiers degres
legendre(1) = 1;
if k >= 1
    legendre(2) = x;
end

% On calcule tous les polynomes du degre 3 jusqu'au degre k (si k < 3, la
% boucle est ignoree)
for i=3:k
    legendre(i) = (2*(i-2)+1) / (i-1) * x * legendre(i-1) - (i-2) / (i-1) * legendre(i-2);
end


end

