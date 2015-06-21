clear;
clc;

% definition de quelques constantes
% couleurs des courbes
color = ['r', 'b'];

% nombre de tests
N = 15;



% Il nous faut une variable symbolique pour calculer l'integrale 'exacte'
syms x;

% definition des fonctions a integrer
f = [sin(x);1/(1+x^2);exp(x)];

% Definition des titres
titles = ['sin(x)   ';'1/(1+x^2)';'exp(x)   '];

% recupere le nombre de fonctions a integrer disponible
nbFunc = size(f);
nbFunc = nbFunc(1);

for n=1:nbFunc
    % On calcule l'integrale 'exacte'
    integ_reel = int(f(n, :), x, -1, 1);
    for i=0:1
        % On alloue de la memoire pour contenir nos resultats
        integ_calc = zeros(1, N);
        for j=1:N
            % On calcule la valeur absolue de la difference entre nos
            % integrales numeriques et l'integrale 'exacte' pour la n-ieme
            % fonction, avec la i-eme methode, avec j nombres de points
            integ_calc(j) = abs(integ_reel - integration_gaussienne(i, j, f(n, :)));
        end
        % On dessine les courbes representant l'erreur en fonction du nombre
        % de points
        subplot(nbFunc, 1, n);
        plot(integ_calc, 'color', color(i+1));
        title(titles(n, :));
        % Les warnings n'ont aucune importance
        legend('gauss/legendre', 'gauss/tchebyschev');
        hold on;
    end
end