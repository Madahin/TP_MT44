% On crée le vecteur des abscisses des points de support
X1 = [-1:2/7:1];

% On récupère le vecteur des ordonnées des points de support
Y1 = exp(X1);

% On récupère les composantes et le polynôme d'interpolation
% correspondant au vecteurs précédement crées
[composante1, chaine1] = interpol(numel(X1), X1, Y1);

% On génère le vecteur des abscisses des points de support
% grâce aux points de Tchebyschev
X2 = zeros(1, numel(X1));
for j=1:numel(X1)
    X2(j) = cos((2*j + j)/numel(X1) * pi / 2);
end

% On récupère le vecteur ddes ordonnées des points de support
% de Tchebyschev
Y2 = exp(X2);

% On récupère les composantes et le polynôme d'interpolation
% correspondant au vecteurs précédement crées
[composante2, chaine2] = interpol(numel(X1), X2, Y2);

% On crée la fonction exp1 correspondant a l'interpolation
% polynômial de fonction la fonction exponentielle
% "@(x)" permet de dire à matlab lorsqu'il intepretera

% la chaîne de caractères en fonction que nous prenons
% 1 paramètre nommé x, créant ainsi un prototype de
% fonction anonyme
func1 = '@(x)';

% On concatène ensuite le corps de la fonction, qui
% est le polynôme de la fonction
func1 = strcat(func1, chaine1);

% Matlab interprète la chaine en une fonction anonyme
exp1 = str2func(func1);

% On crée la fonction exp2, utilisant les points de support
% de Tchebyschev, de la même manière que la fonction exp1
func2 = '@(x)';
func2 = strcat(func2, chaine2);
exp2 = str2func(func2);

% On génére des points qui serviront de données de test
x = [-5:0.001:5];

% Comme les fonction précedement crée ne sont pas faire pour
% renvoyer un tableau de valeur, on doit calculer tout les points
% un à un
y = zeros(1, numel(x));
y2 = zeros(1, numel(x));
for i=1:numel(x)
    y(i) = exp1(x(i));
    y2(i) = exp2(x(i));
end

% On affiche l'erreur d'interpolation
plot(x, abs(y - exp(x)), 'color', 'b'); hold on;
plot(x, abs(y2 - exp(x)), 'color', 'r');

% Un peu de présentation
title('Erreur d''interpolation');
xlabel('x');
ylabel('y');
