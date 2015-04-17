% On définit les données d'un polynôme
% d'interpolation vu en TD
n = 3;
a = [1.5709 0.0006 0.00012];
c = [1 4 6];
t = 3.5;


% Pour avoir des données correctes, on test
% la fonction 1000 fois et on regarde la moyenne
% du temps d'execution
sum1 = 0;
for z=0:1000
    tic;
    evaluation1(n, a, c, t);
    sum1 = sum1 + toc; 
end
elapsed1 = sum1/1000;


% Même chose que pour evaluation1
sum2 = 0;
for z=0:1000
    tic;
    evaluation(n, a, c, t);
    sum2 = sum2 + toc;
end
elapsed2 = sum2 / 1000;


% On affiche les valeurs
disp(elapsed1);
disp(elapsed2);