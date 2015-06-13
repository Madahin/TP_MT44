function [ In ] = integ_simpson( A, B, N, f )
%INTEG_SIMPSON Summary of this function goes here
%   Detailed explanation goes here
    h = (B-A) / N;
 
    func = str2func(['@(x)' f]);
    
    
    In = 0;
    
    for i=0:N-1
        In = In + func(A+i*h + h/2);
    end
    In = In * 2;
    
    for i=1:N-1
        In = In + func(A + i*h);
    end
    In = (In * 2 + func(A) + func(B)) * h / 6;
end

