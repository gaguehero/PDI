% at06_05[script]
clear all, close all, clc;
img = imread('cameraman.tif');
img2 = imread('image000.jpg');
%criando as 8 mascaras
maskarado0 = [-3 -3 5; -3 0 5; -3 -3 5]
maskarado1 = [-3 5 5; -3 0 5; -3 -3 -3]
maskarado2 = imrotate(maskarado0,90)
maskarado3 = imrotate(maskarado1,90)
maskarado4 = imrotate(maskarado2,90)
maskarado5 = imrotate(maskarado3,90)
maskarado6 = imrotate(maskarado4,90)
maskarado7 = imrotate(maskarado5,90)
%filtrando a imagem 1
kirschT(:,:,1) = imfilter(img,maskarado0)
kirschT(:,:,2) = imfilter(img,maskarado1)
kirschT(:,:,3) = imfilter(img,maskarado2)
kirschT(:,:,4) = imfilter(img,maskarado3)
kirschT(:,:,5) = imfilter(img,maskarado4)
kirschT(:,:,6) = imfilter(img,maskarado5)
kirschT(:,:,7) = imfilter(img,maskarado6)
kirschT(:,:,8) = imfilter(img,maskarado7)
%recebendo o max de cada pixel
kirsch = max(kirschT,[],3);

figure, imshow(img)
title('Original')
figure, imshow(kirsch)
title('Kirsch')

%filtrando a imagem 2
kirschT2(:,:,1) = imfilter(img2,maskarado0)
kirschT2(:,:,2) = imfilter(img2,maskarado1)
kirschT2(:,:,3) = imfilter(img2,maskarado2)
kirschT2(:,:,4) = imfilter(img2,maskarado3)
kirschT2(:,:,5) = imfilter(img2,maskarado4)
kirschT2(:,:,6) = imfilter(img2,maskarado5)
kirschT2(:,:,7) = imfilter(img2,maskarado6)
kirschT2(:,:,8) = imfilter(img2,maskarado7)
%recebendo o max de cada pixel
kirsch2 = max(kirschT2,[],3);

figure, imshow(img2)
title('Original')
figure, imshow(kirsch2)
title('Kirsch')