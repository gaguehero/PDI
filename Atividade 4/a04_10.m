clear all
close all
g = imread('flowervaseg.png');
gd = im2double(g);
h = fspecial('laplacian',1);
i = fspecial('laplacian',0);
h = h+h+i;
%laplace extendido invertido
mascara = imfilter(gd, h, 'replicate');
mascaradoExtendido = gd - mascara;
mascaradoExtendido = im2uint8(mascaradoExtendido); %trunca
%laplace invertido
mascara = imfilter(gd, i, 'replicate');
mascarado = gd - mascara;
mascarado = im2uint8(mascarado); %trunca

%show
figure, imshow(g)
title('Original')
figure, imshow(mascaradoExtendido)
title('Laplace extendido invertido')
figure, imshow(mascarado)
title('Laplace invertido')

%Percebe-se que a versão extendida acentua o realce