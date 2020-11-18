% color_01 [script]
clear all; close all; clc

grayAviao = imread('f3_p3_knife_plane_drop_dy_2-22.jpg');
th = graythresh(grayAviao);
bw1 = im2bw(grayAviao, th);
bw1 = ~bw1; %inverte

grayd = mat2gray(grayAviao); %double [0...1] 
aviao2 = mat2gray(bw1);
aviao2 = imsubtract(grayd, aviao2);

#Inteiros para aplicar colormap
gray = uint8(aviao2.*255); 
figure, imshow(gray), title('gray')
c1 = colormap(jet(64));
%imwrite(gray, c1, 'colormapAviao.png');

c2 = uint8(1:255);
c2 = c2.';
c3 = cat(2,c2,c2);
c3 = cat(2,c3,c2);
c3 = mat2gray(c3);
mapa = cat(1,c1,c3);

se = strel ('disk',15,0);

tophat = imtophat(grayAviao, se);

tophat1 =im2double(tophat);

tophat2 = tophat1>0.1;
se = strel ("rectangle", [15 2]);
tophat2 = imopen(tophat2,se);
se = strel ("square", 3);
tophat2 = imclose(tophat2, se);
se = strel ("disk", 5,0);
tophat2 = imclose(tophat2, se);
tophat3 = imfill(tophat2, 'holes');

 % Labeling
[rv8, nobj] = bwlabel(tophat3, 8);

% Aloca vetor para armazenar o número de pixels de cada objeto
area = zeros(1,nobj);
% Aloca cell array para armazenar os índices lineares de cada objeto
linearIdx = cell(1,nobj);

% Para cada objeto
for k = 1:nobj
    % Coordenadas lineares dos pixels do objeto k
    linearIdx{k} = find(rv8==k);
    % Número de pixels do objeto k
    area(k) = length(linearIdx{k});
end

[ordenado, indexes] = sort(area); %indexes é o label

% Apenas as 70% menores áreas
nobj2 = nobj*0.9;
ordenado = ordenado(1:uint8(nobj2));
indexes = indexes(1:uint8(nobj2));

% Elimina os 70% objetos menores
bw2 = tophat3;
for k = 1:length(ordenado)
    bw2(linearIdx{indexes(k)}) =  0;
end

bw2 = ~bw2;

for i = 1:1600
  for j= 1:2560
    if (bw2(i,j)==1)
      gray(i,j)=(gray(i,j)/4);
    else
      gray(i,j)=(tophat(i,j)+64);
    endif
  endfor
endfor

figure, imshow(gray, mapa);
