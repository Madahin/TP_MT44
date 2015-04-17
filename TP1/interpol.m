function [ composante, chaine ] = interpol( n, x, y )

table = table_diff_div(x, y);

composante = zeros(1, n);

chaine = '';

for i=2:1:n+1
    composante(i-1) = table(1, i);
end

%disp(composante);

for i=1:n
    chaine = strcat(chaine, num2str(composante(i)));
    for j=1:i-1
        chaine = strcat(chaine, '*(');
        chaine = strcat(chaine, 'x-(');
        chaine = strcat(chaine, num2str(x(j)));
        chaine = strcat(chaine, '))');
    end
    if (i < n) && (composante(i+1)>=0) 
        chaine = strcat(chaine, '+');
    end
end
end

