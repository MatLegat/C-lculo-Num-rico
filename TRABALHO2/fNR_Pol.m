function [x M k critParada] = fNR_Pol(n, a, xI, tol)
    k=0;
    difAnt = 1e20;
    difDif = 1;
    dif = 1;
    while (difDif > tol && dif > tol && k < 120)
        k = k + 1;
        r = fRestos(n, a, xI);
        M = fMultiplicidade(r);
        dx = - r(M)/(M*r(M+1));
        x = xI + dx;
        xI = x;
        dif = abs(dx)+abs(r(1));
        difDif = abs(difAnt - dif);
        difAnt = dif;
    end
    if (difDif <= tol)
        critParada = ["A diferença das diferenças (" mat2str(difDif) ") é\n\t\tmenor do que a tolerância (" mat2str(tol) ")."];
    elseif (dif <= tol)
        critParada = ["A diferença (" mat2str(dif) ") é menor do que\n\t\ta tolerância (" mat2str(tol) ")."];
    else
        critParada = ["O numero de iterações atingiu o limite (120)."];
    endif
end
