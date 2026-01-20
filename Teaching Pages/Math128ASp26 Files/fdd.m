function deriv = fdd(fun, x, h)
%Finite-Difference Derivative
%fun: the function you want to differentiate
%x: the value you wish to differentiate at
%h: the step for the derivative


deriv = (fun(x+h) - fun(x))/h;