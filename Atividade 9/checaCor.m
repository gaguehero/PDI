function y = checaCor(pino, corte)
  nr = size(pino, 1);
  nc = size(pino, 2);
  
  corte = rgb2lab(corte);
  pino = rgb2lab(pino);
  
  r_crop = corte(:,:,1);
  r_crop_v = r_crop(:);
  % Interquartile mean
  N = length(r_crop_v);
  qb = round(N/4);
  qc = round(N/4*3);
  r_iqm = mean(r_crop_v(qb:qc));
  
  g_crop = corte(:,:,2);
  g_crop_v = g_crop(:);
  % Interquartile mean
  g_iqm = mean(g_crop_v(qb:qc));
  
  b_crop = corte(:,:,3);
  b_crop_v = b_crop(:);
  % Interquartile mean
  b_iqm = mean(b_crop_v(qb:qc));
  
  rgb_iqm = [r_iqm g_iqm b_iqm];
  rgb_iqm = double(repmat(rgb_iqm, nr*nc, 1));
  rgbCols = double(reshape(pino, nr*nc, 3));
  
  s = (rgb_iqm - rgbCols).^2;
  D = sqrt(sum(s,2));
  
  Dm = reshape(D,nr,nc);
  R = Dm < 28;
  #figure, imshow(R)
  y = sum(R(:));
endfunction
