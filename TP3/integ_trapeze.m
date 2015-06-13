function [ In ] = integ_trapeze( A, B, N, f )
%INTEG_TRAPEZ Retourne le resultat de l'integration par methode des trapeze
%de la fonction f (chaine de caractere) dans l'interval [A, B] avec
%N points

    % On calcule la taille d'un interval
    h = (B-A) / N;
    % On transforme la chaine de caractere en fonction
    func = str2func(['@(x)' f]);
    
    % On applique la methode des trapeze
    In = h/2 * (func(A) + func(B));
    for i=1:N-1
        In = In + func(A+i*h);
    end
    In = In * h;

end

