function [ val ] = evaluation1( n, a, c, t )

val = 0;
for i = 0:n-1
    prod = Product(i, t, c) * a(i+1);
    val = val + prod;

end

