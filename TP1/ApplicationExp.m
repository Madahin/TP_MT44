% On cree le vecteur des abscisses des points de support
X1 = [-1:2/7:1];

% On recupere le vecteur des ordonnees des points de support
Y1 = exp(X1);

% On recupere les composantes et le polynome d'interpolation
% correspondant aux vecteurs precedemment crees
[composante, chaine] = interpol(8, X1, Y1);

% On affiche le polynome d'interpolation
disp(chaine);

% On genere le vecteur des abscisses des points de support
% grace aux points de Tchebyschev
X2 = zeros(1, 8);
for j=1:8
    X2(j) = cos((2*j + j)/8 * pi / 2);
end

% On recupere le vecteur des ordonnees des points de support
% de Tchebyschev
Y2 = exp(X2);

% On recupere les composantes et le polynome d'interpolation
% correspondant aux vecteurs precedemment crees
[composante, chaine] = interpol(8, X2, Y2);

% On affiche le polynome d'interpolation
disp(chaine);