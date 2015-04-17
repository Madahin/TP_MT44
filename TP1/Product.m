function [ prod ] = Product( i, x, c )
%PRODUCT Summary of this function goes here
%   Detailed explanation goes here

prod = 1;
for j = 1:i
   prod = prod * (x-c(i));
end

end
