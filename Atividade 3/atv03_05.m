clear all; close all; clc
I = imread('gDSC04422m16.png');
imshow(I)

Y=imhist(I)
Ys=Y/(240*320)
G=cumsum(Ys)
G=uint8(G*255)

S=intlut(I,G)
subplot(2,2,1)
imshow(S)
subplot(2,2,2)
imhist(S)

H=histeq(I,256)
subplot(2,2,3)
imshow(H)
subplot(2,2,4)
imhist(H)

%145 está para 255 assim como Pixel está para X%
%Pixel da escala nova é igual ao Pixel da escala antiga multiplicado pelo
%delta antigo dividido pelo delta novo;
%vet=(1:256)
%vet= ((vet-1)*255)/144
%for i=1:256
%  if vet(i)> 255
%    vet(i)=0
%  endif
%endfor
%vetUint=uint8(vet)

%G = intlut(I,vetUint)
%subplot (2,3,3)
%imshow(G)
%subplot (2,3,4)
%imhist(G)

