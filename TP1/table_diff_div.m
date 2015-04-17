function tab = table_diff_div( x, y )
% TABLE_DIFF_DIV Génère la table des différence divisé
% x : Vecteur des abscisses des point de support
% y : Vecteur des ordonnées des point de support

sizeX = numel(x);
sizeY = numel(y);


% On test la taille des vecteur
if (sizeX ~= sizeY)
    % Dans ce cas, on devrai échoué
end


% On crée une table dont les deux premier colonne sont nos vecteur d'entrés
tab = [x', y', zeros(sizeX, sizeX-1)];
% Écart de la pyramide des différence divisé
gap = 1;

for i = 1:sizeX-1
    for j = 1:sizeY-i
        tab(j, i+2) = (tab(j+1, i+1) - tab(j, i+1)) / (tab(j+gap, 1) - tab(j, 1));
    end
    gap = gap + 1;
end
end

