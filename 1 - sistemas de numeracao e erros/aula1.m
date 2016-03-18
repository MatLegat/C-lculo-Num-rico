% IEEE 754 32 bits:
%  ________________________________________________________________________
% |(sinal)₂|      (expoente)₂      |              (mantissa)₂              |
%  ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
%     1               8                               23          <- Nº de bits
%
% SE (0 < expoente < 255) :
%     valor = (-1)^sinal * 2^(expoente-127) * (1,mantissa);
% SE (expoente = 0) E (mantissa ≠ 0) :
%     valor = (-1)^sinal * 2^(expoente-126) * (0,mantissa);
% SE (expoente = 0) E (mantissa = 0) :
%     valor = 0;
% SE (expoente = 255) E (mantissa = 0) :
%     valor = ∞ 
% SE (expoente = 255) E (mantissa ≠ 0) :
%     valor = NaN

% Teste erro de arredondamento
format long
x = 0.1
a = single(x)
printf("\n x: %.25f\n", x)

% Erro absoluto:
% :: Erro(xs) = |(VA - VE) / VE| * 100% ::
% :: VA = Valor armazenado :: VE = Valor exato ::

% Calculo do erro estimado
erroestimado = ((a-x)/x)*100  % Não funciona, pois octave armazena short como long

% Variável real IEEE 32 bits :
MP = single(3.4e38)  % maior valor
mp = single(1.5e-45)  % menor valor

% Variável real IEEE 64 bits:
MP = double(1.7976e308)  % maior valor
mp = double(4.9406e-324)  % menor valor

1/3 
printf("\n 1/3: %.25f\n", ans)

% ERROS DE ARREDONDAMENTO:
%   Mudanças de base
%   Operações Aritméticas
%   variável real IEEE 32bits
%   Racionais
%   Irracionais 

% ERRO DE TRUNCAMENTO = Erro do método numérico

% ERROS INERENTES = Vêm dos dados


