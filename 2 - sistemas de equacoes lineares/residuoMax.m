function residuoMax(x, n, A, b)

  r = zeros(1, n);
  for i = 1 : n
    soma = 0;
    for j = 1 : n
      soma = soma + A(i,j) * x(j);
    end
    r(i) = abs(soma - b(i));
  end
  r
  r = max(r);

end
