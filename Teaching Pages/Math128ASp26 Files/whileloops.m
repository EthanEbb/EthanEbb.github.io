%If, For, While

%Remember that we may use logical operators in MatLAb liek with normal code

x = 5;
if x < 10
    disp('x is less than 10')
else 
    disp('x  is at least 10')
end

%We also have for loops, which loop back to the start over some sequence of
%terms
y = [];
for x = 1:10
    y = [y, x^2];
end
y

%Notice this does the same thing, where the .^ means the values of the
%array are operated on
y = (1:10).^2;
y

%While loops do the same thing but with a condition involved

%Easy ways to remember how to use them
help while
doc while

%Click on one of the examples!!



%Try Coding this 

%I want a script that tells me the Collatz trajectories
%In other words, we want a seed value x, and a loop that applies the
%Collatz function on x
%The collatz function takes an even number x to x/2, and an odd x to
%(3*x+1)/2
%Make the stopping criterea if x <2, and keep track of the steps involved
%in an array









%Solution

x=200;
y = [];
while x>2
    if rem(x,2) == 0
        x = x/2;
    else 
        x = (3*x+1)/2;
    end
y = [y,x];
end
y


%Alternately, try coding a bisection method coder
%File is attached

%Example function: .^ is for termwise application to the array
f = @(x) 10*x.^3 + 3*x.^2 + 2*x + 4;

x = linspace(-100,100,100);
y = f(x);
plot(x,y)

%See a 0 between -20 and 20

zero = bismethod(-20,20,f, 1)

%This takes a while for low tolerances