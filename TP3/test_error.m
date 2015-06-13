%clear;
clc;

color = ['r', 'g', 'b', 'c'];

N = 150;

nbPoints = linspace(1, N, N);

f = ['sin(x)   ';'1/(1+x^2)';'x^3+x    '];
A = [0, 0, 0];
B = [pi/2, 1, 1];

syms x;

nbFunc = size(f);
nbFunc = nbFunc(1);

for n=1:nbFunc;
    integ_reel = int(f(n, :), x, A(n), B(n));
    for i=0:3
        integ_calc = zeros(1, numel(nbPoints));
        for j=1:numel(nbPoints)
            integ_calc(j) = abs(integ_reel - integ_classique(i, A(n), B(n), nbPoints(j), f(n, :)));
        end
        subplot(nbFunc, 1, n);
        plot(nbPoints, integ_calc, 'color', color(i+1));
        legend('integ rectangle', 'integ millieu', 'integ trapeze', 'integ simpson');
        title(f(n, :));
        hold on;
    end
end