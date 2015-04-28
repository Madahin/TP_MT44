function [ composante, chaine ] = interpol( n, x, y )
% INTERPOL Construit le vecteur des composantes du polynome d'interpolation Pn
% de f sur le suppport {x0, ..., xn}
%          n : Nombre de points de support
%          x : Vecteur des abscisses des points de support
%          y : Vecteur des ordonnees des points de support
% composante : Composante du polynome d'interpolation
%     chaine : Chaine de caractere representant le polynome d'interpolation


% Calcule la table des differences divisees
table = table_diff_div(x, y);

% Alloue de la memoire
composante = zeros(1, n);

% On recupere les composantes dans la table
for i=2:1:n+1
    composante(i-1) = table(1, i);
end

% On cree la chaine de caracteres
chaine = '';
for i=1:n
    % On ecrit la composante
    chaine = strcat(chaine, num2str(composante(i)));
    for j=1:i-1
        % On ecrit le polynome de Newton (x-x0)*(x-x1)*...(x-xn-1)
        chaine = strcat(chaine, '*(');
        chaine = strcat(chaine, 'x-(');
        chaine = strcat(chaine, num2str(x(j)));
        chaine = strcat(chaine, '))');
    end
    if (i < n) && (composante(i+1)>=0) 
        chaine = strcat(chaine, '+');
    end
end
end

