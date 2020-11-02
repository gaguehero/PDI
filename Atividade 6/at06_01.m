% at06_01[script]
clear all, close all, clc
% Cria imagem sintética g
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
title('Resultado da máscara vertical')
figure, imshow(gh)
title('Resultado da máscara horizontal')

%O fspecial pega as dimensões definidas pelos recortes e com base nisso cria uma gaussiana
%circ = fspecial('gaussian', [r c], r/10);
%Esse segundo passo limita a gaussiana apenas para o formato de um círculo central
%circ = circ < max(circ(:))/10;
%Esse terceiro adere o círculo ao resto da imagem previamente construída
%s = s .* uint8(circ);
%A maneira mais fácil de alterar o diâmetro do círculo 
%seria mudando os valores de "a" em fspecial('gaussian', [r c], r/a)