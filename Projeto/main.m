clear all; close all; clc

%%Selecionar o tipo de prova
##tipoProva=1 -> 4;
##if(tipoProva==1)
##  gabarito = imread('Scan7-1.jpg');
##endif
##if(tipoProva==2)
##  gabarito = imread('Scan7-1.jpg');
##endif
##if(tipoProva==3)
##  gabarito = imread('Scan7-1.jpg');
##endif
##if(tipoProva==4)
##  gabarito = imread('Scan7-1.jpg');
##endif

respostas = imread('Scan23-1.jpg');
gabarito = imread('Scan24-1.jpg');

gabaritoL = cropa(gabarito);
respostasL = cropa(respostas);

listaG = crialista(gabaritoL);
listaR = crialista(respostasL);

acertos=0;
brancos=0;
nulos=0;
for i =1:50
  if (listaR(i)==0)
    brancos++;
  elseif (listaR(i)==6)
    nulos++;
  elseif(listaG(i)==listaR(i))
    acertos++;
  endif
endfor

validas = 0;
for i=1:50
  if((listaG(i)>0) && (listaG(i)<6))
    validas++;
  endif
endfor

nota = (acertos/validas)*10;
save('resultados.mat','listaG','listaR');
fprintf('O aluno teve %d acertos de %d válidas presentes no gabarito\nO aluno marcou %d respostas em branco e %d nulas, \nresultando na nota %.3d \n',acertos,validas,brancos,nulos, nota);