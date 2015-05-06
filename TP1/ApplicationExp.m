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

%{

OUTPUT

Polynome d'interpolation de la fonction exp sur le support X1
0.36788+0.42582*(x-(-1))+0.24644*(x-(-1))*(x-(-0.71429))+0.095084*(x-(-1))*(x-(-0.71429))*(x-(-0.42857))+0.027515*(x-(-1))*(x-(-0.71429))*(x-(-0.42857))*(x-(-0.14286))+0.0063696*(x-(-1))*(x-(-0.71429))*(x-(-0.42857))*(x-(-0.14286))*(x-(0.14286))+0.0012288*(x-(-1))*(x-(-0.71429))*(x-(-0.42857))*(x-(-0.14286))*(x-(0.14286))*(x-(0.42857))+0.00020319*(x-(-1))*(x-(-0.71429))*(x-(-0.42857))*(x-(-0.14286))*(x-(0.14286))*(x-(0.42857))*(x-(0.71429))

Polynome d'interpolation de la fonction exp sur le support X2 (Tchebyschev)
2.2967+1.8505*(x-(0.83147))+0.71776*(x-(0.83147))*(x-(0.38268))+0.18634*(x-(0.83147))*(x-(0.38268))*(x-(-0.19509))+0.037852*(x-(0.83147))*(x-(0.38268))*(x-(-0.19509))*(x-(-0.70711))+0.0066099*(x-(0.83147))*(x-(0.38268))*(x-(-0.19509))*(x-(-0.70711))*(x-(-0.98079))+0.0010489*(x-(0.83147))*(x-(0.38268))*(x-(-0.19509))*(x-(-0.70711))*(x-(-0.98079))*(x-(-0.92388))+0.00015486*(x-(0.83147))*(x-(0.38268))*(x-(-0.19509))*(x-(-0.70711))*(x-(-0.98079))*(x-(-0.92388))*(x-(-0.55557))

%}

