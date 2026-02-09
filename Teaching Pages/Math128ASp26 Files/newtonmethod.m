function [root, numIterations] = newtonmethod(f, df, x0, errorTol)
%Applying Newton's method to the function f with derivative df starting at
%x0

x = x0;
j = 0;

while abs(f(x)) > errorTol
    if df(x) ~= 0
    x = x - f(x)/df(x); 
    j = j+1;
    else
        error('derivative 0')
    end

    %Manual Shutoff for lack of convergence
    if j >100;
        error('Lack of convergence after 100 iterations');
    end
end


root = x;
numIterations = j;