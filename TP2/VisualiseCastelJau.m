function VisualiseCastelJau( Points, t )
%VISUALISECASTELJAU Summary of this function goes here
%   Detailed explanation goes here

[x, y] = CastelJau(Points, t);



for i=1:2:numel(Points)
    plot(Points(i), Points(i+1), '*');
    hold on;
end


plot(x, y);
end

