clear all; close all; clc
% Carregando a Imagem
g = imread('42049_20-200.png');
[lin,col]=size(g);
%figure; imshow(g)
vet=zeros(1,256)
%gSorted = sort(g)
acumulador=0

for k = min(g(:)):max(g(:))
  for i = 1:lin
    for j = 1:col
      if g(i,j)==k
        acumulador=acumulador+1
      endif
    endfor
  endfor
  vet(k)=acumulador
  acumulador=0
endfor

imhist(g)
axis "auto y"

figure, plot(vet)
xlim([0 255]), ylim("auto y")
grid on
title('Na unha')
xlabel('valor'), ylabel('ocorrências')

figure; imshow(g)