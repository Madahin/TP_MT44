n = 3;
a = [1.5709 0.0006 0.00012];
c = [1 4 6];
t = 3.5;

tic;
evaluation1(n, a, c, t);
elapsed1 = toc

tic;
evaluation(n, a, c, t);
elapsed2 = toc;

disp(elapsed1)
disp(elapsed2)