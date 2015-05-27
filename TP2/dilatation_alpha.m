function [ output_args ] = dilatation_alpha( centre, k )
%DILATATION_ALPHA Summary of this function goes here
%   Detailed explanation goes here

    P0 = [1,1];
    P1 = [0.5,-2];
    P2 = [0.5,3];
    P3 = [1,0];
    
    mP0 = (P0-centre)*k;
    mP1 = (P1-centre)*k;
    mP2 = (P2-centre)*k;
    mP3 = (P3-centre)*k;
    
    creation_alpha(mP0,mP1,mP2,mP3);

    title(sprintf('Dilatation de centre [%i,%i] et de rapport %i', centre(1), centre(2), k));

end

