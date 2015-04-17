X1 = [-1:2/7:1];
Y1 = exp(X1);

[composante1, chaine1] = interpol(numel(X1), X1, Y1);

X2 = zeros(1, numel(X1));
for j=1:numel(X1)
    X2(j) = cos((2*j + j)/numel(X1) * pi / 2);
end

Y2 = exp(X2);

[composante2, chaine2] = interpol(numel(X1), X2, Y2);

func1 = '@(x)';
func1 = strcat(func1, chaine1);
disp(func1);
exp1 = str2func(func1);

func2 = '@(x)';
func2 = strcat(func2, chaine2);
disp(func2);
exp2 = str2func(func2);

x = [-5:0.001:5];
y = zeros(1, numel(x));
y2 = zeros(1, numel(x));
for i=1:numel(x)
    y(i) = exp1(x(i));
    y2(i) = exp2(x(i));
end


plot(x, abs(y - exp(x)), 'color', 'b'); hold on;
plot(x, abs(y2 - exp(x)), 'color', 'r');
