clear all, close all
g = imread('flowervaseg.png'); %(3)
g = double(g); %double, uint8(1)
%g = im2double(g);%im2double,im2uint8(2)

%Filtro base
h = fspecial('gaussian', [5 5], 1);
gg = imfilter(g, h, 'replicate');
unshmask = g - gg;
gunsharp = g + unshmask; %(3)
gunsharp = uint8(gunsharp);%double,uint8(1)
figure, imshow(g,[])
title('Original')
figure, imshow(unshmask,[])
title('Imagem máscara unsharp  e passa-baixas 1')
figure, imshow(gunsharp)
title('Realce 1')

%Filtro 2
h2 = fspecial('gaussian', [3 3], 0.5);
gg2 = imfilter(g, h2, 'replicate');
unshmask = g - gg2;
gunsharp = g + unshmask;
gunsharp = uint8(gunsharp);
figure, imshow(unshmask,[])
title('Imagem máscara unsharp e passa-baixas 2')
figure, imshow(gunsharp)
title('Realce 2')

%Filtro 3
h3 = fspecial('gaussian', [11 11], 2);
gg3 = imfilter(g, h3, 'replicate');
unshmask = g - gg3;
gunsharp = g + unshmask;
gunsharp = uint8(gunsharp);
figure, imshow(unshmask,[])
title('Imagem máscara unsharp e passa-baixas 3')
figure, imshow(gunsharp)
title('Realce 3')