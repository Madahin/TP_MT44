function  val  = evaluation1( n, a, c, t )
% EVALUATION1 Évalue le polynôme de Newton
%   n : Degré du polynôme
%   a : Coefficient d l'écriture de Newton
%   c : Point de support
%   t : Valeur pour laquelle évaluer la fonction
% val : Résulat de l'évaluation 

val = 0;
for i = 0:n-1
    prod = Product(i, t, c) * a(i+1);
    val = val + prod;

end

