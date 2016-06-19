function cap5ex2()
    printf(":::::::::::::::: CAPITULO 5 :: EXERCICIO 2 A ::::::::::::::::\n")
    x = [  0  1  2  3 ];
    y = [ -3 -2  4  0 ];
    n = 3;
    for i = 1 : n
        h(i) = x(i+1) - x(i);
    end
    [a b c d] = fAspline(n, x, y, h);
    a2 = a(2)
    b2 = b(2)
    c2 = c(2)
    d2 = d(2)

    printf(":::::::::::::::: CAPITULO 5 :: EXERCICIO 2 B ::::::::::::::::\n")
    x = [  0  1  2  3 ];
    y = [ -3 -2  4  0 ];
    n = 3;
    for i = 1 : n
        h(i) = x(i+1) - x(i);
    end
    [a b c d] = fBspline(n, x, y, h)

    printf(":::::::::::::::: CAPITULO 5 :: EXERCICIO 2 C ::::::::::::::::\n")
    printf("x a ser interpolado: ")
    xi = 1.3
    s = 0;
    for i = 1 : n
        if (xi > x(i))
            s = i;
        end
    end
    s

    printf(":::::::::::::::: CAPITULO 5 :: EXERCICIO 2 D ::::::::::::::::\n")
    np = 44;
    xp=[];
    yp=[];
    for i = 1 : n
        xs = x(i) : (x(i+1)-x(i))/np : x(i+1);
        for k = 1 : np+1
            ys(k) = a(i) * (xs(k)-x(i)) * (xs(k)-x(i)) * (xs(k)-x(i)) ...
                  + b(i) * (xs(k)-x(i)) * (xs(k)-x(i)) ...
                  + c(i) * (xs(k)-x(i)) ...
                  + d(i);
        end
        xp = [xp xs];
        yp = [yp ys];
    end
    plot(
        xp, yp, 'b', 'LineWidth', 1.5,
        x, y, 'kx', 'LineWidth', 2
    )
    printf("GRAFICO PLOTADO\n")
end

function [a b c d]=fBspline(m,x,y,h)
    t(2) = 0;
    r(2) = 3*h(1) + 2*h(2);
    d(2) = h(2);
    b(2) = 6*((y(3) - y(2)) / h(2) - (y(2) - y(1)) / h(1));
    for i = 3 : m-1
        t(i) = h(i-1);
        r(i) = 2*(h(i-1) + h(i));
        d(i) = h(i);
        b(i) = 6*((y(i+1) - y(i)) / h(i) - (y(i) - y(i-1)) / h(i-1));
    end
    t(m) = h(m-1);
    r(m) = (2*h(m-1) + 3*h(m));
    d(m) = 0;
    b(m) = 6*((y(m+1) - y(m)) / h(m) - (y(m) - y(m-1)) / h(m-1));
    for i = 3 : m
        aux = t(i) / r(i-1);
        t(i) = 0;
        r(i) = r(i) - aux*d(i-1);
        b(i) = b(i) - aux*b(i-1);
    end
    S(m) = b(m) / r(m);
    for i = m-1 : -1 : 2
        S(i) = (b(i) - d(i)*S(i+1)) / r(i);
    end
    S(1)=S(2); S(m+1)=S(m);
    S
    for i = 1 : m
        a(i) = (S(i+1) - S(i)) / (6*h(i));
        b(i) =  S(i) / 2;
        c(i) = (y(i+1) - y(i)) / h(i) - (S(i+1) + 2*S(i))*h(i) / 6;
        d(i) =  y(i);
    end
end

function [a b c d S] = fAspline(m,x,y,h)
    t(2) = 0;
    r(2) = 2*h(1) + 2*h(2);
    d(2) = h(2);
    b(2) = 6*((y(3) - y(2)) / h(2) - (y(2) - y(1)) / h(1));
    for i = 3 : m-1
    	t(i) = h(i-1);
    	r(i) = 2*(h(i-1) + h(i));
    	d(i) = h(i);
    	b(i) = 6*((y(i+1) - y(i)) / h(i) - (y(i) - y(i-1)) / h(i-1));
    end
    t(m) = h(m-1);
    r(m) = (2*h(m-1)+2*h(m));
    d(m) = 0;
    b(m) = 6*((y(m+1) - y(m)) / h(m) - (y(m) - y(m-1)) / h(m-1));
    for i = 3 : m
        aux = t(i) / r(i-1);
        t(i) = 0;
        r(i) = r(i) - aux*d(i-1);
        b(i) = b(i) - aux*b(i-1);
    end
    S(m) = b(m) / r(m);
    for i = m-1 : -1:2
        S(i) = (b(i) - d(i)*S(i+1)) / r(i);
    end
    S(1) = 0;
    S(m+1) = 0;
    S
    for i = 1 : m
        a(i) = (S(i+1) - S(i)) / (6*h(i));
        b(i) = S(i) / 2;
        c(i) = (y(i+1) - y(i)) / h(i) - (S(i+1) + 2*S(i)) * h(i) / 6;
        d(i) = y(i);
    end
end
