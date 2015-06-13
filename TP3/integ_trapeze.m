function [ In ] = integ_trapeze( A, B, N, f )
%INTEG_TRAPEZ Summary of this function goes here
%   Detailed explanation goes here
    h = (B-A) / N;
 
    func = str2func(['@(x)' f]);
    
    In = h/2 * (func(A) + func(B));
    for i=1:N-1
        In = In + func(A+i*h);
    end
    In = In * h;

end

