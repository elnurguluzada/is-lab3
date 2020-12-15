x = 0.1:0.05:1.2;

do = zeros(23, 'single');

for it = 1:23
    do(it) = (1 + 0.6 * sin (2 * pi * x(it) / 0.7)) + 0.3 * sin (2 * pi * x(it)) / 2;
end


c1 = 0.2;
c2 = 0.9;
s1 = 0.15;
s2 = 0.13;
h1 = rand(1);
h2 = rand(1);
h3 = rand(1);
lr = 0.2;

for iteration = 1:2000
for i = 1:23
function1 = 1/(2*pi)*exp(-((x(i) - c1)^2)/(2*s1^2));
function2 = 1/(2*pi)*exp(-((x(i) - c2)^2)/(2*s2^2));
y(i) = h1*function1 + h2*function2 + h3; 
e= do(i) - y(i);
h1 = h1 + lr * e * function1;
h2 = h2 + lr * e * function2;
h3 = h3 + lr * e;
end
end

plot(x ,do ,'ko' ,x,y,  'r*');