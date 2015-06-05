function [ Bik ] = genere_bik( noeud, k, trace)
%GENERE_BIK Genere les Bik de degrer k pour un ensemble de noeud donnes.
%si trace est a 1, trace les polynome a l'ecran.

    % Specification de l'enoncer
    if (k+1 > 4) 
        error('k+1 must be lower than 4.');
    end
    
    % Comme les Bik sont des fonction, nous utilisont des variables
    % symboliques
    syms x;
    syms Bik;
    
    % On recupere le nombres de noeud et on alloue de la memoire.
    Length = length(noeud);
    Bik = zeros(Length-1,Length-1,k+1);
    Bik = sym(Bik);
    
    % On asssigne 1 au intervale entre chaque noeuds
    for i=1:Length-1
        if (noeud(i)<=noeud(i) && noeud(i)<noeud(i+1))
            Bik(i,i,1) = 1;
        end
    end
    
    
    for ktemp=2:k+1
        % pour tout les Bik de degre ktemp
        for i=1:Length-ktemp
            % Si l'interval n'est pas nul
            if (noeud(i+ktemp-1) ~= noeud(i))
                % On calcule les deux terme de la formule de recurence.
                s1 = (x-noeud(i)).*Bik(i,:,ktemp-1)./(noeud(i+ktemp-1)-noeud(i));
                s2 = (noeud(i+ktemp)-x).*Bik(i+1,:,ktemp-1)./(noeud(i+ktemp)-noeud(i+1));
            else
                s1 = 0;
                s2 = 0;
            end
            % On calcule B(i, ktemp)
            Bik(i,:, ktemp) = s1 + s2; 
        end
    end
   
    if trace == 1
        % On prend le nombre de nos Bik
        d = size(Bik);
        % On cree une nouvelle figure
        figure
        % Pour chaque Bik (d(1) correspondant au nombre de noeud, en lui
        % retranchant k, on obtient uniquement les Bik de degre 4-k)
        for i=1:d(1)-k
            
            subplot(d(1)-k, 1, i)
            for j=1:d(2) 
                % On recupere l'interval entre deux noeuds 
                X = [noeud(j) noeud(j+1)];
                if (Bik(i,j,k+1) ~= 0)
                    % Dans le cas ou k vos 0, matlabFunction genere la
                    % fonction '$@$()1' qui n'est pas utilisable avec fplot.
                    % Nous generons donc nous meme une fonction dans ce cas
                    % la.
                    sn = matlabFunction(Bik(i,j,k+1));
                    if k==0
                        sn = str2func('$@$(x)1');
                    end
                    fplot(sn,X); hold on;
                end
            end
            % On dit a matlab de limiter les graphique a l'interval entre
            % deux noeuds
            xlim([noeud(1) noeud(Length)]);
            title(sprintf('B-Splines de degre %i pour i = %i', k+1-1, i-1));
        end
    end
    
end

