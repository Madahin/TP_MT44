function [ output_args ] = rotation_alpha( centre, rotation )
%DILATATION_ALPHA Affiche le symbole alpha apres avoir subit une rotation
%(en radian) 

    % Coordonnees des point de controle d'une courbe de bezier representant
    % alpha.
    P0 = [1,1];
    P1 = [0.5,-2];
    P2 = [0.5,3];
    P3 = [1,0];
    
    % Futur coordonne de la rotation d'alpha.
    mP0 = [0,0];
    mP1 = [0,0];
    mP2 = [0,0];
    mP3 = [0,0];
    
    % On calcule les coordonner de nos point de controle en applicant une
    % rotation d'un centre donne
    mP0(1) = cos(rotation)*(P0(1)-centre(1)) - sin(rotation)*(P0(2)-centre(2)) + centre(1);
    mP0(2) = sin(rotation)*(P0(1)-centre(1)) + cos(rotation)*(P0(2)-centre(2)) + centre(2);
    
    mP1(1) = cos(rotation)*(P1(1)-centre(1)) - sin(rotation)*(P1(2)-centre(2)) + centre(1);
    mP1(2) = sin(rotation)*(P1(1)-centre(1)) + cos(rotation)*(P1(2)-centre(2)) + centre(2);
    
    mP2(1) = cos(rotation)*(P2(1)-centre(1)) - sin(rotation)*(P2(2)-centre(2)) + centre(1);
    mP2(2) = sin(rotation)*(P2(1)-centre(1)) + cos(rotation)*(P2(2)-centre(2)) + centre(2);
    
    mP3(1) = cos(rotation)*(P3(1)-centre(1)) - sin(rotation)*(P3(2)-centre(2)) + centre(1);
    mP3(2) = sin(rotation)*(P3(1)-centre(1)) + cos(rotation)*(P3(2)-centre(2)) + centre(2);

    % On affiche l'alpha originel ainsi que sa version rotee.
    creation_alpha(mP0,mP1,mP2,mP3);

    title(sprintf('Homothetie de centre [%i,%i] et de rapport d''angle %i', centre(1), centre(2), rotation));

end