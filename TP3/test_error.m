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

for n=1:nbFunc
    % On calcule l'integrale 'juste'
    integ_reel = int(f(n, :), x, A(n), B(n));
    for i=0:3
        % On alloue de la memoire pour contenir nos resultat
        integ_calc = zeros(1, N);
        for j=1:N
            % On calcule la valeur absolue de la difference entre nos
            % integrale numerique et l'integrale 'juste' pour la nieme
            % fonction, avec la ieme methode, avec j nombre de points
            integ_calc(j) = abs(integ_reel - integ_classique(i, A(n), B(n), j, f(n, :)));
        end
        % On dessine les courbe representant l'erreur en fonction du nombre
        % de points
        subplot(nbFunc, 1, n);
        plot(integ_calc, 'color', color(i+1));
        % Les warning n'on aucune importances
        legend('integ rectangle', 'integ millieu', 'integ trapeze', 'integ simpson');
        title(f(n, :));
        hold on;
    end
end