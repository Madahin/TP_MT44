clear;
clc;

n=5;

poly_legendre = polynome_legendre(n);
poly_tchebyschev = polynome_tchebyschev(n);
zeros_legendre = zeros(n, n-1);
zeros_tchebyschev = zeros(n, n-1);

for i=2:n
    zeros_legendre(:, i-1) = [solve(poly_legendre(i)); zeros(n-i+1, 1)];
    zeros_tchebyschev(:, i-1) = [solve(poly_tchebyschev(i)); zeros(n-i+1, 1)];
end

zeros_legendre = zeros_legendre';
zeros_tchebyschev = zeros_tchebyschev';

disp('racines des polynomes de Legendre')
disp(zeros_legendre)
disp('racines des polynomes de Tchebyschev')
disp(zeros_tchebyschev)
