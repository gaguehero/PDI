% at06_06[script]
clear all, close all, clc;
img = imread('cameraman.tif');

LoGer = edge (img, "LoG",[],1);
figure, imshow(LoGer)
title('Sigma 1')

LoGer = edge (img, "LoG",[],2);
figure, imshow(LoGer)
title('Sigma 2')

LoGer = edge (img, "LoG",[],4);
figure, imshow(LoGer)
title('Sigma 4')

LoGer = edge (img, "LoG",[],0.5);
figure, imshow(LoGer)
title('Sigma 1/2')

LoGer = edge (img, "LoG",[],0.25);
figure, imshow(LoGer)
title('Sigma 1/4')

LoGer = edge (img, "LoG",[],1.5);
figure, imshow(LoGer)
title('Sigma 1.5')

% O valor de sigma influencia fortemente na saída do detector de bordas.
% escolhas erradas podem gerar imagens totalmente escuras, assim como
% imagens cheias de falsos positivos. Por isso a escolha correta do 
% sigma correto é crucial para o detector funcionar corretamente.