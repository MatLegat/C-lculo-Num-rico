% Matteus Legat %
function gauss()
    
    n = 100;
    
    A = zeros(n,n);
    b = zeros(n,1);
    
    i = 1;
    A(i,i) = 1;
    A(i,i+1) = 1;
    b(i,1) = 1.5;
    
    for i = 2 : n/2
        A(i, i-1) = 1;
        A(i,i) = 3;
        A(i,i+1) = 1;
        A(i, i+n/2) = 1;
        b(i,1) = 1.00;
    end
    
    for i = n/2+1 : n-1
        A(i, i-n/2) = 1;
        A(i, i-1) = 1;
        A(i,i) = 3;
        A(i,i+1) = 1;
        b(i,1) = 2;
    end
    
    i = n;
    A(i,i-1) = 1;
    A(i,i) = 1;
    b(i,1) = 3;
    
    
    [x flop] = elimGauss(n,A,b);
    
    ANS_A = transpose(x)
    ANS_A1 = flop

end
