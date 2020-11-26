%script cria lista
function y=crialista(tripa)
  [altura, largura] = size(tripa);
  corte = floor(altura/50);
  incremento = 0;
  for i=1:50
    retang = [0 incremento largura corte];
    pasta = imcrop(tripa,retang);
    incremento = (incremento + corte);
    valor(i) = encontraValor(pasta, largura, corte);
  endfor
y = valor;    
endfunction
