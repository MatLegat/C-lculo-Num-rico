function cap5ex4()
    printf(":::::::::::::::: CAPITULO 5 :: EXERCICIO 4 A ::::::::::::::::\n")
    printf("tolerancia = 10^(1/2) * 10^(-2) = %f\n", 10^(1/2) * 10^(-2))
    printf("inicial: n = 2\n")
    printf("h: valor medio do intervalo\n\t")
        printf("erro2 = abs((-cos(0)*(pi/4)^(2+1)) / (4*(2+1)))\n\t")
        erro2 = abs((-cos(0)*(pi/4)^(2+1)) / (4*(2+1)))
        printf("\terro2 > tolerancia")
    printf("n = 3\n\t")
        printf("erro3 = abs((sin(pi/2)*(pi/6)^(3+1)) / (4*(3+1)))\n\t")
        erro3 = abs((sin(pi/2)*(pi/6)^(3+1)) / (4*(3+1)))
    n = 3

    printf(":::::::::::::::: CAPITULO 5 :: EXERCICIO 4 B ::::::::::::::::\n")
    xI = 0;
    xF = pi/2;
    n = 2;
    h = (xF-xI)/n;
    x = xI : h : xF
    y = sin(x)
    xPlot = xI : h*0.05 : xF;
    yExato = sin(xPlot);

    yPn = fGregoryNewton(n, x, y, xPlot);
    tsis = n+1;
    for i = 1 : tsis
        A(i,tsis) = 1;
        for j = tsis-1:-1:1
            A(i,j) = A(i,j+1)*xPlot(i);
        end
        A(i, tsis+1) = yPn(i);
    end
    coef = elimGauss(tsis,A)

    printf(":::::::::::::::: CAPITULO 5 :: EXERCICIO 4 C ::::::::::::::::\n")
    erro = abs(yPn - yExato);
    erroMax = max(erro)
    erroSerieTaylor = abs((-cos(0) * (pi/4)^(2+1)) / (4*(2+1)))

    printf(":::::::::::::::: CAPITULO 5 :: EXERCICIO 4 D ::::::::::::::::\n")
    plot (
        x, y, 'kx', 'LineWidth', 2,
        xPlot, yExato, "r;f(x) exata;", 'LineWidth', 1.5,
        xPlot, yPn, "b;fPn(x) interpol;", 'LineWidth', 1.5
    )
    printf("GRAFICO PLOTADO\n")

end

function x = elimGauss(n,A)
    for k = 1:n-1
        A = pivotParcial(n, k, A);
        for i = k+1:n
            aux = A(i,k)/A(k,k);
            for j = k+1:n+1
                A(i,j) = A(i,j) - aux*A(k,j);
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
    end

    for i = n-1:-1:1
        soma = 0;
        for j = i+1:n
            soma = soma + A(i,j)*x(j);
        end
        x(i) = (A(i,n+1)-soma)/A(i,i);
    end
end
