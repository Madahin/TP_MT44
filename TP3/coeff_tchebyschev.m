function [ w ] = coeff_tchebyschev( roots)    
    
    n = 0;
    [x y] = size(roots);
    
    % On alloue un peu de memoire
    w = zeros(x,1);
    
    % On applique la formule
    for i=1:x
        w(i) = pi/(n+1);
        n = n+1;
    end
    
end
