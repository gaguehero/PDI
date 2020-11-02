% at06_04[script]
% outro metodo para gerar a imagem de magnitude pode ser encontrando o valor 
% máximo entre a vertical e a horizontal
clear all, close all, clc;
g = imread('cameraman.tif');
g = im2double(g);
S = fspecial('sobel');
gH = imfilter(g,S,'replicate','conv')
S = S'
gV = imfilter(g,S,'replicate','conv')

% Imagem de magnitude do gradiente
Smod = sqrt(gV.^2 + gH.^2)

Smax = max(gV, gH)
figure, imshow(g)
title('Imagem de entrada')
figure, imshow(Smod)
title('Com módulo')
figure, imshow(Smax)
title('Com máximo')

% Como percebemos, não é tão eficiente quanto os outros métodos