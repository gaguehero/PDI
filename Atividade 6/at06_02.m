% at06_02[script]
clear all, close all, clc
g = imread('cameraman.tif');

g = im2double(g);
S = fspecial('sobel');
gSh = imfilter(g,S,'replicate','conv')
gSemCh = imfilter(g,S,'replicate')
S = S'
gSv = imfilter(g,S,'replicate','conv')
gSemCv = imfilter(g,S,'replicate')

% Imagem de magnitude do gradiente
Scom = sqrt(gSv.^2 + gSh.^2);
Ssem = sqrt(gSemCh.^2 + gSemCv.^2);


figure, imshow(g)
title('Imagem de entrada')
figure, imshow(Scom)
title('Com convolução')
figure, imshow(Ssem)
title('Sem convolução')

%Quando utilizamos o filtro Sobel nas duas imagens através de correlação e 
%convolução, geramos imagens de mesmo módulo, porém sinais trocados. Quando
%é feito a Imagem de magnitude, por essa ser exclusivamente positiva, acaba
%que a diferença de sinal desaparece, e o resultado são imagens iguais, como 
%pode ser visto em Scom e Ssem.