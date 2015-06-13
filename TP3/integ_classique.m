function [ In ] = integ_classique( type, A, B, N, f)
%INTEG_CLASSIQUE Summary of this function goes here
%   Detailed explanation goes here

switch type
    case 0
        In = integ_rectangle(A, B, N, f);
    case 1
        In = integ_millieu(A, B, N, f);
    case 2
        In = integ_trapeze(A, B, N, f);
    case 3
        In = integ_simpson(A, B, N, f);
end

end

