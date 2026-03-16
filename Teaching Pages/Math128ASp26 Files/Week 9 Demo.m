%[text] # Matlab has a built in polynomial interpolation function
clear all;
n = 10;
a = -10;
b = 10;

x = linspace(a, b, n);
%Working with array values later, so we set up f to work component-wise
f = @(x) 1 ./ (1 + x.^2);
y = f(x);

pn = polyfit(x, y, n - 1);
%polyfit takes in these node and data arrays and fits a polynomial of
%degree at-most n that best meets these points
%Where "best" is in a least-squares sense
%if n = #points - 1, this is the interpolant. 

xi = linspace(a, b, 75);
%We use polyval to actually compute the values
yi1 = polyval(pn, xi)


%%
close all
p = plot(xi, f(xi), xi, yi1);
p(1).LineWidth = 3; 
p(1).Color = "red";
p(2).LineWidth = 3;
p(2).Color="blue";


%Error 

error = max(abs(f(xi)-yi1))
%%
%[text] # We know from lecture that increasing n is not always a good strategy for reducing the maximum error in our approximation
n = 15;
a = -5;
b = 5;

x = linspace(a, b, n);
f = @(x) 1 ./ (1 + x.^2);
y = f(x);

pn = polyfit(x, y, n - 1);

xi = linspace(a, b, 75);
yi2 = polyval(pn, xi);
close all
p = plot(xi, f(xi), xi, yi2); 
p(1).LineWidth = 3;
p(2).LineWidth = 3; 
%Notice High Error toward endpoints. 


error = [error, max(abs(f(xi)-yi2))]
%%
%[text] # We can use "magic" nodes, ones that are not uniformly spaced, to reduce the maximum error
%This is Chebyshev's interpolation
n=10;
k = n : -1 : 1;
xc = 0.5 * (a + b) + 0.5 * (b - a) * cos((2 * k - 1) / (2 * n) * pi)'
yc = f(xc);
pn = polyfit(xc, yc, n - 1);
yi3 = polyval(pn, xi);

close all
p = plot(xi, f(xi), xi, yi3);
p(1).LineWidth = 3;
p(2).LineWidth = 3; 

error = [error, max(abs(f(xi)-yi3))]
%%

%Alternative Interpolation: Splines

x = linspace(a, b, 10);
xi = linspace(a,b,75); %More points for visualization of splines
yi4 = spline(x,f(x), xi);

close all
p = plot(xi, f(xi), xi, yi4);
p(1).LineWidth = 3;
p(2).LineWidth = 3; 

error = [error, max(abs(f(xi)-yi4))]

%%

%All at once
close all
hold on
plot(xi,f(xi), Color="white")
plot(xi,yi1, Color="green")
plot(xi,yi2, Color="blue")
plot(xi,yi3, Color="cyan")
plot(xi,yi4, Color = "red")
error