clear;
clc;

color = ['r', 'g', 'b', 'c'];

N = 150;
Prec = 10;

nbPoints = linspace(1, N, N);

f = ['sin(x)   ';'1/(1+x^2)';'x^3+x    '];
A = [0, 0, 0];
B = [pi/2, 1, 1];

syms x;

nbFunc = size(f);
nbFunc = nbFunc(1);

timeSpend = zeros(nbFunc, 4, numel(nbPoints));

for n=1:nbFunc;
    integ_reel = int(f(n, :), x, A(n), B(n));
    for i=0:3
        integ_calc = zeros(1, numel(nbPoints));
        disp(['func : ' f(n, :) ' type : ' num2str(i)]);
        for j=1:numel(nbPoints)
            for k=1:Prec
                tic;
                integ_calc(j) = abs(integ_reel - integ_classique(i, A(n), B(n), nbPoints(j), f(n, :)));
                timeSpend(n, i+1, j) = timeSpend(n, i+1, j) + toc;
            end
            timeSpend(n, i+1, j) = timeSpend(n, i+1, j) / Prec;
        end
    end
end

tabTime = zeros(1, N);
for i=1:nbFunc
    for j=1:4
        for n=1:N
            tabTime(n) = timeSpend(i, j, n);
        end
        subplot(nbFunc, 1, i);
        plot(nbPoints, tabTime, 'color', color(j));
        title(f(i, :));
        hold on;
    end
end