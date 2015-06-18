function [ In ] = integration_gaussienne( type, nb_points, r )
%INTEGRATION_GAUSSIENNE Calcule l'integration de la fonction symbolique
%regularise r avec nb_points points en utilisant la methode type,
%pour les valeurs :
%0 -> Legendre
%1 -> Tchebyschev

    In = 0;
    % On transoforme la fonction symbolique en fonction de matlab
    r = matlabFunction(r);
    switch type
    case 0
        % Integration Legendre
        % On recupere les polynomes de Legendre pour le nombres de points
        % donne
        poly_legendre = polynome_legendre(nb_points);
        % On alloue un peu de memoire pour contenir les racine des
        % polynomes
        zeros_legendre = zeros(nb_points-1, nb_points-1);
        for i=2:nb_points
            % On calcule les zeros des polynomes de Legendre
            % solve n'est plus capable de trouver les racine a partire d'un
            % polynome de degre 9. On utilise donc roots qui prend en parametre
            % les coefficien du polynome, qui sont donnee par sym2poly
            rootsPoly = double(roots(sym2poly((poly_legendre(i)))));
            zeros_legendre(:, i-1) = [rootsPoly; zeros(nb_points-i, 1)];
        end
        % On s'interesse a la transpose de la matrice
        zeros_legendre = zeros_legendre';
        % On calcules les coefficients de Legendre
        coefficients_legendre = coeff_legendre(poly_legendre, zeros_legendre);
        
        for i=1:nb_points-1
            % On recupere la ieme racine des polynome de Legendre
            xi = double(zeros_legendre(nb_points-1, i));
            % On applique la formule 
            In = In + coefficients_legendre(nb_points-1, i)*r(xi);
        end
    case 1
        % Integration Tchebyschev
        % On alloue un peu de memoire
        zeros_tchebyschev = zeros(nb_points-1, nb_points-1);
        % On calcule les polynomes de Tchebyschev
        poly_tchebyschev = polynome_tchebyschev(nb_points);
        % On calcule les racines des polynomes. On n'utilise pas solve pour les meme raison que pour
        % les racines de Legendre
        for i=2:nb_points
            zeros_tchebyschev(:, i-1) = [roots(sym2poly(poly_tchebyschev(i))); zeros(nb_points-i, 1)];
        end
        % On s'interesse a la transpose de la matrice
        zeros_tchebyschev = zeros_tchebyschev';
        % On calcule les coefficients de Tchebyschev
        coefficients_tchebyschev = coeff_tchebyschev(zeros_tchebyschev);
        
        for i=1:nb_points-1
            % On recupere nos xi
            xi = double(zeros_tchebyschev(nb_points-1, i));
            % On applique la formule
            In = In + coefficients_tchebyschev(nb_points-1)*r(xi) * sqrt(1-xi^2);
        end
    end
end

