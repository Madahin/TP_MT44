function dilatation_alpha( centre, k )
%DILATATION_ALPHA affiche un dilate de rapport k du symbole alpha par un
%centre choisis.

    % Coordonnees des point de controle d'une courbe de bezier representant
    % alpha.
    P0 = [1,1];
    P1 = [0.5,-2];
    P2 = [0.5,3];
    P3 = [1,0];
    
    % Coordonnees des point de controle d'une courbe de bezier representant
    % alpha dilate par un rapport k sur un centre choisis.
    mP0 = (P0-centre)*k;
    mP1 = (P1-centre)*k;
    mP2 = (P2-centre)*k;
    mP3 = (P3-centre)*k;
    
    % On affiche l'alpha original ainsi que le nouveau symbole dilate
    creation_alpha(mP0,mP1,mP2,mP3);

    title(sprintf('Dilatation de centre [%i,%i] et de rapport %i', centre(1), centre(2), k));
end

