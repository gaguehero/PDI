% at06_01[script]
clear all, close all, clc
% Cria imagem sint�tica g
w = 256;
objt = 192; fundo = 64; rnd = 10;
g = makeImSynthHex(w,objt,fundo, rnd);
g = im2double(g);
hv = [-1 0 1];
gv = imfilter(g, hv, 'replicate');%correlat.
hh = hv';
gh = imfilter(g, hh, 'replicate');%correlat.
% Normaliza, pois existem
% valores negativos
gv = mat2gray(gv);
gh = mat2gray(gh);
% Display
figure, imshow(g)
title('Imagem de entrada')
figure, imshow(gv)
title('Resultado da m�scara vertical')
figure, imshow(gh)
title('Resultado da m�scara horizontal')

%O fspecial pega as dimens�es definidas pelos recortes e com base nisso cria uma gaussiana
%circ = fspecial('gaussian', [r c], r/10);
%Esse segundo passo limita a gaussiana apenas para o formato de um c�rculo central
%circ = circ < max(circ(:))/10;
%Esse terceiro adere o c�rculo ao resto da imagem previamente constru�da
%s = s .* uint8(circ);
%A maneira mais f�cil de alterar o di�metro do c�rculo 
%seria mudando os valores de "a" em fspecial('gaussian', [r c], r/a)