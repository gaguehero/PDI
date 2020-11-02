% at06_03[script]
clear all, close all, clc;
g = imread('cameraman.tif');

g = im2double(g);
S = fspecial('sobel');
gH = imfilter(g,S,'replicate','conv')
gSoma1 = abs(gH)
S = S'
gV = imfilter(g,S,'replicate','conv')
gSoma2 = abs(gV)
gSoma = gSoma1+gSoma2


% Imagem de magnitude do gradiente
Smod = sqrt(gV.^2 + gH.^2)

figure, imshow(g)
title('Imagem de entrada')
figure, imshow(Smod)
title('Com módulo')
figure, imshow(gSoma)
title('Com soma')
