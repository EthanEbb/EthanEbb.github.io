function zero = bismethod(lowerbound, upperbound, f, errorTol)
%Applying the bisection method to the function f on (lowerbound,
%upperbound)

% Check that the assumptions are satisfied
if f(lowerbound) * f(upperbound) >= 0 
    error("function must have different signs at endpoint")
else
    a = lowerbound;
    b = upperbound;
    %Remember the approx+epsilon mentality, so we take c to be a+epsilon
    c = a + (b-a)/2;
    while abs(f(c)) > errorTol
        %Remember that we use sign to not take an unnecessary
        %multiplication
        if sign(f(a)) ~= sign(f(c))
            b = c;
            c = a+(b-a)/2;
        else
            a = c;  
            c = a + (b-a)/2;
        end
    end
end

zero = c;
