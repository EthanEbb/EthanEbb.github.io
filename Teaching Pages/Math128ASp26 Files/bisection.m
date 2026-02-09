function [root, cn, iterations] = bisection(f, a, b, M, delta, epsilon)
% bisection(f, a, b, M, delta, epsilon)
%
% This is the bisection method for solving an equation f(r) = 0
% based on the pseudo-code on page 76 of Kincaid and Cheney.
%
% Input:
% f is an anonymous function 'f = @(x) sin(x)' and
% must be continuous on the interval [a, b].
% M is the maximum number of iterations
% delta is the error tolerance in x
% epsilon is the error tolerance in f(x) = 0
%
% Output:
% root is the approximation of r
% cn is the list of prior approximations of r
% iterations is the number of iterations taken to get to root

	iterations = 0;
	u = f(a);
	v = f(b);
	e = b - a;
	cn = zeros(M, 1);
	if a >= b
		disp('a > b and so we do not have a well-defined interval.')
		root = NaN;
		return
	end

	if sign(u) == sign(v)
		disp('we have no sign change at the boundary points.')
		root = NaN;
		return
	else
		for k = 1 : M
			iterations = iterations + 1;

			e = e / 2;
			c = a + e;
			cn(iterations) = c;

			w = f(c);

			if abs(e) < delta || abs(w) < epsilon
				disp(sprintf('we found our root within the desired tolerance after %d iterations', iterations))
				break
			end

			if sign(u) ~= sign(w)
				b = c;
				v = w;
			else
				a = c;
				u = w;
			end
		end
	end

	root = c;
end