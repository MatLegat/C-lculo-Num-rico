function cap5ex5()
    printf(":::::::::::::::: CAPITULO 5 :: EXERCICIO 5 A ::::::::::::::::\n")
    printf([
        "Por ser uma função definida, interpolação polinomial a\n" ...
        "representa com boa exatidão, já que é possível gerar\n" ...
        "pontos de ancoragem com exatidão.\n"
    ])

    printf(":::::::::::::: CAPITULO 5 :: EXERCICIO 5 B/C/D ::::::::::::::\n")
    xI = 0;
    xF = 1;
    n = 2;

    h = (xF-xI)/n;
    x = xI:h:xF
    y = exp(x)

    tsis = n+1;
    for i = 1 : tsis
        A(i,tsis) = 1.;
        for j = tsis-1:-1:1
            A(i,j) = A(i,j+1)*x(i);
        end
        A(i, tsis+1) = y(i);
    end
    C = elimGauss(tsis,A)

    xE = xI:h*0.05:xF;
    yE = exp(xE);


    yPn = fInterpolacaoSistema(n, x, y, xE);
    erro = abs(yPn.-yE);
    erromax = max(erro)

    yPnL = fLagrange(n, x, y, xE);
    erroL = abs(yPnL.-yE);
    erromaxL = max(erroL)

    yPnGN = fGregoryNewton(n, x, y, xE);
    erroGN = abs(yPnGN.-yE);
    erromaxGN = max(erroGN)

    xT = 0.378
    yT = exp(xT);


    yPnT = fInterpolacaoSistema(n, x, y, xT)
    erroT = abs(yPnT.-yT);
    erromaxT = max(erroT)

    yPnTL = fLagrange(n, x, y, xT)
    erroTL = abs(yPnTL.-yT);
    erromaxTL = max(erroTL)

    yPnTGN = fGregoryNewton(n, x, y, xT)
    erroTGN = abs(yPnTGN.-yT);
    erromaxTGN = max(erroTGN)

end
