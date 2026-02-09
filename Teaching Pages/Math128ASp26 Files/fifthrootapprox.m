function [root,numIter] = fifthrootapprox(X)
%Find the fifth root of a real number X using Newton's method

f = @(x) x^5 - X;
df = @(x) 5*x^4;
errorTol = 1e-5;
numIter = 1;
y = X; 


if y == 0
    root = y;
else

while  abs(f(y)) > errorTol;
    %Why do we not need to worry about df(x) beign 0?
  y = y - f(y)/df(y);
  numIter = numIter + 1;
end

root= y;

end

end