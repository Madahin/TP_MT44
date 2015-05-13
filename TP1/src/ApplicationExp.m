% On cree le vecteur des abscisses des points de support
X1 = [-1:2/7:1];

% On recupere le vecteur des ordonnees des points de support
Y1 = exp(X1);

% On recupere les composantes et le polynome d'interpolation
% correspondant aux vecteurs precedemment crees
[composante1, chaine1] = interpol(8, X1, Y1);

% On affiche le polynome d'interpolation
disp(chaine1);

% On genere le vecteur des abscisses des points de support
% grace aux points de Tchebyschev
X2 = zeros(1, 8);
for j=0:7
    X2(j+1) = cos(((2*j + 1)/8) * (pi / 2));
end

% On recupere le vecteur des ordonnees des points de support
% de Tchebyschev
Y2 = exp(X2);

% On recupere les composantes et le polynome d'interpolation
% correspondant aux vecteurs precedemment crees
[composante2, chaine2] = interpol(8, X2, Y2);

% On affiche le polynome d'interpolation
disp(chaine2);

% On affiche la fonction exp et les deux polynomes d'interpolation
x = [-10:0.001:10];

y1 = evaluation2(7, composante1, X1, x);
y2 = evaluation2(7, composante2, X2, x);

plot(x, exp(x), 'color', 'b'); hold on;
plot(x, y1, 'color', 'r'); hold on;
plot(x, y2, 'color', 'g');

title('Comparaison des courbes');
xlabel('x');
ylabel('y');
legend('exp', 'exp1', 'exp2');


%{

OUTPUT

Polynome d'interpolation de la fonction exp sur le support X1
0.36788+0.42582*(x-(-1))+0.24644*(x-(-1))*(x-(-0.71429))+0.095084*(x-(-1))*(x-(-0.71429))*(x-(-0.42857))+0.027515*(x-(-1))*(x-(-0.71429))*(x-(-0.42857))*(x-(-0.14286))+0.0063696*(x-(-1))*(x-(-0.71429))*(x-(-0.42857))*(x-(-0.14286))*(x-(0.14286))+0.0012288*(x-(-1))*(x-(-0.71429))*(x-(-0.42857))*(x-(-0.14286))*(x-(0.14286))*(x-(0.42857))+0.00020319*(x-(-1))*(x-(-0.71429))*(x-(-0.42857))*(x-(-0.14286))*(x-(0.14286))*(x-(0.42857))*(x-(0.71429))

Polynome d'interpolation de la fonction exp sur le support X2 (Tchebyschev)
2.6665+2.477*(x-(0.98079))+1.1051*(x-(0.98079))*(x-(0.83147))+0.31911*(x-(0.98079))*(x-(0.83147))*(x-(0.55557))+0.067918*(x-(0.98079))*(x-(0.83147))*(x-(0.55557))*(x-(0.19509))+0.011512*(x-(0.98079))*(x-(0.83147))*(x-(0.55557))*(x-(0.19509))*(x-(-0.19509))+0.0016393*(x-(0.98079))*(x-(0.83147))*(x-(0.55557))*(x-(0.19509))*(x-(-0.19509))*(x-(-0.55557))+0.00020399*(x-(0.98079))*(x-(0.83147))*(x-(0.55557))*(x-(0.19509))*(x-(-0.19509))*(x-(-0.55557))*(x-(-0.83147))

%}

