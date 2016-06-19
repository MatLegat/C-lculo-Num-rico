function cap5ex6b()
    printf(":::::::::::::::: CAPITULO 5 :: EXERCICIO 6 B ::::::::::::::::\n")
    xI = 0
    xF = pi/2
    n = 1;
    erromax = 1;
    k = 0;
    tol = sqrt(10)*1e-6;
    while (erromax > tol && k < 30)
        n = n+1;
        k++;
        h = (xF-xI)/n;
        x = xI:h:xF;
        y = cos(x);

        xPlot = xI : h*0.05 : xF;
        yExato = cos(xPlot);

        yPn = fGregoryNewton(n,x, y, xPlot);
        erro = abs(yPn.-yExato);
        erromax = max(erro)
    end
    plot(xPlot, erro, "r; erro de fPn(x) relacionado à f(x);", 'LineWidth', 1.5)
    printf("GRAFICO PLOTADO\n")
end
