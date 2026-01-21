

%Taylor Series Computation for Computers

%We want to compute values of (tan(x)-x^3)/x
%The Problem is the divide-by 0 stuff
%So, when x is small, we want to use the taylor series to simplify this. 
%What order series? Third order is enough, as higher order terms disappear
%quickly for small x

%Compute the Taylor Series
syms x f
f = @(x) tan(x)-x;
T1 = taylor(f,x);
%This function gives the fifth order approx.
%Just to be nice
sympref("PolynomialDisplayStyle","ascend");
T1

%Get to an expression for our function to compute
F = simplify(T1/(x^3));
F

%Geenrate the actual function (perhaps in a separate file)

function f = my_sinc(x)
    f = 0;
    if abs(x) < 1e-7
        f = 1/3 + 2/15 * x^2;
    else
        f = (tan(x)-x)/x^3;
    end
end

my_sinc(0.00000005)
my_sinc(5)