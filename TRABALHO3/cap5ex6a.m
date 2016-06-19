function cap5ex6a()
    printf(":::::::::::::::: CAPITULO 5 :: EXERCICIO 6 A ::::::::::::::::\n")
    xI = 0
    xF = pi/2
    n = 2;
    h = (xF-xI)/n;
    x = xI : h : xF;
    y = cos(x);
    xPlot = xI : h*0.01 : xF;
    yExato = cos(xPlot);

    yPn = fGregoryNewton(n,x, y, xPlot);
    erro = abs(yPn - yExato);
    erromax = max(erro)
    plot(xPlot, erro, "r; erro de fPn(x) relacionado à f(x);", 'LineWidth', 1.5)
    printf("GRAFICO PLOTADO\n")
end
