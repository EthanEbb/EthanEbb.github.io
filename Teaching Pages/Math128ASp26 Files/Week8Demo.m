%[text] # Creating Matrices
clear;
%this displays matrices in a format like you'd write on paper instead of
%the normal array form that is hard to read. 
format compact
n = 5;
%the pascal matrix has columns that count by a multiple of the column
%number
A = pascal(n)
B = pascal(n)
%This gives random values between 0 and 1 for each entry, uniformly
%distributed
C = rand(n, n)
D = rand(2 * n, n)
%These two are probably obvious
E = zeros(n)
F = ones(n)


%%
%a magic square has row soms and column sums all some constant
%this returns a magic square with entries 1 through n^{2}
A = magic(n)
%We address matrices by row, then column, as in normal i,j-notation
%%
A(2, 3)


%%
%[text] # We can address many entries at once
A(1:3, 1:3)
%end means we don't need to remember sizes. 
A(1:2, 1:end)
%just using a colon denotes the entire row or column without using 1:end
A(1:2, :)


%%
%[text] # The entries need not be consecutive
i = [2 n]
j = [3 4]
A
A(i, j)
%this allows us to pick submatrices when we need to
clear i


%%
%The command diag(A) pulls the diagonal values into a vector
A
diag(A)
%applying diag to a vector creates a matrix with those values on the
%diagonal
diag(diag(A))


%%
%[text] # Or address entries above or below the main diagonal
A
diag(A,1)
diag(A,-1)


%%
%[text] # Special Matrix Operations
A + B %component-wise addition
3 * A - B %the scalar multiplies by all elements
A * B %standard matrix multiplication
A .* B %component-wise multiplication
det(A) %the determinant
A^(-1)
A * A^(-1)
%%
1 ./ A %component-wise division, returning a matrix
A * (1 ./ A)
A .* (1 ./ A)


%%
%We even have the transpose operator
A'
transpose(A)

%%
%And the conjugate transpose operator
C = A(1:2, 1:2) + i * B(1:2, 1:2)
C'

%%
% Today's coding: the tridiagonal matrix. 
%Here is an example fo a bidiagonal matrix. Let us assume that the diagonal
%values are all nonzero

function x = backsub(A,b)

%A an upper triangular matrix with nonzero diagonals. 
%c a vector.
%Solving Ax = c.

c = size(A);
if c(1) ~= length(b) | c(1) ~= c(2)
    error("Sizes don't match")
end

d = diag(A);
x = zeros(1,length(b));

%Back substitution
for j = n:-1:1
    v = A(j,:);
    x(j) = (b(j) - v * transpose(x)) / d(j);
end

end

