function Bik=test(t,i,k,trace)
% GENERE_BIK Génération des fonctions Bik de b-splines
%   BIK = GENERE_BIK(T,I,K,0) fournit le vecteur ligne des fonctions Bik en
%   fonction de la b-spline voulue.
%
%   BIK = GENERE_BIK(T,I,K,1) effectue le même travail, et fait la
%   représentation graphique de Bik.

% Copyright 2006 Laurent COUVIDOU

if (k>4) error('k doit être inférieur ou égal à 4.'); end
if nargin < 4 trace = 0; end

if trace == 1 % paramètres du tracé
    kcolor = ['g' 'b' 'r' 'm', 'c']; % couleurs pour chaque k
    e = .01; % précision
end

syms Bik;
syms x;
m = size(t,2)-1;

% i, k demandé sont les extrémums des boucles
imax = i;
kmax = k;

% La suite
for k=0:kmax % 1->m-1   1->k

    if k==kmax fin=imax;
    else fin=m-k-2;
    end
    
    if k==0
        % Les Bi,0 -> identité
        Bik = eye(m-1,m)*x/x; % *x/x pour symbolique

    else
        for i=0:fin % 0->m-k-1 SAUF DERNIER K
            if t(i+k+1) == t(i+1) term1 = 0;
            else term1 = (x-t(i+1)).*Bik(i+1,:)./(t(i+k+1)-t(i+1));
            end
            if t(i+k+2) == t(i+2) term2 = 0;
            else term2 = (t(i+k+2)-x).*Bik(i+2,:)./(t(i+k+2)-t(i+2));
            end
            Bik(i+1,:) = term1 + term2;
        end
    end
    
    if trace==1
        % Tracé des Bi,k k>=0
        for i=0:fin
            if trace == 1
                for it=1:size(t,2)-1
                    X = t(1,it):e:t(1,it+1);
                    Y = subs(Bik(i+1,it),'x',X);
                    plot(X,Y,kcolor(k+1));
                    hold on;
                end
            end
        end
        %leg = sprintf('k = %d',k)
        %legend(leg);
    end
    
end

if trace == 1
    title(sprintf('Calcul progressif de B%d,%d pour t=%s',imax,kmax,mat2str(t)));
    hold off;
end

Bik = Bik(imax+1,:);

end
