clear all; close all; clc
I = imread('gDSC04422m16.png');
subplot (2,2,1)
imshow(I)
subplot (2,2,2)
imhist(I)
G=histeq(I,256)
subplot (2,2,3)
imshow(G)
subplot (2,2,4)
imhist(G)