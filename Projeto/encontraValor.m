%script encontra valor
function y=encontraValor(img,Lar,Halt)
  quadrantes = floor(Lar/6);

  a = imcrop(img, [quadrantes 0 quadrantes Halt]);
  b = imcrop(img, [2*quadrantes 0 quadrantes Halt]);
  c = imcrop(img, [3*quadrantes 0 quadrantes Halt]);
  d = imcrop(img, [4*quadrantes 0 quadrantes Halt]);
  e = imcrop(img, [5*quadrantes 0 Lar Halt]);
##  figure, imshow (a)
##  figure, imshow (b)
##  figure, imshow (c)
##  figure, imshow (d)
##  figure, imshow (e)
  #detectar presença de marcação a partir de um dado limiar
  areasS(1) = sum(a(:));
  areasS(2) = sum(b(:));
  areasS(3) = sum(c(:));
  areasS(4) = sum(d(:));
  areasS(5) = sum(e(:));
  resposta = 0;
  for i = 1:5
    if(areasS(i)>2000)
      if(resposta>0)
        resposta = 6;
      else
        resposta = i;
      endif
    endif
  endfor
  y=resposta;
endfunction
