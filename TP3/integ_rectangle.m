function [ In ] = integ_rectangle( A, B, N, f )
%INTEG_RECTANGLE Summary of this function goes here
%   Detailed explanation goes here

    h = (B-A) / N;
 
    func = str2func(['@(x)' f]);
    
    In = 0;
    for i=0:N-1
        In = In + func(A+i*h);
    end
    In = In * h;
end

