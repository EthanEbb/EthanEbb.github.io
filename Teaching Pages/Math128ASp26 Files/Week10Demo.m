%%Goal 1: Vectorizing Code

%Matlab is optimized for vector and matrix operations
%So, in this language, their built-in operations will usually be faster
%than you writing a for loop

%This is NOT true of all languages, e.g. C++

%e.g.

f = @(x) sin(x);

y = f(1:100);
%will go faster than 
y = zeros(1,100);
for i=1:100
    y(i) = f(i);
end
%and looks better too.

%This can't always be done, such as for recurrent formulas, but when it can
%it is helpful

%e.g. finite difference derivative (f(x+h)-f(x))/h

h = 2.^[-1:-1:-10];
%what operations are involved here? Why should we use dyadic numbers?
df = (f(h) -f(0))./h

clear all
h = 0.1;
f = [1,2,1,4,2,3,3,6,4,2,10]; %A Vector representing a function, length 11, with evenly space values of h=0.1
df = nan(1,11);
df(1:end-1) = (f(2:end) - f(1:end-1)) ./ h


%% Difference Scheme With Single Precision
clear all;
format long

%What are these types of functions called again?
f = @(x) cos(x.^2) .* exp(x);
exact = @(x) -2 * x .* sin(x.^2) .* exp(x) + cos(x.^2) .* exp(x);

%The single function stores these as floats in single precision in 32-bit
%(i.e. our Marc-32 format)
h = single(2.^[-1 : -1 : -52])';
x0 = single(1/3)

central = @(x, h) (f(x + h) - f(x - h)) ./ (2 * h);

%Notice that storing h as an array allows us to compute these values
%without a for loop
central_fprime = central(x0, h);
central_error = abs(central_fprime - exact(x0));
table(h, central_error)

%We see the error decrease, then increase as h decreases. This is the
%tradeoff between convergence of the finite-difference dericative and
%subtractive cancellation





%%
%This is a bad plot because we picked dyadic h values, so too many cluster
%near 0
plot(h, central_error) 
xlabel("step size") 
ylabel("error") 

%Better plot
plot(central_error) 
xlabel("iteration number") 
ylabel("error") 

% Alternative fix: take logs
loglog(h, central_error)
xlabel("step size") 
ylabel("error") 

%%
% Difference Scheme With Double Precision (matlab standard)
h1 = 2.^[-1 : -1 : -52]';
x0 = 1/3;

central = @(x, h1) (f(x + h1) - f(x - h1)) ./ (2 * h1);
central_fprime = central(x0, h1);
central_error_double = abs(central_fprime - exact(x0));

table(h1, central_error_double)



%%
%[text] # Seeing the Extra Precision
semilogy(central_error_double) 
xlabel("iteration number")
ylabel("error") 
%%
%[text] # Comparing the Extra Precision
semilogy([1 : length(central_error)], central_error, [1 : length(central_error_double)], central_error_double) %[output:404d4c55]
xlabel("iteration number")
ylabel("error")
legend("Single","Double")
%We reduce the subtractive error