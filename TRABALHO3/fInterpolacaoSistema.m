function yPn = fInterpolacaoSistema(n, x, y , xE)

% Determinação do polinômio interpolador de grau n e coeficientes a
    x = transpose(x);
    y = transpose(y);
    ne = n+1; %número de equações do sistema
    A(ne, ne+1) = 0;
    A(:,ne) = 1;
    A(:,ne+1) = y;
    A(:,ne-1) = x;

    for j=ne-2:-1:1
        A(:,j) = A(:,j+1).*x;
    end

    a = elimGauss(ne,A);

% Polinômio está determinado: n, a.
% Aferição

    yPn = fPn(n, a, xE); % valores aproximados usando briot-ruffini
end
