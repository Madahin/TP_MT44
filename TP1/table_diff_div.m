function tab = table_diff_div( x, y )
% TABLE_DIFF_DIV Génère la table des différence divisé
% x : Vecteur des abscisses des point de support
% y : Vecteur des ordonnées des point de support
% tab : Table des differences divisé
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


% On test la taille des vecteur
if (sizeX ~= sizeY)
    % Dans ce cas, on devrait échouer
end


% On crée une table dont les deux premier colonne sont nos vecteur d'entrés
tab = [x', y', zeros(sizeX, sizeX-1)];
% Écart de la base de la pyramide des différences divisées
gap = 1;

for i = 1:sizeX-1
    for j = 1:sizeY-i
        % Calcul du coefficient f[xj, xi]
        tab(j, i+2) = (tab(j+1, i+1) - tab(j, i+1)) / (tab(j+gap, 1) - tab(j, 1));
    end
    % Pour chaque nouvelle colonne, l'écart grandit
    gap = gap + 1;
end
end

