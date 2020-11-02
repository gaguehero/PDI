clear all; close all; clc

base = imread('image000.jpg');
im1 = imread('image001.jpg');
im2 = imread('image002.jpg');
im3 = imread('image003.jpg');
im4 = imread('image004.jpg');
im5 = imread('image005.jpg');

MSE0=immse(base,base);
[SSIM0,map]=ssim_index(base,base);
#Imagem 0: MSE=0 e SSIM=1
figure
subplot(3,4,1), imshow(base), title('Imagem0')
subplot(3,4,2), imshow(map), title('Index Map')


MSE1=immse(base,im1);
[SSIM1,map]=ssim_index(base,im1);
#Imagem 1: MSE=144.01 e SSIM=0.98780

subplot(3,4,3), imshow(im1), title('Imagem1')
subplot(3,4,4), imshow(map), title('Index Map')

MSE2=immse(base,im1);
[SSIM2,map]=ssim_index(base,im2);
#Imagem 2: MSE=144.01 e SSIM=0.88293

subplot(3,4,5), imshow(im2), title('Imagem2')
subplot(3,4,6), imshow(map), title('Index Map')


MSE3=immse(base,im1);
[SSIM3,map]=ssim_index(base,im3);
#Imagem 3: MSE=144.01 e SSIM=0.86391

subplot(3,4,7), imshow(im3), title('Imagem3')
subplot(3,4,8), imshow(map), title('Index Map')


MSE4=immse(base,im1);
[SSIM4,map]=ssim_index(base,im4);
#Imagem 4: MSE=144.01 e SSIM=0.73680

subplot(3,4,9), imshow(im4), title('Imagem4')
subplot(3,4,10), imshow(map), title('Index Map')


MSE5=immse(base,im1);
[SSIM5,map]=ssim_index(base,im5);
#Imagem 5: MSE=144.01 e SSIM=0.71071

subplot(3,4,11), imshow(im5), title('Imagem5')
subplot(3,4,12), imshow(map), title('Index Map')


#Funcionou, o MSSIM é melhor que o MSE pois, como explicado no pdf, 
#tenta reproduzir mais fielmente o funcionamento da visão humana,
#criando assim uma medida objetiva para uma persepção subjetiva.
#Para isso ele faz uso de medições locais, enquanto o MSE analisa a
#imagem globalmente. Isso se dá uma vez que o olho humano consegue focar
#apenas em pontos pequenos por vez, e essa subjetividade altera a 
#forma como o mesmo percebe a imagem.