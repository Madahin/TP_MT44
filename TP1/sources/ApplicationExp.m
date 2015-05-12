% On cree le vecteur des abscisses des points de support
X1 = [-1:2/7:1];

% On recupere le vecteur des ordonnees des points de support
Y1 = exp(X1);

% On recupere les composantes et le polynome d'interpolation
% correspondant aux vecteurs precedemment crees
[composante, chaine1] = interpol(8, X1, Y1);

% On affiche le polynome d'interpolation
disp(chaine1);

% On genere le vecteur des abscisses des points de support
% grace aux points de Tchebyschev
X2 = zeros(1, 8);
for j=0:7
    X2(j+1) = cos((2*j + 1)/8 * pi / 2);
end

X2 = sort(X2);

% On recupere le vecteur des ordonnees des points de support
% de Tchebyschev
Y2 = exp(X2);

% On recupere les composantes et le polynome d'interpolation
% correspondant aux vecteurs precedemment crees
[composante, chaine2] = interpol(8, X2, Y2);

% On affiche le polynome d'interpolation
disp(chaine2);

% On affiche la fonction exp et les deux polynomes d'interpolation
func1 = '@(x)';
func1 = strcat(func1, chaine1);
exp1 = str2func(func1);

func2 = '@(x)';
func2 = strcat(func2, chaine2);
exp2 = str2func(func2);

x = [-5:0.001:5];

y = zeros(1, numel(x));
y2 = zeros(1, numel(x));
for i=1:numel(x)
    y(i) = exp1(x(i));
    y2(i) = exp2(x(i));
end

plot(x, exp(x), 'color', 'b'); hold on;
plot(x, y, 'color', 'r'); hold on;
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
2.2967+2.0071*(x-(0.83147))+0.85442*(x-(0.83147))*(x-(0.55557))+0.23925*(x-(0.83147))*(x-(0.55557))*(x-(0.19509))+0.050231*(x-(0.83147))*(x-(0.55557))*(x-(0.19509))*(x-(-0.19509))+0.0085416*(x-(0.83147))*(x-(0.55557))*(x-(0.19509))*(x-(-0.19509))*(x-(-0.55557))+0.0012392*(x-(0.83147))*(x-(0.55557))*(x-(0.19509))*(x-(-0.19509))*(x-(-0.55557))*(x-(-0.83147))NaN*(x-(0.83147))*(x-(0.55557))*(x-(0.19509))*(x-(-0.19509))*(x-(-0.55557))*(x-(-0.83147))*(x-(-0.98079))

%}

