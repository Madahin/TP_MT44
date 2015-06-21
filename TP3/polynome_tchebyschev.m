function [ tchebyschev ] = polynome_tchebyschev( k )
%POLYNOME_TCHEBYSCHEV Retourne un tableau contenant les polynomes de
%Tchebyschev

% Nos polynomes dependent d'une variable symbolique
syms x;

% La polynome de degre 0 n'est pas symbolique, mais tous les autres le
% sont. Il faut donc un type de donnee capable de stocker aussi bien des
% symboliques que des reels
tchebyschev = sym(zeros(1, k));

% On assigne les premiers degres
tchebyschev(1) = 1;
if k >= 1
    tchebyschev(2) = x;
end

% On calcule tous les polynomes du degre 3 jusqu'au degre k (si k < 3, la
% boucle est ignoree)
for i=3:k
    tchebyschev(i) = 2*x*tchebyschev(i-1)-tchebyschev(i-2);
end

end

