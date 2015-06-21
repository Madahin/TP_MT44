function [ w ] = coeff_legendre( polynomes , roots)    
%COEFF_LEGENDRE Calcule les coefficients de Legendre
    
    n = 0;
    [x y] = size(roots);
    
    % On alloue un peu de memoire
    w = zeros(x,y);
    dec = y - 1;
    
    for i=1:x
        if i ~= 1
            % On calcule la derivee des polynomes orthogonaux
            ln1 = diff(polynomes(i+1),1);
            % Le tableau des polynomes sont des symboles, on les
            % transforme donc en fonctions
            ln2 = matlabFunction(polynomes(i));
            ln1 = matlabFunction(ln1);
            % On calcule le coefficient pour chaque xi
            for j=1:y-dec
                % On calcule xi
                xi = roots(n+1,j);
                % On applique la formule
                denominateur = (n+1)*ln1(xi)*ln2(xi);
                w(i,j)=2/denominateur; 
            end
        else % Cas particulier quand i = 1
            ln1 = 1;
            ln2 = 1;
            for j=1:y-dec
               denominateur = (n+1)*ln1*ln2;
               w(i,j)=2/denominateur; 
            end
        end
        dec = dec - 1;
        n = n+1;
    end
end
