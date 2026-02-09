function zero = bismethod(lowerbound, upperbound, f, numIter, errorTol)
%Applying the bisection method to the function f on (lowerbound,
%upperbound) within the given error tolerance and number of iterations

% Check that the assumptions are satisfied
if f(lowerbound) * f(upperbound) >= 0 
    error("function must have different signs at endpoint")
elseif lowerbound >= upperbound
    error("interval bounds")
else
    a = lowerbound;
    b = upperbound;
    j=1;
    %Remember the approx+epsilon mentality, so we take c to be a+epsilon
    c = a + (b-a)/2;
    while 0.5*(b-a) > errorTol & j < numIter
        %Remember that we use sign to not take an unnecessary
        %multiplication
        if sign(f(a)) ~= sign(f(c))
            b = c;
            c = a+(b-a)/2;
            j=j+1;
        else
            a = c;  
            c = a + (b-a)/2;
            j=j+1;
        end
    end
end

if abs(f(c)) > errorTol
    error('could not meet error Tolerance')
end

zero = c;
