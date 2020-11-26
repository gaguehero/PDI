%script crop e tratamento inicial 
function y=cropa(rgb)

##[altura, largura,p] = size(rgb);
##rec = [50 50    largura-101 altura-101];
##rgbC = imcrop(rgb,rec);

BW = roicolor(rgb,0,40);

BW_final = max(BW,[],3);

SE = strel('disk',15,0);
bw1m = imclose(BW_final, SE);

[row,col] = find(bw1m);

minR = min(row);
minC = min(col);
maxR = max(row);
maxC = max(col);

rec = [minC minR   (maxC-minC) (maxR-minR)];
limpa = imcrop(bw1m,rec);

[altura, largura] = size(limpa);
rec = [30 30    largura-51 altura-51];
limpaC = imcrop(limpa,rec);

[altura, largura] = size(limpaC);
quadrantes = floor(largura/12);
faixa1 = imcrop(limpaC, [0 0 6*quadrantes altura]);
faixa2 = imcrop(limpaC, [6*quadrantes 0 6*quadrantes-1 altura]);
lista=cat(1,faixa1, faixa2);
y=lista;
endfunction
