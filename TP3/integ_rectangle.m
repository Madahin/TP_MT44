function [ In ] = integ_rectangle( A, B, N, f )
%INTEG_RECTANGLE Retourne le resultat de l'integration par methode des
%rectangle de la fonction f (chaine de caractere) dans l'interval [A, B] 
%avec N points

    % On calcule la taille d'un interval
    h = (B-A) / N;
    % On transforme la chaine de caractere en fonction
    func = str2func(['@(x)' f]);
    
    % On applique la methode des rectangles
    In = 0;
    for i=0:N-1
        In = In + func(A+i*h);
    end
    In = In * h;
end

