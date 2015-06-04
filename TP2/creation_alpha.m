function creation_alpha( P0,P1,P2,P3 )
%CREATION_ALPHA - Trace le symbole alpha ainsi qu'une autre courbe definie
%par les point de controle P0, P1, P2 et P3. Cela permet de comparer alpha
%avec ses transformation.
    
    oP0 = [1,1];
    oP1 = [0.5,-2];
    oP2 = [0.5,3];
    oP3 = [1,0];

    % On definit une variable symbolique pour pouvoir generer des fonctions
    % plutot que de simples nombres
    syms x;
    
    % On genere les fonctions representant les polynomes de Bernstein
    B = [(1-x)^3, 3*x*(1-x)^2, 3*x^2*(1-x), x^3 ];
    
    % On creer de nouvelles fonctions renvoyant le dilate de nos point par
    % le resultat des fonctions precedentes
    OM = P0*B(1) + P1*B(2) + P2*B(3) + P3*B(4);
    oOM = oP0*B(1) + oP1*B(2) + oP2*B(3) + oP3*B(4);
    
    % On genere 100 valeurs de t equidistante
    t = linspace(0,1);
    
    % On precise a matlab que les objets que nous avons definis precedement
    % sont des fonctions
    X = matlabFunction(OM(1));
    Y = matlabFunction(OM(2));
    
    oX = matlabFunction(oOM(1));
    oY = matlabFunction(oOM(2));
    
    % On trace le resultat de nos fonction
    plot(X(t),Y(t)); hold on;
    plot(oX(t),oY(t));
end

