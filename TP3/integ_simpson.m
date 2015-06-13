function [ In ] = integ_simpson( A, B, N, f )
%INTEG_SIMPSON Retourne le resultat de l'integration par methode de simpson
%de la fonction f (chaine de caractere) dans l'interval [A, B] avec
%N points

    % On calcule la taille d'un interval
    h = (B-A) / N;
    % On transforme la chaine de caractere en fonction
    func = str2func(['@(x)' f]);
    
    % On applique la methode des points millieu
    In = 0;
    for i=0:N-1
        In = In + func(A+i*h + h/2);
    end
    In = In * 2;
    
    for i=1:N-1
        In = In + func(A + i*h);
    end
    In = (In * 2 + func(A) + func(B)) * h / 6;
end

