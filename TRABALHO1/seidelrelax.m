% Matteus Legat % 
function seidelrelax()

    ANS_B1 = "Ver \"relatorio.txt\""

    limite = 1500;
    tol = 1e-4;  % TOLERÂNCIA
    fator=1.88;
    dif = 1;

    it = 0;  % ITERAÇÃO
    n=100;
    xi=zeros(1,n);
    x=xi;

    flopcount=0;
    while (it < limite && dif > tol)
        it++;
        i=1;
        x(i) = (1-fator)*xi(i) + fator*((1.50-x(1+i)));
        flopcount += 5;
        i=2;
        for i=2:n/2
            x(i) = (1-fator)*xi(i) + fator*((1.00-x(i-1)-x(i+1)-x(i+n/2))/3);
            flopcount += 8;
        end
        i=n/2+1;
        for i=n/2+1:n-1
            x(i) = (1-fator)*xi(1,i) + fator*((2.00-x(i-n/2)-x(i-1)-x(1+i))/3);
            flopcount += 8;
        end
        i=n;
        x(i) = (1-fator)*xi(i) + fator*((3.00-x(i-1)));
        flopcount += 5;

        dif = max(abs((x - xi) ./ xi));
        flopcount += n;
        xi = x;
    end;

    ANS_B2 = [mat2str(fator) " (ver \"relatorio.txt\")"]

    ANS_B3 = transpose(x)
    
    ANS_B4 = [it flopcount]
    
    itE = it;
    xE = x;
    xiE = xE;
    while (itE < it * 2)
        itE++;
        i=1;
        xE(i) = (1-fator)*xiE(i) + fator*((1.50-xE(1+i)));
        for i=2:n/2
            xE(i) = (1-fator)*xiE(i) + fator*((1.00-xE(i-1)-xE(i+1)-xE(i+n/2))/3);
        end
        for i=n/2+1:n-1
            xE(i) = (1-fator)*xiE(1,i) + fator*((2.00-xE(i-n/2)-xE(i-1)-xE(1+i))/3);
        end
        i=n;
        xE(i) = (1-fator)*xiE(i) + fator*((3.00-xE(i-1)));
        
        xiE = xE;
    end;
    
    ANS_B5 = max(abs((xi - xiE) ./ xiE))

end
