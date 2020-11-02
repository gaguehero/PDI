% at06_05[script]
clear all, close all, clc;
img = imread('cameraman.tif');

h = fspecial('laplacian',0);
lap = edge(img,'zerocross',90,h);
%t é um limiar que atua na sensibilidade da
%detecção das passagens por zero

sob = edge(img,'sobel');

figure, imshow(lap)
title('Laplace')
figure, imshow(sob)
title('Sobel')

% na busca de eliminar os falsos positivos, a própria area detectada acaba
% sendo degradada. No final, limpar os falsos positivos seria limpar a 
% imagem como um todo. Valores acima de 90 perdem muita qualidade de 
% detecção para serem viáveis.