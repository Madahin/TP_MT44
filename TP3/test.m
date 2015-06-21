clear;
clc;

n_max=7;

poly_legendre = polynome_legendre(n_max);
poly_tchebyschev = polynome_tchebyschev(n_max);

zeros_legendre = zeros(n_max-1, n_max-1);
zeros_tchebyschev = zeros(n_max-1, n_max-1);

for i=2:n_max
   rootsPoly = double(roots(sym2poly((poly_legendre(i)))));
   zeros_legendre(:, i-1) = [rootsPoly; zeros(n_max-i, 1)];
   zeros_tchebyschev(:, i-1) = [roots(sym2poly(poly_tchebyschev(i))); zeros(n_max-i, 1)];

end

zeros_legendre = zeros_legendre';
zeros_tchebyschev = zeros_tchebyschev';
coefficients_legendre = coeff_legendre(poly_legendre, zeros_legendre);
coefficients_tchebyschev = coeff_tchebyschev(zeros_tchebyschev);

for i=1:n_max
    poly_legendre(i) = simplify(poly_legendre(i));
    poly_tchebyschev(i) = simplify(poly_tchebyschev(i));
end

disp('polynomes de Legendre')
disp(poly_legendre)
disp('racines des polynomes de Legendre')
disp(zeros_legendre)
disp('coefficients d''integration de Legendre')
disp(coefficients_legendre)

disp('polynomes de Tchebyschev')
disp(poly_tchebyschev)
disp('racines des polynomes de Tchebyschev')
disp(zeros_tchebyschev)
disp('coefficients d''integration de Tchebyschev')
disp(coefficients_tchebyschev)

%{
OUTPUT pour n = 5

polynomes de Legendre
[ 1, x, (3*x^2)/2 - 1/2, (x*(5*x^2 - 3))/2, (35*x^4)/8 - (15*x^2)/4 + 3/8, (x*(63*x^4 - 70*x^2 + 15))/8, (231*x^6)/16 - (315*x^4)/16 + (105*x^2)/16 - 5/16]
 
racines des polynomes de Legendre
         0         0         0         0         0         0
    0.5774   -0.5774         0         0         0         0
         0    0.7746   -0.7746         0         0         0
   -0.8611    0.8611   -0.3400    0.3400         0         0
         0   -0.9062   -0.5385    0.9062    0.5385         0
   -0.9325   -0.6612    0.9325    0.6612   -0.2386    0.2386

coefficients d'integration de Legendre
    2.0000         0         0         0         0         0
    1.0000    1.0000         0         0         0         0
    0.8889    0.5556    0.5556         0         0         0
    0.3479    0.3479    0.6521    0.6521         0         0
    0.5689    0.2369    0.4786    0.2369    0.4786         0
    0.1713    0.3608    0.1713    0.3608    0.4679    0.4679

polynomes de Tchebyschev
[ 1, x, 2*x^2 - 1, x*(4*x^2 - 3), 8*x^4 - 8*x^2 + 1, x*(16*x^4 - 20*x^2 + 5), 32*x^6 - 48*x^4 + 18*x^2 - 1]
 
racines des polynomes de Tchebyschev
         0         0         0         0         0         0
    0.7071   -0.7071         0         0         0         0
         0    0.8660   -0.8660         0         0         0
   -0.9239    0.9239   -0.3827    0.3827         0         0
         0   -0.9511   -0.5878    0.9511    0.5878         0
   -0.9659   -0.7071    0.9659    0.7071   -0.2588    0.2588

coefficients d'integration de Tchebyschev
    3.1416
    1.5708
    1.0472
    0.7854
    0.6283
    0.5236


%}
