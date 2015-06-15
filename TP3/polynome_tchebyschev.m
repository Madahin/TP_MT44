function [ tchebyschev ] = polynome_tchebyschev( k )
%POLYNOME_TCHEBYSCHEV Retourne un tableau contenant les polynome de
%Tchebyschev

% Nos polynome dependent d'une variable symbolique
syms x;

% La polynome de degree 0 n'est pas symbolique, mais tout les autres le
% sont. Il faut donc un type de donnee capable de stocker aussi bien des
% symbolique que des reel
tchebyschev = sym(zeros(1, k));

% On assigne les premiers degres
tchebyschev(1) = 1;
if k >= 1
    tchebyschev(2) = x;
end

% On calcule tout les polynome du degre 3 jusqu'au degre k (si k < 3, la
% boucle est ignore)
for i=3:k
    tchebyschev(i) = 2*x*tchebyschev(i-1)-tchebyschev(i-2);
end

end

