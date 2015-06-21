function [ In ] = integ_milieu( A, B, N, f )
%INTEG_MILLIEU Retourne le resultat de l'integration par methode des points
%milieux de la fonction f (chaine de caractere) dans l'intervalle [A,B] avec
%N points

    % On calcule la taille d'un intervalle
    h = (B-A) / N;
    % On transforme la chaine de caractere en fonction
    func = str2func(['@(x)' f]);
    
    % On applique la methode des points milieux
    In = 0;
    for i=0:N-1
        In = In + func(A+i*h + h / 2);
    end
    In = In * h;

end

