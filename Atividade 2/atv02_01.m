close all; clear all; clc;
G = imread('cameraman.tif');
nr = size(G,1); %extrai o numero de linhas da imagem
nc = size(G,2); %extrai o n�mero de colunas da imagem
[X,Y] = meshgrid(1:nr,1:nc); %cria um grid do tamanho da imagem
N = nr*nc; %n�mero de pixels da imagem
I = [X(:)'; %Matriz formada por coordenadas da imagem e uma linha de 1's
 Y(:)';
 ones(1,N)];
ang = 30*pi/180; %angulo para a rota��o da imagem
T = [ cos(ang) sin(ang) 0; %matriz de transforma��o da imagem
 -sin(ang) cos(ang) 0;
 0 0 1];
K = T*I; %multiplica��o para definir as novas posi��es dos p�xels p�s rota��o
temp1 = min(K, [], 2); %m�nimo de x, y e da linha antiga de 1's
m = repmat(temp1, 1, N); %copiou o vetor m�nimo N vezes
temp2 = K - m; %uma especie de normaliza��o da matriz transformadora
Kadj = 1 + floor(temp2); %pixels s�o discretos, portanto arredondamento para baixo
nrOut = max(Kadj(1,:)); %novo n�mero de linhas
ncOut = max(Kadj(2,:)); %novo n�mero de colunas
Gout = uint8(zeros(nrOut, ncOut)); %matriz zerada de tamanho nrOutXncOut
for k = 1:length(Kadj)
 Gout(Kadj(1,k), Kadj(2,k)) = G(I(1,k), I(2,k)); %c�lculo das novas posi��es dos p�xels
end
imshow(Gout); %sa�da � a imagem cameraman.tif rotacionada em 30 graus

%a falta de um processo melhor de interpola��o faz com que a imagem de sa�da
%perca qualidade e apresente uma s�rie de buracos.