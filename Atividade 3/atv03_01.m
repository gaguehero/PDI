%Piecewise Linear
%Aloca uint8
%para depois usar funcao intlut (y1 � a LUT)
clear all; close all; clc
y1 = uint8(zeros([1 256]));
%Equa��o da reta inferior y = (1/3)*x
y1(1:97) = (1/3)*(0:96);
%Equa��o da reta intermedi�ria y = 3*x
-256
y1(98:161) = 3*(97:160) - 256;
%Equa��o da reta superior y = (1/3)*x +
170
y1(162:256) = (1/3)*(161:255) + 170;
%Display
figure, plot(y1)
xlim([0 255]), ylim([0 255])
grid on
title('Piecewise linear')
xlabel('x'), ylabel('y')

% Carregando a Imagem
g = imread('vpfig.png');
figure; imshow(g)

% Aplicando as equa��es na imagem
gt = intlut(g,y1);
figure, imshow(gt);