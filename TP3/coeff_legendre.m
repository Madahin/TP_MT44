function [ w ] = coeff_legendre( polynomes , roots)    
    
    n = 0;
    [x y] = size(roots);
    
    w = zeros(x,y);
    dec = y - 1;
    
    for i=1:x
        if i ~= 1
            ln1 = diff(polynomes(i+1),1);
            ln2 = matlabFunction(polynomes(i));
            ln1 = matlabFunction(ln1);
            for j=1:y-dec
               xi = roots(n+1,j);
               denominateur = (n+1)*ln1(xi)*ln2(xi);
               w(i,j)=2/denominateur; 
            end
        else
            ln1 = 1;
            ln2 = 1;
            for j=1:y-dec
               denominateur = (n+1)*ln1*ln2;
               w(i,j)=2/denominateur; 
            end
        end
        dec = dec - 1;
        n = n+1;
    end
    
    


end

