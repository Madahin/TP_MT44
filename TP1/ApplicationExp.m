% On crée le vecteur des abscisses des points de support
X1 = [-1:2/7:1];

% On récupere le vecteur des ordonnées des point de support
Y1 = exp(X1);

% On récupere les composante et le polynôme d'interpolation
% correspondant aux vecteurs précédement crées
[composante, chaine] = interpol(8, X1, Y1);

% On affiche le polynôme d'interpolation
disp(chaine);

% On génère le vecteur des abscisses des point de support
% grâce au points de Tchebyschev
X2 = zeros(1, 8);
for j=1:8
    X2(j) = cos((2*j + j)/8 * pi / 2);
end

% On récupere le vecteur des ordonnées des point de support
% De Tchebyschev
Y2 = exp(X2);

% On récupere les composante et le polynôme d'interpolation
% correspondant aux vecteurs précédement crées
[composante, chaine] = interpol(8, X2, Y2);

% On affiche le polynôme d'interpolation
disp(chaine);