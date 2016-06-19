function cap5ex3()
    printf("::::::::::::::::: CAPITULO 5 :: EXERCICIO 3 :::::::::::::::::\n");
    np = 50;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%% SEGMENTO A-B %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    pA  = [0, 0];  % PONTO A
    caA = pA + [1, tanDeg(45)];  % PONTO DE CONTROLE - 45º depois de A
    pB  = [2, 1];  % PONTO B
    cbB = pB - [.3, .3*tanDeg(0)];  % PONTO DE CONTROLE - 0º antes de B
    curveAB = calcBezier(pA, caA, pB, cbB, np);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%% SEGMENTO B-C %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %pB = [2, 1];  % PONTO B
    caB = pB + [1, tanDeg(-15)];  % PONTO DE CONTROLE - 15º depois de B
    pC  = [8, 0.2];  % PONTO C
    cbC = pC - [1, tanDeg(-8)];  % PONTO DE CONTROLE = -8º antes de C
    curveBC = calcBezier(pB, caB, pC, cbC, np);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%% SEGMENTO C-D %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %pC = [8, 0.2];  % PONTO C
    caC = pC + [1, tanDeg(-8)];  % PONTO DE CONTROLE = -8º depois de C
    pD  = [10, 0];  % PONTO D
    cbD = pD - [1, tanDeg(-5)];  % PONTO DE CONTROLE = -5º antes de D
    curveCD = calcBezier(pC, caC, pD, cbD, np);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    curves = [curveAB; curveBC; curveCD];
    points = [pA; pB; pC; pD];
    control = [caA; cbB; caB; cbC; caC; cbD];
    plot(
        curves(:,1),  curves(:,2),  'b',  'LineWidth', 1.5,
        points(:,1),  points(:,2),  'rx', 'LineWidth', 2,
        control(:,1), control(:,2), 'gx', 'LineWidth', 2
    )
    printf("GRAFICO PLOTADO")
end

function curve = calcBezier(p1, c1, p2, c2, np)
    h = 1/np;
    c = 3 * (c1 - p1);
    b = 3 * (c2 - c1) - c;
    a = (p2 - p1) - (c + b);
    t = 0;
    for i = 1 : np+1
        curve(i,:) = p1 + t * (c + t * (b + t * a));
        t += h;
    end
end

function x = tanDeg(angle)
    x = tan(angle * pi/180);
end
