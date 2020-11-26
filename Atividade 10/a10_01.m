clear all, close all,  clc
 
f = imread('cameraman.tif');
fd = double(f);
% DFT 2D
F = fft2(fd);
dftr = fft(fd,[],1);
F2 = fft(dftr,[],2);
% Reposicionamento (shifiting)
F = fftshift(F);
F2 = fftshift(F2);
figure, imshow(f)
title('Imagem de entrada')
figure,
imshow(mat2gray(log(1+abs(F2))))
title('DFT sem fft2')
figure,
imshow(mat2gray(log(1+abs(F))))
title('DFT com fft2')