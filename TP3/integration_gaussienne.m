function [ In ] = integration_gaussienne( type, nb_points, r )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    r = matlabFunction(r);
    In = 0;
    switch type
    case 0
        % Intégration Legendre
        poly_legendre = polynome_legendre(nb_points);
        for i=2:nb_points
            zeros_legendre(:, i-1) = [solve(poly_legendre(i)); zeros(nb_points-i, 1)];
        end
        zeros_legendre = zeros_legendre';
        coefficients_legendre = coeff_legendre(poly_legendre, zeros_legendre);
        
        for i=1:nb_points-1
            xi = double(zeros_legendre(nb_points-1, i));    
            In = In + coefficients_legendre(nb_points-1, i)*r(xi);
        end
    case 1
        % Intégration Tchebyschev
        
    end

    



end

