clear all; close all; clc

flag = 0
%selecionando se Canhoto ou Destro
while(!flag)
  fprintf('Tecle D para destro e C para canhoto\n')

  k = waitforbuttonpress;
  value = double(get(gcf,'CurrentCharacter'))

  if (value =='c')
    flag=1

  elseif (value =='d')
    flag=1
  else
    fprintf('Tecla inválida\n');
  end
end

%obtendo as imagens
g1 = imread('mug_01_01.png');
g2 = imread('mug_01_02.png');
g3 = imread('mug_01_03.png');
g4 = imread('mug_01_04.png');
g5 = imread('mug_01_05.png');
g6 = imread('mug_01_06.png');
g7 = imread('mug_01_07.png');
g8 = imread('mug_01_08.png');

coletaCanecas(:,:,1)=g1;
coletaCanecas(:,:,2)=g2;
coletaCanecas(:,:,3)=g3;
coletaCanecas(:,:,4)=g4;
coletaCanecas(:,:,5)=g5;
coletaCanecas(:,:,6)=g6;
coletaCanecas(:,:,7)=g7;
coletaCanecas(:,:,8)=g8;


%cropando as imagens
a=[90 130 500 330]
h1= imcrop(g1,a);
h2= imcrop(g2,a);
h3= imcrop(g3,a);
h4= imcrop(g4,a);
h5= imcrop(g5,a);
h6= imcrop(g6,a);
h7= imcrop(g7,a);
h8= imcrop(g8,a);

%chama subrotina de detecção da alça
bw1=detectaAlca(h1)
bw2=detectaAlca(h2)
bw3=detectaAlca(h3)
bw4=detectaAlca(h4)
bw5=detectaAlca(h5)
bw6=detectaAlca(h6)
bw7=detectaAlca(h7)
bw8=detectaAlca(h8)

%recropa novamente para centralizar melhor
b=[20 20 440 260]
cropbw(:,:,1) = imcrop(bw1,b);
cropbw(:,:,2) = imcrop(bw2,b);
cropbw(:,:,3) = imcrop(bw3,b);
cropbw(:,:,4) = imcrop(bw4,b);
cropbw(:,:,5) = imcrop(bw5,b);
cropbw(:,:,6) = imcrop(bw6,b);
cropbw(:,:,7) = imcrop(bw7,b);
cropbw(:,:,8) = imcrop(bw8,b);

%encontra primeiro pixel branco
[lin,col]=size(cropbw(:,:,1));
teste(1) = primeiropixel(cropbw(:,:,1),col,lin,value)
teste(2) = primeiropixel(cropbw(:,:,2),col,lin,value)
teste(3) = primeiropixel(cropbw(:,:,3),col,lin,value)
teste(4) = primeiropixel(cropbw(:,:,4),col,lin,value)
teste(5) = primeiropixel(cropbw(:,:,5),col,lin,value)
teste(6) = primeiropixel(cropbw(:,:,6),col,lin,value)
teste(7) = primeiropixel(cropbw(:,:,7),col,lin,value)
teste(8) = primeiropixel(cropbw(:,:,8),col,lin,value)

%Seleciona a Caneca
if(value=='d')
  flag=max(teste)
else
  flag=min(teste)
end
i=1
while(teste(i)!=flag)
  i++
end
j=8
while(teste(j)!=flag)
  j--
end
if (i!=j)
  s=sum(cropbw,[1 2])
  if (s(i)<s(j))
    i=j
  endif
endif
caneca_escolhida=coletaCanecas(:,:,i)
figure, imshow(caneca_escolhida)
fprintf('A caneca escolhida foi a %d para a opcção %c', i, value);
