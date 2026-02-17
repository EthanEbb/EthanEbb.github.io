function [root, xn, iterations] = modified_newton(f, fprime, K, x0, M, delta, epsilon)
% newton(f, fprime, x0, M, delta, epsilon)
%
% This is Newton's method for solving an equation f(r) = 0
% based on the pseudo-code on page 82 of Kincaid and Cheney.
%
% Input:
% f is an anonymous function 'f = @(x) sin(x)'
% fprime is the anonymous function for the derivative of f 
%K is the modification order (order of the zero of f)
% x0 is the initial guess for the root
% M is the maximum number of iterations
% delta is the error tolerance in x
% epsilon is the error tolerance in f(x) = 0
%
% Output:
% root is the approximation of r
% xn is the list of prior approximations of r
% iterations is the number of iterations taken to get to root

	iterations = 0;
	v = f(x0);
	xn = zeros(M, 1);

	for k = 1 : M
		iterations = iterations + 1;
        x1 = x0 - K * v / fprime(x0);
		v = f(x1);
		xn(iterations) = x1;

		if abs(x1 - x0) < delta || abs(v) < epsilon
			disp(sprintf('we found our root within the desired tolerance after %d iterations', iterations))
			break
        end
        x0 = x1;
    end
    
    if iterations >= M
        disp(sprintf('warning: we performed the maximum number of iterations: %d', iterations))
    else
        xn = xn(1 : iterations);
    end

	root = x0;
end

%[appendix]{"version":"1.0"}
%---
