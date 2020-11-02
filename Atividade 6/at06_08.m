% at06_05[script]
clear all, close all, clc;
I = imread('cameraman.tif');

BW1 = edge(I,'sobel',0.06);
BW2 = edge(I,'canny');

figure, imshow(BW1)
title('Sobel')
figure, imshow(BW2)
title('Canny')

% O mais próximo possível é com o tresh entre 0.05 e 0.06. Mesmo assim
% uma série de artefatos no chão e no interior do contorno do homem 
% não se dissipam, sem consumir as bordas no processo. Os prédios também
% sofre bastante com esses problemas.