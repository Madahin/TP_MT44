function VisualiseCastelJau( Px, Py, Pz, t )
%VISUALISECASTELJAU Summary of this function goes here
%   Detailed explanation goes here

[Pnx, Pny, Pnz] = CastelJau(Px, Py, Pz, t);

plot3(Px, Py, Pz, 'color', 'b');
hold on;
plot3(Pnx, Pny, Pnz, 'color', 'r');

end

