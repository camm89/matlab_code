function [] = HilbertChols()
H1 = hilb(3);
H2 = hilb(10);
H3 = hilb(20);
L1 = cholesky(H1);
L2 = cholesky(H2);
L3 = cholesky(H3);
L = chol(H1);
disp('My function returns L = ')
disp(L1)
disp('Matlab Function returns L =')
disp(L)
disp('2 norm difference for H3 = ')
disp(norm(H1-L1*L1', 2));
disp('2 norm difference for H10 = ')
disp(norm(H2-L2*L2', 2));
disp('2 norm difference for H20 = ')
disp(norm(H3-L3*L3', 2));

end