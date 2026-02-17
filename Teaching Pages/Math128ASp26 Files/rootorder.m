function order = rootorder(f, r, j)
%This function is designed to find the order of the root of a function
%f is an anonymous function, it should be 
%r is the root
%j is either 1 or 2 and picks the method used




if nargin < 3
    j =  1;
  end

if f(r) ~= 0
    order = 0;
end

if j == 1
    finitestep = 0.01;
    rootorderstep = 0.01;


    c=0;
    k=1;
    while c < 100
        delf = 0;
    for l=0:k
        delf = delf + (-1)^(l) * nchoosek(k,l) * f(r + (k/2-l)*finitestep);
    end
    derivapprox = delf/(finitestep^k);
    c = (f(r+rootorderstep)/(rootorderstep^k)) * (factorial(k)/derivapprox);
    if isnan(c);
        error("Computation Error for Method 1")
    end
    k=k+1;
    end
    order = k;


    
elseif j == 2
    syms x

F = diff(f,x);
c = F(r);
k=1;

while abs(c) > 0
F = diff(F,x);
c = F(r);
k = k+1;
end

order = k;
    
else
    error("method selection error")
end