clear all, close all,  clc

a = zeros(1200);
b = zeros(1200);
for i=400:800
  for j=400:800
    a(i,j) = 1;
  endfor
endfor
for i=1:400
  for j=1:400
    b(i,j) = 1;
  endfor
endfor
c= imrotate(a,30);

figure, imshow(a),title(['A'], "fontsize", 18);
figure, imshow(b),title(['B'], "fontsize", 18);
figure, imshow(c),title(['C'], "fontsize", 18);

A = fft2(a);
B = fft2(b);
C = fft2(c);

Afts = fftshift(A);
Bfts = fftshift(B);
Cfts = fftshift(C);

figure,
imshow(mat2gray(log(1+abs(Afts)))),title(['Fourier A'], "fontsize", 18)
figure,
imshow(mat2gray(log(1+abs(Bfts)))),title(['Fourier B'], "fontsize", 18)
figure,
imshow(mat2gray(log(1+abs(Cfts)))),title(['Fourier C'], "fontsize", 18)