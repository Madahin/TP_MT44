function [ val, nouv_a, nouv_c ] = evaluation( n, a, c, t )
%EVALUATION Produit le polynôme de Newton avec le schéma de Hörner
%      n : Degré du polynôme
%      a : Coefficient de l'écriture de Newton
%      c : Point de support
%      t : Valeur pour laquelle évaluer la fonction
%    val : Résultat de l'évaluation
% nouv_a : Composante de la fonction en écriture de Newton relative à nouv_c
% nouv_c : Représente (t, C1, ...n Cn-1) ainsi que le nouveau vecteur des centres

% On alloue de la mémoire
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
