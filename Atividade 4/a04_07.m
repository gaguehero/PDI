clear all, close all, clc

%filtro mediana 
g=imread('salt-and-pepper1.tif')
gMed=zeros(256)

for i= 2:255
  for j=2:255
    h=reshape(g(i-1:i+1,j-1:j+1),1,[])
    h=median(h);
    gMed(i,j)=uint8(h);
  end
end
imshow(uint8(gMed))
