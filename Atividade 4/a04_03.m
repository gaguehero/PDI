clear all, close all, clc

%declarando parâmetros
g=imread('b5s.40.bmp')
g2=imread('b5s.100.bmp')
h = fspecial('average', [5 5]);
h2 = fspecial('average', [7 7]);

gg11=imfilter(g, h, 'symmetric');
gg12=imfilter(g, h2, 'symmetric');

gg21=imfilter(g2, h, 'symmetric');
gg22=imfilter(g2, h2, 'symmetric');

figure
subplot(2,3,1), imshow(g), title('b5s.40')
subplot(2,3,4), imshow(g2), title('b5s.100')
subplot(2,3,2), imshow(gg11), title('b5s.40 com filtro 5x5')
subplot(2,3,3), imshow(gg12), title('b5s.40 com filtro 7x7') 
subplot(2,3,5), imshow(gg21), title('b5s.100 com filtro 5x5')
subplot(2,3,6), imshow(gg22), title('b5s.100 com filtro 7x7')