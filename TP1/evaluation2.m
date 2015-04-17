function vars = evaluation2( n, a, c, t )
% EVALUATION2 version matricelle de évaluation(n, a, c, t)

PNumber = numel(t);
vars = zeros(1, PNumber);

for i = 1:PNumber
    vars(i) = evaluation(n, a, c, t(i));
end
end

