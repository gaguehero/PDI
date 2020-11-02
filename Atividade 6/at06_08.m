% at06_05[script]
clear all, close all, clc;
I = imread('cameraman.tif');

BW1 = edge(I,'sobel',0.06);
BW2 = edge(I,'canny');

figure, imshow(BW1)
title('Sobel')
figure, imshow(BW2)
title('Canny')

% O mais pr�ximo poss�vel � com o tresh entre 0.05 e 0.06. Mesmo assim
% uma s�rie de artefatos no ch�o e no interior do contorno do homem 
% n�o se dissipam, sem consumir as bordas no processo. Os pr�dios tamb�m
% sofre bastante com esses problemas.