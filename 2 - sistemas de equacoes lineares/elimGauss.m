function x = elimGauss(n,A,b)

  A = [A b]
  for k = 1 : n-1
    A = pivotacaoParcial(k, n, A)
    for i = k+1 : n
      aux = A(i,k)/A(k,k)
      %A(i,:) = A(i,:) - aux*A(k,:)
      for j = 1 : n+1
        A(i,j) = A(i,j) - aux*A(k,j);
      end
      A(i,k) = 0;
    end
  end

  A
  x(n) = A(n, n+1)/A(n,n);
  for i = n-1 : -1 : 1
    soma = 0;
    for j = i+1 : n
      soma = soma + A(i, j) * x(j);
    end
    x(i) = (A(i, n+1) - soma) / A(i,i);
  end
  x = transpose(x); % apresenta x na forma de coluna
end
