clear all, close all, clc
%Cria imagem
nr = 16; nc = 16;
a = triu(ones(nr,nc))*64;
b = tril(ones(nr,nc),-1)*192;
g = uint8(a+b);
%Média zero e desvio padrão 20
gg = imnoise(g,'gaussian',...
    (0/255),(20/255)^2);
%Filtro media
gMedia=gg
for i= 2:15
  for j=2:15
    h=reshape(gg(i-1:i+1,j-1:j+1),1,[])
    h=mean(h);
    gMedia(i,j)=uint8(h);
  end
end
figure, image(g), colormap(gray(256))
title('Original','FontWeight','bold')
figure, image(gg), colormap(gray(256))
title('Com ruído','FontWeight','bold')
figure, mesh(double(g),'EdgeColor','black')
title('Original','FontWeight','bold')
figure, mesh(double(gg),'EdgeColor','black')
title('Com ruído','FontWeight','bold')
figure, mesh(double(gMedia),'EdgeColor','black')
title('Com ruído','FontWeight','bold')
x = 1:size(g,2);
i = ceil(size(g,1)/2);
figure
plot(x,g(i,:),x,gg(i,:),x,gMedia(i,:)),
legend('Original','Com ruído','Media 3x3')
title(['Perfil da linha ',...
    num2str(i)],'FontWeight','bold')
