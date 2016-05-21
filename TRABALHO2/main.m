clear
clc
format long

% P6(x)= (1+0 I) x^6 - (5 + I) x^5 + (9.99 + 5. I) x^4 - (9.97 + 9.99 I) x^3 + (4.97 + 9.97 I) x^2 - (0.99 + 4.97 I) x + (0. + 0.99 I) =0

a = [
  complex( 1.00,  0.00),  %   (1    + 0    I) x^6
  complex(-5.00, -1.00),  % - (5    +      I) x^5
  complex( 9.99,  5.00),  %   (9.99 + 5.   I) x^4
  complex(-9.97, -9.99),  % - (9.97 + 9.99 I) x^3
  complex( 4.97,  9.97),  %   (4.97 + 9.97 I) x^2
  complex(-0.99, -4.97),  % - (0.99 + 4.97 I) x
  complex( 0.00,  0.99)   %   (0.   + 0.99 I)
];

[xI it1cham it2cham critParada x M] = roots2(a);

for i = 1 : length(x)
  printf("\nResultados para a %iª raíz:\n\n", i);
  printf("\ta)\n\t   Valor inicial: %i\n\n", xI(i));
  printf("\tc)\n\t   Nº de iterações do Newton-Raphson na 1ª chamada: %i\n\n", it1cham(i));
  printf("\td)\n\t   Nº de iterações do Newton-Raphson na 2ª chamada: %i\n\n", it2cham(i));
  printf("\te)\n\t   Critério de parada:\n\t\t%s\n", critParada{1,i});
end

printf("\nResultados gerais:\n\n");
printf("\tb)\n\t   Valores testados: 1e-3, 1e-4, 1e-5, 1e-6");
printf("\n\t   Melhor valor: %f\n", 1e-4);
printf("\n\tf)\n\t   Numero total de iterações: %i\n", sum(it1cham) + sum(it2cham));
printf("\n\tg)\n\t   Raízes refinadas e convergidas:\n");
for i = 1 : length(x)
  printf(["\t\t" mat2str(x(i)) "\n"]);
end
printf("\n\t   Multiplicidades das raízes:\n\t\t")
for i = 1 : length(x)
  printf([mat2str(M(i)) "\t"]);
end
xOctave = roots(a);
printf("\n\n\th)\n\t   Raízes da função roots() do Octave:\n");
for i = 1 : length(xOctave)
  printf(["\t\t" mat2str(xOctave(i)) "\n"]);
end
printf("\n\t   Raízes encontradas pelo WolframAlpha:\n");
xWolfram = [0.9 0.999959 1.1 complex(1.00002, -0.0000351069) complex(1.00002, +0.0000351069)];
for i = 1 : length(xWolfram)
  printf(["\t\t" mat2str(xWolfram(i)) "\n"]);
end
printf("\n\ti)\n\t   O resultado obtido com o algoritimo desenvolido neste trabalho tem\n\t  mais exatidão, pois ele leva em consideração a multiplicidade das\n\t  raízes, diferentemente do Wolfram e do roots() do Octave.\n");


% a_ValorInicial = transpose(xI)
% b_TestesLimite = "Valores testados: 1e-3, 1e-4, 1e-5, 1e-6"
% b_LimiteUtilizado = 1e-4
% c_NroIteracoesNR1aChamada = it1cham
% d_NroIteracoesNR2aChamada = it2cham
% e_CriterioParada = critParada
% f_NroIteracoesTotal = sum(it1cham) + sum(it2cham)
% g_RaizesRefinadas = transpose(x)
% g_Multiplicidades = M
% h_OctaveRoots = roots(a)
% h_WolframAlpha = "\n\t0.9\n\t0.999959\n\t1.1\n\t1.00002 - 0.0000351069i\n\t1.00002 + 0.0000351069i\n"
% i_ResultadoMaisExato = "O resultado obtido com o algoritimo desenvolido neste trabalho tem\n\t  mais exatidão, pois ele leva em consideração a multiplicidade das\n\t  raízes, diferentemente do Wolfram e do roots() do Octave."
