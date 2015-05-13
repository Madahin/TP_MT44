n = 3;
a = [1.5709 0.0006 0.00012];
c = [1 4 6];
t = 3.5;

[val nouv_a nouv_c] = evaluation(n,a,c,t)


%{ 

OUTPUT

testevaluation

val = 1.5722


nouv_a = 1.5722    0.0005    0.0001         0


nouv_c = 3.5000    1.0000    4.0000


%}