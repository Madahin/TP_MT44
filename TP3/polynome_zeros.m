clear;
clc;

n_max=3;

poly_legendre = polynome_legendre(n_max);
poly_tchebyschev = polynome_tchebyschev(n_max);
zeros_legendre = zeros(n_max-1, n_max-1);
zeros_tchebyschev = zeros(n_max-1, n_max-1);

for i=2:n_max
    zeros_legendre(:, i-1) = [solve(poly_legendre(i)); zeros(n_max-i, 1)];
    zeros_tchebyschev(:, i-1) = [solve(poly_tchebyschev(i)); zeros(n_max-i, 1)];
end

zeros_legendre = zeros_legendre';
zeros_tchebyschev = zeros_tchebyschev';
coefficients_legendre = coeff_legendre(poly_legendre, zeros_legendre);
coefficients_tchebyschev = coeff_tchebyschev(zeros_tchebyschev);

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
