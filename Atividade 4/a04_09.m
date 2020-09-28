clear all
close all
g = imread('flowervaseg.png');
%Imfilter retorna imagem da mesma clase da
%de entrada. Se g fosse uint8 o imfilter
%truncaria os valores de saída e a
%visualização da convolução
%seria comprometida. Por isso:
gd = im2double(g);
h = fspecial('laplacian', 0);
h = -h
gdL = imfilter(gd, h, 'replicate');
gdLs = gd + gdL;
gdLsu = im2uint8(gdLs); %trunca
gdLsn = mat2gray(gdLs); %normaliza
%Display
figure, imshow(g)
title('Original')
gdLn = mat2gray(gdL);
figure, imshow(gdLn)
title('Laplaciano')
figure, imshow(gdLsu)
title('Realce Truncado')
figure, imshow(gdLsn)
title('Realce Normalizado')