clear all, close all
g = imread('flowervaseg.png'); %(3)
g = double(g); %double, uint8(1)
%g = im2double(g);%im2double,im2uint8(2)
h = fspecial('gaussian', [5 5], 1);
gg = imfilter(g, h, 'replicate');

unshmask = g - gg;
unshmask2=20*unshmask
unshmask3=7*unshmask
gunsharp = g + unshmask; %(3)
gunsharp = uint8(gunsharp);%double,uint8(1)
%gunsharp = ...,
%im2uint8(gunsharp); %im2double,im2uint8(2)
%Display
figure, imshow(g,[])
title('Original')
figure, imshow(unshmask,[])
title('Imagem máscara unsharp')
figure, imshow(gunsharp)
title('Realce')

%Intensificando o realce por 20
gunsharp = g + unshmask2; %(3)
gunsharp = uint8(gunsharp);%double,uint8(1)
figure, imshow(unshmask,[])
title('Imagem máscara unsharp x20')
figure, imshow(gunsharp)
title('Realce x20')

%Intensificando o realce por 7
gunsharp = g + unshmask3; %(3)
gunsharp = uint8(gunsharp);%double,uint8(1)
figure, imshow(unshmask,[])
title('Imagem máscara unsharp x7')
figure, imshow(gunsharp)
title('Realce x7')