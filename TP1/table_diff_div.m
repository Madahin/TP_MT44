function [ tab ] = table_diff_div( x, y )

sizeX = numel(x);
sizeY = numel(y);

if (sizeX ~= sizeY)
    % echoue
end

tab = [x', y', zeros(sizeX, sizeX-1)];
gap = 1;

for i = 1:sizeX-1
    for j = 1:sizeY-i
        tab(j, i+2) = (tab(j+1, i+1) - tab(j, i+1)) / (tab(j+gap, 1) - tab(j, 1));
    end
    gap = gap + 1;
end
end

