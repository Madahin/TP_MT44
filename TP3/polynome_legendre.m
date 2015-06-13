function [ legendre ] = polynome_legendre( k)
%POLYNOME_LEGENDRE Retourne un tableau contenant les polynome de Legendre

% Nos polynome dependent d'une variable symbolique
syms x;

% La polynome de degree 0 n'est pas symbolique, mais tout les autres le
% sont. Il faut donc un type de donnee capable de stocker aussi bien des
% symbolique que des reel
legendre = sym(zeros(1, k+1));

% On assigne les premiers degres
legendre(1) = 1;
if k >= 1
    legendre(2) = x;
end

% On calcule tout les polynome du degre 3 jusqu'au degre k (si k < 3, la
% boucle est ignore)
for i=3:k+1
    legendre(i) = (2*(i-1)+1) / (i) * x * legendre(i-1) - (i-1) / (i) * legendre(i-2);
end


end

