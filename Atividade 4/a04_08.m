clear all, close all, clc

g1 = imread('flowervaseg.png');

mascara = fspecial('laplacian', 0)
mascarado = imfilter(g1,mascara)
soma=g1+mascarado
subtra=g1-mascarado

figure
subplot(2,2,1), imshow(g1), title('original')
subplot(2,2,2), imshow(mascarado), title('mascara desconhecida') 
subplot(2,2,3), imshow(soma), title('Teste Direta')
subplot(2,2,4), imshow(subtra), title('Teste Inversa')

%É o Laplace Inverso