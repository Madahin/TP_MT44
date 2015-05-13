x = [1 4 6];
y = [1.5709 1.5727 1.5751];
n = 3;

[composante chaine] = interpol(n,x,y)


%{

OUTPUT

testinterpol

composante =

    1.5709    0.0006    0.0001


chaine =

1.5709+0.0006*(x-(1))+0.00012*(x-(1))*(x-(4))

%}
