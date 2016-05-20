 function M = fMultiplicidade(r)
    rLimite = 1e-4 * r(length(r));
    M = 1;
    somaRestos = abs(r(1)) + abs(r(2));
    while somaRestos < rLimite 
        M = M + 1;
        somaRestos = somaRestos + abs(r(M+1));
    end
 end