function prod = Product( i, x, c )
%PRODUCT Calcule les polynomes de Newton
%    i : Degré du polynome
%    x : Valeur pour laquelle evaluer la fonction
%    c : Points de support
% prod : le polynome de Newton

prod = 1;
for j = 1:i
   prod = prod * (x-c(i));
end

end
