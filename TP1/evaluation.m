function [ val, nouv_a, nouv_c ] = evaluation( n, a, c, t )
%EVALUATION Evalue le polynome de Newton avec le schema de Horner
%      n : Degre du polynome
%      a : Coefficient de l'ecriture de Newton
%      c : Points de support
%      t : Valeur pour laquelle evaluer la fonction
%    val : Resultat de l'evaluation
% nouv_a : Composante de la fonction en ecriture de Newton relative a nouv_c
% nouv_c : Represente (t, C1, ...n Cn-1) ainsi que le nouveau vecteur des centres

% On alloue de la memoire
nouv_a = zeros(1, n+1);
nouv_c = zeros(1, n);

nouv_c(1) = t;

nouv_a(n) = a(n);
for i = n-1:-1:1
    nouv_c(i+1) = c(i);
    nouv_a(i) = a(i) + (t-c(i)) * nouv_a(i+1);
end
val = nouv_a(1);

end
