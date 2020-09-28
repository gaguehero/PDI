clear all, close all, clc

%filtro mediana 
g=imread('salt-and-pepper1.tif')
gMediana=medfilt2(g)

%filtro média 3x3
h = fspecial('average', [3 3]);
gMedia1 = imfilter(g, h, 'symmetric');
%filtro média 5x5
h = fspecial('average', [5 5]);
gMedia2 = imfilter(g, h, 'symmetric');

figure, imshow(g),
title('Original')
figure, imshow(gMediana),
title('Filtro Mediana')
figure, imshow(gMedia1),
title('Filtro Media 3x3')
figure, imshow(gMedia2),
title('Filtro Media 5x5')