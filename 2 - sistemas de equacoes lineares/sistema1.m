format long

A = [3,  1, -1;
     4, -2,  1;
     5,  3,  3]

b = [1; -1 ; 2]

n = size(A, 1) % numero de equações:
x = inverse(A)*b

%x  = b /a

x = elimGauss(n, A, b)
r = residuoMax(x, n, A, b)
