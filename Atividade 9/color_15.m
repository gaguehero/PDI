clear all; close all; clc

ig = imread('hanoi_01_01.png');

roda = imrotate(ig,-33);
figure, imshow(roda)

rect = [278 355 445 200];
rodaCrop = imcrop(roda, rect);
figure, imshow(rodaCrop)

rectP1 = [59 10 20 110];

Pino1 = imcrop(rodaCrop, rectP1);
figure, imshow(Pino1)

rectP2 = [204 78 20 120];

Pino2 = imcrop(rodaCrop, rectP2);
figure, imshow(Pino2)

rectP3 = [331 15 20 110];

Pino3 = imcrop(rodaCrop, rectP3);
figure, imshow(Pino3)


rgb = Pino3;

% allColors32 é uma imagem RGB (8 bits/pixel) com todas as cores possíveis
% como se estivéssemos usando 5 bits/pixel. Número de cores diferentes

[x1, map] = cmunique(rgb);
n_rgb = size(map, 1); %número de cores em rgb
figure, imshow(rgb), title('rgb')

% Quantização uniforme: o mínimo possível é quantizar cada canal em apenas
% dois valores. Isso dá 2*2*2 = 8.
levels = [255*1/3 255*2/3]; %3 niveis por canal = 27 cores
values = [255*1/6 255*3/6 255*5/6]; %cor é do centro do cubo quantiz.
r = rgb(:,:,1);
g = rgb(:,:,2);
b = rgb(:,:,3);
h = fspecial('gaussian', [5 5], 1);
r = imfilter(r, h);
g = imfilter(g, h);
b = imfilter(b, h);

rq = imquantize(r, levels, values);
gq = imquantize(g, levels, values);
bq = imquantize(b, levels, values);
rq = uint8(rq);
gq = uint8(gq);
bq = uint8(bq);
rgb_q = cat(3, rq, gq, bq);
figure, imshow(rgb_q), title('x1 map1')
[x1, map1] = cmunique(rgb_q);
n_map1 = size(map1, 1);
pc = label2rgb(x1);

verde = map1(3,:);
vermelho = map1(7,:);
laranja = map1(8,:);
amarelo = map1(10,:);
azul = map1(2,:);

