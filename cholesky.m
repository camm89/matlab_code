function [L] = cholesky(A)
%L=CHOLESKY(A) -- computes the Cholesky factorization
%input
%   A   -   Symmetric positive definite matrix
%output
%   L   -   Lower triangular matrix, A=L*L’
n = size(A, 1);
L=zeros(n);

for i=1:n
   Lsum = 0;
   %calculate the summation term for L(i, i)
   for k=1:i-1
      Lsum = Lsum + L(i, k)^2; 
   end
   %calculate L(i, i)
   L(i, i) = sqrt(A(i, i) - Lsum);
   for j = i+1:n
      Lsum2 = 0;
      %calculate the summation term for L(j, i)
      for k = 1:i-1
         Lsum2 = Lsum2 + L(j, k)*L(i, k); 
      end
      %calculat L(j, i)
      L(j, i) = (A(j, i) - Lsum2)/L(i, i);
   end
end
end

