function [ In ] = integ_millieu( A, B, N, f )
%INTEG_MILLIEU Summary of this function goes here
%   Detailed explanation goes here
    h = (B-A) / N;
 
    func = str2func(['@(x)' f]);
    
    In = 0;
    for i=0:N-1
        In = In + func(A+i*h + h / 2);
    end
    In = In * h;

end

