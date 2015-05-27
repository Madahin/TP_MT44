function [ output_args ] = creation_alpha( input_args )
%CREATION_ALPHA Summary of this function goes here
%   Detailed explanation goes here

    %   P0 = input('P0');
    %   P1 = input('P1');
    %   P2 = input('P2');
    %   P3 = input('P3');
    P0 = [1,1];
    P1 = [0.5,-2];
    P2 = [0.5,3];
    P3 = [1,0];
  
    syms x;
    
    B = [(1-x)^3, 3*x*(1-x)^2, 3*x^2*(1-x), x^3 ];
    
    OM = [0,0];
    OM = P0*B(1) + P1*B(2) + P2*B(3) + P3*B(4);
    
    t = linspace(0,1);
    
    X = matlabFunction(OM(1));
    Y = matlabFunction(OM(2));
    
    plot(X(t),Y(t));

    
    
    
    
    


end

