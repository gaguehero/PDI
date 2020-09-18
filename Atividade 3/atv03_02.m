
%Sigmoid
%Aloca uint8
%para depois usar funcao intlut (y1 é a LUT)
%Equação da sigmoide
clear all; close all; clc
slope = 0.05;
inflec = 127;
x = 0:1:255;
y1 = 1./(1 + exp(-slope*(x - inflec)));
%O mat2gray está sendo utilizado como normalizador de escala para que a 
%plotagem ocorra de maneira correta e retire o 1 somado na exp.
y1n = mat2gray(y1);
y1n = uint8(y1.*255);
%Display
figure, plot(y1n)
xlim([0 255]), ylim([0 255])
grid on
title('Sigmoide')
xlabel('x'), ylabel('y')

% Carregando a Imagem
g = imread('vpfig.png');
figure; imshow(g)

% Aplicando as equações na imagem
gt = intlut(g,y1n);
figure, imshow(gt)

%%%%%%%%%%%%%%% slope = 0.03 %%%%%%%%%%%%%%%%%%%%
slope = 0.03;
y2 = 1./(1 + exp(-slope*(x - inflec)));
y2n = mat2gray(y2);
y2n = uint8(y2.*255);
%Display
figure, plot(y2n)
xlim([0 255]), ylim([0 255])
grid on
title('Sigmoide 2')
xlabel('x'), ylabel('y')
% Aplicando as equações na imagem
gt2 = intlut(g,y2n);
figure, imshow(gt2)

%%%%%%%%%%%%%%% slope = 0.09 %%%%%%%%%%%%%%%%%%%%
slope = 0.09;
y3 = 1./(1 + exp(-slope*(x - inflec)));
y3n = mat2gray(y3);
y3n = uint8(y3.*255);
%Display
figure, plot(y3n)
xlim([0 255]), ylim([0 255])
grid on
title('Sigmoide 3')
xlabel('x'), ylabel('y')
% Aplicando as equações na imagem
gt3 = intlut(g,y3n);
figure, imshow(gt3)


