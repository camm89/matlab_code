function [] = HilbertGauss()

A1 = hilb(3);
A2 = hilb(10);
A3 = hilb(30);
x1 = ones(3, 1);
x2 = ones(10, 1);
x3 = ones(30, 1);

b1 = A1*x1;
b2 = A2*x2;
b3 = A3*x3;

disp(gaussPP(A1, b1));
disp(gaussPP(A2, b2));
disp(gaussPP(A3, b3));

end

function  x=gauss(A,b)
%function  x=gauss(A,b)
%   Gaussian elimination without row interchanges
% - Input:
%       A   -   n-by-n matrix
%       b   -   n-by-1 right-hand-side vector
% - Output:
%       x   -   n-by-1 solution vector
%
%%
n=size(A,1);
x=zeros(n,1);
%% Gaussian elimination
for k=1:n-1  
    %select pivot element
    for j = k+1:n
       if abs(A(j, k)) > abs(A(k, k))
          V = A(k,:);
          %swap rows
          A(k,:) = A(j,:);
          A(j,:) = V;
       end
    end
    for i=k+1:n 
        % This loop can be further vectorized by replacing i with k+1:n
        d=A(i,k)/A(k,k);                  
        A(i,k+1:n)=A(i,k+1:n)-d*A(k,k+1:n);
        b(i)=b(i)-d*b(k);
    end
end
%% Backward substitution
if(abs(A(n,n))<1.e-20)                         
    error('no unique solution');
end
x(n)=b(n)/A(n,n);                          
for i=n-1:-1:1                                 
    x(i)=(b(i)-A(i,i+1:n)*x(i+1:n))/A(i,i);
end

end