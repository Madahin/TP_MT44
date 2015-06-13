function [ In ] = integ_classique( type, A, B, N, f)
%INTEG_CLASSIQUE calcule l'integration numerique en N points de la fonction f (chaine de caractere) entre 
%A et B (B > A)pour un type donnee.
%Type :
%0 -> methode des rectangles
%1 -> methode des points millieu
%2 -> methode des trapeze
%3 -> methode de simpson

switch type
    case 0
        In = integ_rectangle(A, B, N, f);
    case 1
        In = integ_millieu(A, B, N, f);
    case 2
        In = integ_trapeze(A, B, N, f);
    case 3
        In = integ_simpson(A, B, N, f);
end

end

