% On cree le vecteur des abscisses des points de support
X1 = [-1:2/7:1];

% On recupere le vecteur des ordonnees des points de support
Y1 = exp(X1);

% On recupere les composantes et le polynome d'interpolation
% correspondant aux vecteurs precedemment crees
[composante1, chaine1] = interpol(numel(X1), X1, Y1);

% On genere le vecteur des abscisses des points de support
% grace aux points de Tchebyschev
X2 = zeros(1, numel(X1));
for j=0:numel(X1)-1
    X2(j+1) = cos((2*j + 1)/numel(X1) * pi / 2);
end
% On recupere le vecteur des ordonnees des points de support
% de Tchebyschev
Y2 = exp(X2);

% On recupere les composantes et le polynome d'interpolation
% correspondant aux vecteurs precedemment crees
[composante2, chaine2] = interpol(numel(X1), X2, Y2);

% On genere des points qui serviront de donnees de test
x = [-1:0.001:1];

% Evaluation des deux fonctions sur l'intervalle x
y1 = evaluation2(7, composante1, X1, x);
y2 = evaluation2(7, composante2, X2, x);

% On affiche l'erreur d'interpolation
plot(x, abs(y1 - exp(x)), 'color', 'b'); hold on;
plot(x, abs(y2 - exp(x)), 'color', 'r');

% Un peu de presentation
title('Erreur d''interpolation');
xlabel('x');
ylabel('y');
legend('exp1', 'exp2');