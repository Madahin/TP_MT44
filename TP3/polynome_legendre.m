function [ legendre ] = polynome_legendre( k)
%POLYNOME_LEGENDRE Summary of this function goes here
%   Detailed explanation goes here

syms x;

legendre = sym(zeros(1, k+1));

legendre(1) = 1;
if k >= 1
    legendre(2) = x;
end

for i=3:k+1
    legendre(i) = (2*(i-1)+1) / (i) * x * legendre(i-1) - (i-1) / (i) * legendre(i-2);
end


end

