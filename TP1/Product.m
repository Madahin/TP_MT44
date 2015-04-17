function prod = Product( i, x, c )
%PRODUCT Calcule les polynôme de Newton
%   i : Degré du polynôme
%   x : Valeur pour laquelle évaluer la fonction
%   c : Point de pivot

prod = 1;
for j = 1:i
   prod = prod * (x-c(i));
end

end
