clear;
clc;

% definition de quelques constantes
% couleurs des courbes
color = ['r', 'g', 'b', 'c'];

% nombre de tests
N = 150;

% definition des fonctions a integrer ainsi que de leurs espace
% d'integration
f = ['sin(x)   ';'1/(1+x^2)';'x^3+x    '];
A = [0, 0, 0];
B = [pi/2, 1, 1];

% Il nous faut une variable symbolique pour calculer l'integral 'juste'
% dans un interval donne
syms x;

% recupere le nombre de fonction a integrer disponnible
nbFunc = size(f);
nbFunc = nbFunc(1);

% On alloue de la memoire pour stocker les valeur temporels
timeSpend = zeros(nbFunc, 4, N);

% Nombre de fois ou une integration est repeter. Plus ce nombre est grand, plus
% le calcule du temps est juste.
Prec = 1;

for n=1:nbFunc;
    for i=0:3
        % Comme les calcules peuvent etre long (suivant la valeur de Prec)
        % on ajoute ecrit a l'ecran une indication de l'avancement
        disp(['func : ' f(n, :) ' type : ' num2str(i)]);
        for j=1:N
            % On reproduit chaque calcule Prec fois
            for k=1:Prec
                % On mesure le temps d'un calcule
                tic;
                integ_classique(i, A(n), B(n), j, f(n, :));
                % On fait la somme de toutes les mesures
                timeSpend(n, i+1, j) = timeSpend(n, i+1, j) + toc;
            end
            % On divise la somme des mesure par le nombre de mesure,
            % Concretement, on fait la moyenne des mesure pour se
            % rapprocher le plus possible de la realiter. C'est a dire
            % eliminer le 'bruit' produit par tout les programmes alentour
            % lorsque matlab opere les calcules.
            timeSpend(n, i+1, j) = timeSpend(n, i+1, j) / Prec;
        end
    end
end

% Etrangement, plot ne peu pas utiliser de matrice (1, 1, N) comme une
% matrice (1, N). Il faut donc copier nos donnees vers une matrice de
% taille adequate
tabTime = zeros(1, N);
for i=1:nbFunc
    for j=1:4
        % On copie les donnees comme expliquer precedement
        for n=1:N
            tabTime(n) = timeSpend(i, j, n);
        end
        % On trace le temps que met une integrale a etre calculer en
        % fonction du nombre de points
        subplot(nbFunc, 1, i);
        plot(tabTime, 'color', color(j));
        title(f(i, :));
        % Les warning n'on aucune importances
        legend('integ rectangle', 'integ millieu', 'integ trapeze', 'integ simpson');
        hold on;
    end
end