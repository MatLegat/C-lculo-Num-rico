% Matteus Legat %
function [x flopcount] = elimGauss(n,A,b)

    flopcount = 0; 

    A = [A b];
    for k = 1:n-1

        A = pivotParcial(n, k, A);
        
        for i = k+1:n
            aux = A(i,k)/A(k,k);
            flopcount += 1; 
            for j = k+1:n+1
                A(i,j) = A(i,j) - aux*A(k,j);
                flopcount += 2; 
            end
            A(i,k) = 0;
        end
    end

    if(abs(A(n,n)) < eps)
        if(abs(A(n,n+1)) < eps)
            printf("Sistema indeterminado\n")
            x(n) = 0;
        else    
            printf("Sistema impossível\n")
            x(n) = NaN;
        end
    else
        x(n) = A(n, n+1)/A(n,n);
        flopcount += 1;
    end

    for i = n-1:-1:1
        soma = 0;
        for j = i+1:n
            soma += A(i,j)*x(j);
            flopcount += 2; 
        end
        x(i) = (A(i,n+1)-soma)/A(i,i);
        flopcount += 2;
    end
  
end