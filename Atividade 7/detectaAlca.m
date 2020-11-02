function y = detectaAlca(h)

%utilizando o filtro tophat e depois ajustando o contraste
se = strel('disk',12,0);
tophatFiltered = imtophat(h,se);
contrastAdjusted = imadjust(tophatFiltered);

%passando a imagem para preto e branco com o Otsuo
th1 = graythresh(contrastAdjusted);
bw1 = im2bw(contrastAdjusted, th1);

th2 = graythresh(h);
bw2 = im2bw(h, th2);

bw=max(bw1,bw2);

SE = strel('square', 5);
bw1m1 = imclose(bw,SE);
bw1m2 = imopen(bw1m1,SE);

## % Labeling
##[rv8, nobj] = bwlabel(bw1, 8);
##% Aloca vetor para armazenar o número de pixels de cada objeto
##area = zeros(1,nobj);
##% Aloca cell array para armazenar os índices lineares de cada objeto
##linearIdx = cell(1,nobj);
##
##% Para cada objeto
##for k = 1:nobj
##    % Coordenadas lineares dos pixels do objeto k
##    linearIdx{k} = find(rv8==k);
##    % Número de pixels do objeto k
##    area(k) = length(linearIdx{k});
##end
##
##[ordenado, indexes] = sort(area); %indexes é o label
##
##% Apenas a maior área
##nobj2 = nobj-1;
##ordenado = ordenado(1:uint8(nobj2));
##indexes = indexes(1:uint8(nobj2));


% Elimina os outros objetos
##bw2 = bw1;
##for k = 1:length(ordenado)
##    bw2(linearIdx{indexes(k)}) =  0;
##end

  y=bw1m2
endfunction
