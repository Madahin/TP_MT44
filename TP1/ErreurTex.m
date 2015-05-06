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
for j=1:numel(X1)
    X2(j) = cos((2*j + j)/numel(X1) * pi / 2);
end

% On recupere le vecteur des ordonnees des points de support
% de Tchebyschev
Y2 = exp(X2);

% On recupere les composantes et le polynome d'interpolation
% correspondant aux vecteurs precedemment crees
[composante2, chaine2] = interpol(numel(X1), X2, Y2);

% On cree la fonction exp1 correspondant a l'interpolation
% polynomial de la fonction exponentielle
% "$\at$(x)" permet de dire a matlab lorsqu'il interpretera
% la chaine de caracteres en fonction que nous prenons
% un parametre nomme x, creant ainsi un prototype de
% fonction anonyme
func1 = '$\at$(x)';

% On concatene ensuite le corps de la fonction, qui
% est le polynome de la fonction
func1 = strcat(func1, chaine1);

% Matlab interprete la chaine en une fonction anonyme
exp1 = str2func(func1);

% On cree la fonction exp2, utilisant les points de support
% de Tchebyschev, de la meme maniere que la fonction exp1
func2 = '$\at$(x)';
func2 = strcat(func2, chaine2);
exp2 = str2func(func2);

% On genere des points qui serviront de donnees de test
x = [-5:0.001:5];

% Comme les fonctions precedemment crees ne sont pas faites pour
% renvoyer un tableau de valeurs, on doit calculer tous les points
% un a un
y = zeros(1, numel(x));
y2 = zeros(1, numel(x));
for i=1:numel(x)
    y(i) = exp1(x(i));
    y2(i) = exp2(x(i));
end

% On affiche l'erreur d'interpolation
plot(x, abs(y - exp(x)), 'color', 'b'); hold on;
plot(x, abs(y2 - exp(x)), 'color', 'r');

% Un peu de presentation
title('Erreur d''interpolation');
xlabel('x');
ylabel('y');
legend('exp1', 'exp2');