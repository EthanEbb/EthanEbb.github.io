function zero = bismethod(lowerbound, upperbound, f, errorTol)
%Applying the bisection method to the function f on (lowerbound,
%upperbound)

% Check that the assumptions are satisfied
if f(lowerbound) * f(upperbound) >= 0 
    error("function must have different signs at endpoint")
else
    a = lowerbound;
    b = upperbound;
    c = (a+b)/2;
    while abs(f(c)) > errorTol
        if f(a)*f(c) < 0
            b = c;
            c = (a+b)/2;
        else
            a = c;
            c = (a+b)/2;
        end
    end
end

zero = c;
