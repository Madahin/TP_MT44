function VisualiseCastelJau( Px, Py, Pz, t )
%VISUALISECASTELJAU Represente la construction d'une courbe de bezier ainsi
%que sa construction

% On calcule les points finaux
[Pnx, Pny, Pnz] = CastelJau(Px, Py, Pz, t);

%  On trace une droite passant par nos point originaux
plot3(Px, Py, Pz, 'color', 'b');
hold on;
% On trace notre courbe de bezier.
plot3(Pnx, Pny, Pnz, 'color', 'r');

end

