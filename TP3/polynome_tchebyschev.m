function [ tchebyschev ] = polynome_tchebyschev( k )
%POLYNOME_TCHEBYSCHEV Summary of this function goes here
%   Detailed explanation goes here
syms x;

tchebyschev = sym(zeros(1, k+1));

tchebyschev(1) = 1;
if k >= 1
    tchebyschev(2) = x;
end

for i=3:k+1
    tchebyschev(i) = 2*x*tchebyschev(i-1)-tchebyschev(i-2);
end

end

