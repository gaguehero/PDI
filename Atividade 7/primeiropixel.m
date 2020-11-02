function y=primeiropixel(img,col,lin,tipo)


if(tipo=='c')
val=col
  for j = 1:col
    for i = 1:lin
      if(img(i,j))
        if(val>j)
          val=j
        endif
        break
      endif
    endfor
  endfor
else
val=0
  for j = col:-1:1
    for i = lin:-1:1
      if(img(i,j))
        if(val<j)
          val=j
        endif
        break
      endif
    endfor
  endfor
end
y=val;
endfunction