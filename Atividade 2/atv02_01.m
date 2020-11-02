close all; clear all; clc;
G = imread('cameraman.tif');
nr = size(G,1); %extrai o numero de linhas da imagem
nc = size(G,2); %extrai o número de colunas da imagem
[X,Y] = meshgrid(1:nr,1:nc); %cria um grid do tamanho da imagem
N = nr*nc; %número de pixels da imagem
I = [X(:)'; %Matriz formada por coordenadas da imagem e uma linha de 1's
 Y(:)';
 ones(1,N)];
ang = 30*pi/180; %angulo para a rotação da imagem
T = [ cos(ang) sin(ang) 0; %matriz de transformação da imagem
 -sin(ang) cos(ang) 0;
 0 0 1];
K = T*I; %multiplicação para definir as novas posições dos píxels pós rotação
temp1 = min(K, [], 2); %mínimo de x, y e da linha antiga de 1's
m = repmat(temp1, 1, N); %copiou o vetor mínimo N vezes
temp2 = K - m; %uma especie de normalização da matriz transformadora
Kadj = 1 + floor(temp2); %pixels são discretos, portanto arredondamento para baixo
nrOut = max(Kadj(1,:)); %novo número de linhas
ncOut = max(Kadj(2,:)); %novo número de colunas
Gout = uint8(zeros(nrOut, ncOut)); %matriz zerada de tamanho nrOutXncOut
for k = 1:length(Kadj)
 Gout(Kadj(1,k), Kadj(2,k)) = G(I(1,k), I(2,k)); %cálculo das novas posições dos píxels
end
imshow(Gout); %saída é a imagem cameraman.tif rotacionada em 30 graus

%a falta de um processo melhor de interpolação faz com que a imagem de saída
%perca qualidade e apresente uma série de buracos.