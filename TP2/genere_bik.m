function [ Bik ] = genere_bik( noeud, k )
%GENERE_BIK Summary of this function goes here
%   Detailed explanation goes here
    if (k > 4) 
        error('k must be lower than 4.');
    end
    
    syms x;
    syms Bik;
    
    size = length(noeud);
    Bik = zeros(size-1,size-1,k);
    Bik = sym(Bik);
    for ktemp=1:k
        if ktemp == 1
            % Bi,0
            for i=1:size-1
                if (noeud(i)<=noeud(i) && noeud(i)<noeud(i+1))
                    Bik(i,i,1) = 1;
                end
            end
        else
           for i=1:size-ktemp
               if (noeud(i+ktemp-1) ~= noeud(i))
                    s1 = (x-noeud(i)).*Bik(i,:,ktemp-1)./(noeud(i+ktemp-1)-noeud(i));
               else
                   s1 = 0;
               end
               
               if (noeud(i+ktemp) ~= noeud(i+1))
                    s2 = (noeud(i+ktemp)-x).*Bik(i+1,:,ktemp-1)./(noeud(i+ktemp)-noeud(i+1));
               else
                   s2 = 0;
               end
               
               Bik(i,:, ktemp) = s1 + s2; 
           end
        end
    end
end

