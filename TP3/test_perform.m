clear;
clc;

% definition de quelques constantes
% couleurs des courbes
color = ['r', 'g', 'b', 'c'];

% nombre de tests
N = 150;

% definition des fonctions a integrer ainsi que de leur intervalle
% d'integration
f = ['sin(x)   ';'1/(1+x^2)';'x^3+x    '];
A = [0, 0, 0];
B = [pi/2, 1, 1];

% Il nous faut une variable symbolique pour calculer l'integrale 'exacte'
% dans un intervalle donne
syms x;

% recupere le nombre de fonctions a integrer disponible
nbFunc = size(f);
nbFunc = nbFunc(1);

% On alloue de la memoire pour stocker les valeurs temporels
timeSpend = zeros(nbFunc, 4, N);

% Nombre de fois ou une integration est repetee. Plus ce nombre est grand, plus
% le calcul du temps est exact.
Prec = 1;

for n=1:nbFunc;
    for i=0:3
        % Comme les calculs peuvent etre long (suivant la valeur de Prec)
        % on ajoute ecrit a l'ecran une indication de l'avancement
        disp(['func : ' f(n, :) ' type : ' num2str(i)]);
        for j=1:N
            % On reproduit chaque calcul Prec fois
            for k=1:Prec
                % On mesure le temps d'un calcul
                tic;
                integ_classique(i, A(n), B(n), j, f(n, :));
                % On fait la somme de toutes les mesures
                timeSpend(n, i+1, j) = timeSpend(n, i+1, j) + toc;
            end
            % On divise la somme des mesures par le nombre de mesures,
            % Concretement, on fait la moyenne des mesures pour se
            % rapprocher le plus possible de la realite. C'est a dire
            % eliminer le 'bruit' produit par tout les programmes alentours
            % lorsque matlab opere les calculs.
            timeSpend(n, i+1, j) = timeSpend(n, i+1, j) / Prec;
        end
    end
end

% Etrangement, plot ne peut pas utiliser de matrices (1, 1, N) comme une
% matrice (1, N). Il faut donc copier nos donnees vers une matrice de
% taille adequate
tabTime = zeros(1, N);
for i=1:nbFunc
    for j=1:4
        % On copie les donnees comme explique precedemment
        for n=1:N
            tabTime(n) = timeSpend(i, j, n);
        end
        % On trace le temps que met une integrale a etre calcule en
        % fonction du nombre de points
        subplot(nbFunc, 1, i);
        plot(tabTime, 'color', color(j));
        title(f(i, :)); 
        ylabel('secondes'); 
        xlabel('nombre de points');
        % Les warnings n'ont aucune importance
        legend('integ rectangle', 'integ millieu', 'integ trapeze', 'integ simpson');
        hold on;
    end
end