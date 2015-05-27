function [ Bik ] = genere_bik( noeud, k, trace)
%GENERE_BIK Summary of this function goes here
%   Detailed explanation goes here
    if (k+1 > 4) 
        error('k+1 must be lower than 4.');
    end
    
    syms x;
    syms Bik;
    
    Length = length(noeud);
    Bik = zeros(Length-1,Length-1,k+1);
    Bik = sym(Bik);
    for ktemp=1:k+1
        if ktemp == 1
            % Bi,0
            for i=1:Length-1
                if (noeud(i)<=noeud(i) && noeud(i)<noeud(i+1))
                    Bik(i,i,1) = 1;
                end
            end
        else
           for i=1:Length-ktemp
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
    
    if trace == 1
        d = size(Bik);
        figure
        for i=1:d(1)
            
            subplot(d(1), 1, i)
            for j=1:d(2) 
                
                X = [noeud(j) noeud(j+1)];
                if (Bik(i,j,k+1) ~= 0)
                    sn = matlabFunction(Bik(i,j,k+1));                
                    fplot(sn,X); hold on;
                end
            end
            xlim([noeud(1) noeud(Length)]);
            title(sprintf('B-Splines de degré %i pour i = %i', k+1-1, i-1));
        end
    end
end

