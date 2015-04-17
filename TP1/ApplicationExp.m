X1 = [-1:2/7:1];
Y1 = exp(X1);

[composante, chaine] = interpol(8, X1, Y1);

disp(chaine);

X2 = zeros(1, 8);
for j=1:8
    X2(j) = cos((2*j + j)/8 * pi / 2);
end

Y2 = exp(X2);

[composante, chaine] = interpol(8, X2, Y2);

disp(chaine);