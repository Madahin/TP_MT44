function tab = table_diff_div( x, y )
% TABLE_DIFF_DIV Genere la table des differences divisees
% x : Vecteur des abscisses des points de support
% y : Vecteur des ordonnees des points de support
% tab : Table des differences divisees
% Exemple :
% +-+----+--------+-----------+
% |x|f(x)|f[x1,x2]|f[x1,x2,x3]|
% +-+----+--------+-----------+
% |a|f(a)| f[a,b] |  f[a,b,c] |
% +-+----+--------+-----------+
% |b|f(b)| f[b,c] |     0     |
% +-+----+--------+-----------+
% |c|f(c)|   0    |     0     |
% +-+----+--------+-----------+


sizeX = numel(x);
sizeY = numel(y);


% On test la taille des vecteurs
if (sizeX ~= sizeY)
    % Dans ce cas, on devrait echouer
end


% On cree une table dont les deux premieres colonnes sont nos vecteurs d'entrees
tab = [x', y', zeros(sizeX, sizeX-1)];
% Ecart de la base de la pyramide des differences divisees
gap = 1;

for i = 1:sizeX-1
    for j = 1:sizeY-i
        % Calcul du coefficient f[xj, xi]
        tab(j, i+2) = (tab(j+1, i+1) - tab(j, i+1)) / (tab(j+gap, 1) - tab(j, 1));
    end
    % Pour chaque nouvelle colonne, l'ecart grandit
    gap = gap + 1;
end
end

