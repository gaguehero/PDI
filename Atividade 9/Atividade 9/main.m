clear all; close all; clc

ig = imread('hanoi_01_01.png');
roda = imrotate(ig,-33);
##figure, imshow(roda)
rect = [278 355 445 200];
rodaCrop = imcrop(roda, rect);
##figure, imshow(rodaCrop)
rectP1 = [59 10 20 110];
Pino1 = imcrop(rodaCrop, rectP1);
##figure, imshow(Pino1)
rectP2 = [204 78 20 120];
Pino2 = imcrop(rodaCrop, rectP2);
##figure, imshow(Pino2)
rectP3 = [331 15 20 110];
Pino3 = imcrop(rodaCrop, rectP3);
##figure, imshow(Pino3)
rgb = Pino3;
amarelo = rgb(11:20,4:14,:);
vermelho = rgb(30:37,4:14,:);
azul = rgb(48:58,4:14,:);
verde = rgb(69:80,4:14,:);
laranja = rgb(90:100,4:14,:);

for n=1:35
  images(:,:,:,n) = imread(sprintf('hanoi_01_%02d.png',n));
end
for n = 1:35
  ig = images(:,:,:,n);
  roda = imrotate(ig,-33);
  #figure, imshow(roda)
  rect = [278 355 445 200];
  rodaCrop = imcrop(roda, rect);
  #figure, imshow(rodaCrop)
  rectP1 = [59 10 20 110];
  Pino1 = imcrop(rodaCrop, rectP1);
  #figure, imshow(Pino1)
  rectP2 = [204 78 20 120];
  Pino2 = imcrop(rodaCrop, rectP2);
  #figure, imshow(Pino2)
  rectP3 = [331 15 20 110];
  Pino3 = imcrop(rodaCrop, rectP3);
  #figure, imshow(Pino3)
  
  am(1) = checaCor(Pino1, amarelo);
  am(2) = checaCor(Pino2, amarelo);
  am(3) = checaCor(Pino3, amarelo);
  [val, id(n,1)] = max(am, [], 2);
  
  verm(1) = checaCor(Pino1, vermelho);
  verm(2) = checaCor(Pino2, vermelho);
  verm(3) = checaCor(Pino3, vermelho);
  [val, id(n,2)] = max(verm, [], 2);
  
  az(1) = checaCor(Pino1, azul);
  az(2) = checaCor(Pino2, azul);
  az(3) = checaCor(Pino3, azul);
  [val, id(n,3)] = max(az, [], 2);
  
  verd(1) = checaCor(Pino1, verde);
  verd(2) = checaCor(Pino2, verde);
  verd(3) = checaCor(Pino3, verde);
  [val, id(n,4)] = max(verd, [], 2);
  
  lar(1) = checaCor(Pino1, laranja);
  lar(2) = checaCor(Pino2, laranja);
  lar(3) = checaCor(Pino3, laranja);
  [val, id(n,5)] = max(lar, [], 2);
endfor
save('resultados.mat','id');