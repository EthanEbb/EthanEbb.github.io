%Some quick non-standard for loop steps

%Step by non-integer values
y = [];
f = @(x) 3+x.^2;
for k=1:0.1:10
    y = [y,f(k)];
end
y

%Same as 
y = [];
f = @(x) 3+x.^2;
for k=1:10/100
    y = [y,f(k)];
end
y

%Or
y = f(1:10/100);

%Step by negative numbers
y = [0,5,8,2,4,5];
for k= length(y)-1:-1:1
    y(k) = y(k) + y(k+1);
end
y


%E.g. Horner's Method

syms x
p = @(x) 3*x^3 + 2*x^2 + 5;
%Coefficients pulls the polynomial coef, 'All' signifies to include 0s,
%fliplr flips the matrix
c = fliplr(coeffs(p(x),'All'))
n = length(c)-1;
z0 = 2;
for j = n:-1:1
    c(j) = c(j) + z0*c(j+1);
end
c
p(2)