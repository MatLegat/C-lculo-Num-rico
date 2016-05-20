function [xI it1cham it2cham critParada x M]= roots2(a)
    tol = 1e-12;
    n = length(a)-1;
    nI = n; 
    aI = a;
    indiceRaiz = 0;
    itTotal = 0;
    critParada = "\n";
    while n > 0
        indiceRaiz = indiceRaiz + 1;
    % Primeira fase de localização das raízes:
        xI(indiceRaiz) = fLocaliza(n, a);
    % Segunda fase: Aproximação da raiz por Newton-Rhapson
        [x(indiceRaiz) M(indiceRaiz) it1cham(indiceRaiz) difDif DUMP] = fNR_Pol(n, a, xI(indiceRaiz), tol);
        % itTotal += it1cham(indiceRaiz);
    % Terceira fase: Refinamento da raiz aproximada na 2ª fase
        [x(indiceRaiz) M(indiceRaiz) it2cham(indiceRaiz) difDif critParadaI] = fNR_Pol(nI, aI, x(indiceRaiz), tol);
        critParada = [critParada critParadaI "\n\n"];
        % itTotal += it2cham(indiceRaiz);
    % Quarta fase : Redução de grau para obter as demais raízes
        [n,a] = fDivisaoPol(n, a, x(indiceRaiz), M(indiceRaiz));
    end
    % itTotal
end