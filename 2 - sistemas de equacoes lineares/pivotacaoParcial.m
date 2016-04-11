function A = pivotacaoParcial(k, n, A)

  [MAX, i] = max(abs(A(k : n, k)))
  i += k
  aux = A(k, :);
  A(k, :) = A(i, :);
  A(i, :) = aux;

end
