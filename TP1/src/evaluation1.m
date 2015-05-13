function  val  = evaluation1( n, a, c, t )
% EVALUATION1 Evalue le polynome de Newton
%   n : Degre du polynome
%   a : Coefficient de l'ecriture de Newton
%   c : Points de support
%   t : Valeur pour laquelle evaluer la fonction
% val : Resulat de l'evaluation 

val = 0;
for i = 0:n-1
    prod = Product(i, t, c) * a(i+1);
    val = val + prod;
end

