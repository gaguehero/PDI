clear all; close all; clc

rgb = imread...
('cherry01.jpg');
figure, imshow(rgb)

r = rgb(:,:,1);
g = rgb(:,:,2);
b = rgb(:,:,3);
r_g_b = [r g b]; %ver tb montage()
figure, imshow(r_g_b), title('r\_g\_b')


% Segmenta o objeto cherry
redcher = imsubtract(r, g); 
figure, imshow(redcher), title('canal R - canal G')
th = graythresh(redcher);
redcher_bw = im2bw(redcher, th);
figure, imshow(redcher_bw), title('BW mask')
redcher_bw2 = imfill(redcher_bw, 'holes');
figure, imshow(redcher_bw2), title('Fill holes em BW mask')

% Completamente escuro
redcher_bw2d = double(redcher_bw2);
redcher_bw2dn = ~redcher_bw2;
figure, imshow(redcher_bw2dn), title('NOT de BW Mask')
redcher_bw2d(redcher_bw2dn) = 0; % apenas onde não é objeto
figure, imshow(redcher_bw2d), title('Para atenuar canais R G B')
rgb3 =  double(rgb) .* repmat(redcher_bw2d, [1 1 3]);
rgb3 = uint8(rgb3);
figure, imshow(rgb3), title('Destaque na imagem RGB')

% Contorno verde
perim_bw = bwperim(redcher_bw2, 8);
figure, imshow(perim_bw), title('Perímetro de BW mask')
g_sat = g; %sat: saturado
g_sat(perim_bw) = 255;
r_sat = r; %sat: saturado
r_sat(perim_bw) = 255;
rgb2 = cat(3, r_sat, g_sat, b);
figure, imshow(rgb2), title('Perímetro na imagem RGB')