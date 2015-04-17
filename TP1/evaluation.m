function [ val, nouv_a, nouv_c ] = evaluation( n, a, c, t )
%EVALUATION Summary of this function goes here
%   Detailed explanation goes here

% Memory alloc
nouv_a = zeros(1, n+1);
nouv_c = zeros(1, n);

nouv_c(1) = t;

nouv_a(n) = a(n);
for i = n-1:-1:1
    nouv_c(i+1) = c(i);
    nouv_a(i) = a(i) + (t-c(i)) * nouv_a(i+1);
end
val = nouv_a(1);

end
