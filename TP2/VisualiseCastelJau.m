function visualisecasteljau( Points, t )
%VISUALISECASTELJAU Summary of this function goes here
%   Detailed explanation goes here

Pn = casteljau(Points, t);
[numberRows numberCols] = size(Pn);

cc=hsv(12);
dec = 0;
for i=1:numberRows 
    Row = Pn(i,:);
    for j=1:2:numberCols-(2*dec)
       plot(Row(j), Row(j+1), '*', 'color', cc(i,:));
       if j~= 1
          hold on;
          plot([Row(j-2) Row(j)], [Row(j-1) Row(j+1)],  'color', cc(i,:)); 
       end
       hold on;
        
    end
    pause(1);
    dec = dec+1;
end

end

